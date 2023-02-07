//
//  NewsFeedVC.swift
//  RSS
//
//  Created by Nor1 on 06.02.2023.
//

import Foundation
import UIKit

class NewsFeedVC: UIViewController {
    weak var delegateSideMenu: SideMenuDelegate?
    private let viewModel: NewsFeedViewModel
    private let sideMenu = ContainerVC()
    
    private lazy var menuButton: UIBarButtonItem = {
        let view = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .plain, target: self, action: #selector(menuTapped))
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
        view.contentInset = UIEdgeInsets(top: 15, left: 15, bottom: 10, right: 15)
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
        view.backgroundColor = Constants.Colors.backgroundWhite
    }
    
    private func setupViews(){
        view.addSubview(collectionView)
        view.addSubview(sideMenu.view)
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifire)
        collectionView.dataSource = self
        collectionView.delegate = self
        navigationItem.setLeftBarButton(menuButton, animated: false)
    }
    private func makeConstraints(){
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
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifire, for: indexPath) as? CustomCell
        cell?.setupLayouts(view: collectionView)
        return cell ?? UICollectionViewCell()
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.collectionView.collectionViewLayout.invalidateLayout()
    }
}
