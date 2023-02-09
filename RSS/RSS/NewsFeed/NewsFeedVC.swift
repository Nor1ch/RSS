//
//  NewsFeedVC.swift
//  RSS
//
//  Created by Nor1 on 06.02.2023.
//

import Foundation
import UIKit
import Combine

class NewsFeedVC: UIViewController {
    private let viewModel: NewsFeedViewModel
    private var sideMenu = ContainerVC()
    private var array: [NewsModelToShow] = []
    private var cancelable: Set<AnyCancellable> = []
    
    private lazy var menuButton: UIBarButtonItem = {
        let view = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .plain, target: self, action: #selector(menuTapped))
        view.tintColor = Constants.Colors.grey
        return view
    }()
    private lazy var addSourceButton: UIBarButtonItem = {
        let view = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(menuTapped))
        view.tintColor = Constants.Colors.grey
        return view
    }()
    
    private var collectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        flow.minimumLineSpacing = 20
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: flow)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constants.Colors.backgroundWhite
        view.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 60, right: 15)
        return view
    }()
    
    private lazy var indicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.color = Constants.Colors.lightGreen
        view.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        return view
    }()
    
    init(viewModel: NewsFeedViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        setupViews()
        makeConstraints()
        setupGestures()
        binding()
        navigationItem.setTitleSubtitle(sub: "Лента")
        view.backgroundColor = Constants.Colors.backgroundWhite
    }
    
    private func binding(){
        viewModel.$newsArray
            .sink { array in
                if !array.isEmpty {
                self.array = array
                self.collectionView.reloadData()
                self.indicator.stopAnimating()
                    }
                }
            .store(in: &cancelable)
    }
    
    private func setupViews(){
        view.addSubview(collectionView)
        view.addSubview(sideMenu.view)
        collectionView.addSubview(indicator)
        indicator.startAnimating()
        collectionView.register(CustomCell.self,
                                forCellWithReuseIdentifier: CustomCell.identifire)
        collectionView.register(HeaderCollectionView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: HeaderCollectionView.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        sideMenu.delegateSideMenu = self
        navigationItem.setLeftBarButton(menuButton, animated: false)
        navigationItem.setRightBarButton(addSourceButton, animated: false)
    }
    private func makeConstraints(){
        indicator.snp.makeConstraints { make in
            make.centerY.equalTo(self.view.snp.centerY)
            make.centerX.equalTo(self.view.snp.centerX)
        }
        collectionView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalToSuperview()
        }
    }
    private func setupGestures(){
        let tapSwipedLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipedLeft))
        tapSwipedLeft.direction = .left
        tapSwipedLeft.cancelsTouchesInView = false
        view.addGestureRecognizer(tapSwipedLeft)
        
        let tapSwipedRight = UISwipeGestureRecognizer(target: self, action: #selector(menuTapped))
        tapSwipedRight.direction = .right
        tapSwipedRight.cancelsTouchesInView = false
        view.addGestureRecognizer(tapSwipedRight)
    }
    
    @objc private func menuTapped(){
        sideMenu.show()
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseInOut){
            self.navigationController?.navigationBar.layer.opacity = 0
            self.view.backgroundColor = Constants.Colors.grey
            self.collectionView.backgroundColor = Constants.Colors.grey
            self.collectionView.layer.opacity = 0.5
            self.menuButton.isEnabled = false
        } 
    }
    @objc private func swipedLeft(){
        sideMenu.hide()
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseInOut){
            self.navigationController?.navigationBar.layer.opacity = 1
            self.collectionView.backgroundColor = Constants.Colors.backgroundWhite
            self.view.backgroundColor = Constants.Colors.backgroundWhite
            self.collectionView.layer.opacity = 1
            self.menuButton.isEnabled = true
        }
    }
}

extension NewsFeedVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifire, for: indexPath) as? CustomCell
        let item = array[indexPath.row]
        cell?.makeCell(title: item.title, description: item.description, source: item.source, date: item.date, image: item.image)
        cell?.delegateButtonTapped = self
        cell?.setupLayouts(view: collectionView)
        return cell ?? UICollectionViewCell()
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.collectionView.collectionViewLayout.invalidateLayout()
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        if kind == UICollectionView.elementKindSectionHeader {
//            return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionView.identifier, for: indexPath)
//        } else {
//            return UICollectionReusableView()
//        }
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: UIScreen.main.bounds.width, height: 21)
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(array[indexPath.row])
    }
}

extension NewsFeedVC: SideMenuDelegate {
    func openItem(item: String) {
        switch item {
        case "Лента":
            swipedLeft()
        case "Избранное":
            viewModel.openFavorites()
            swipedLeft()
        case "Прочитать позже":
            viewModel.openLater()
            swipedLeft()
        case "Ваши подписки":
            print("Subscriptions")
        default:
            break
        }
    }
}

extension NewsFeedVC: GestureColletionViewCellDelegate {
    func buttonPressed(string: String) {
        switch string {
        case "fav":
            print("delegate fav")
        case "share":
            print("delegate share")
        case "later":
            print("delegate later")
        default:
            break
        }
    }
    
    
}
