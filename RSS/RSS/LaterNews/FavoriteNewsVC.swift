//
//  FavoriteVC.swift
//  RSS
//
//  Created by Nor1 on 07.02.2023.
//

import Foundation
import UIKit
import SnapKit

class FavoriteNewsVC: UIViewController {
    private let viewModel: FavoriteNewsViewModel
    private let sideMenu = ContainerVC()
    private lazy var menuButton: UIBarButtonItem = {
        let view = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .plain, target: self, action: #selector(menuTapped))
        view.tintColor = Constants.Colors.grey
        return view
    }()
    
    init(viewModel: FavoriteNewsViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.Colors.backgroundWhite
        setupViews()
        makeConstraints()
        setupGestures()
    }
    private func setupViews(){
        view.addSubview(sideMenu.view)
        navigationItem.setLeftBarButton(menuButton, animated: false)
        sideMenu.delegateSideMenu = self
        navigationItem.setTitleSubtitle(sub: "Избранное")
    }
    private func makeConstraints(){

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
//            self.view.backgroundColor = Constants.Colors.grey
//            self.collectionView.backgroundColor = Constants.Colors.grey
//            self.collectionView.layer.opacity = 0.5
            self.menuButton.isEnabled = false
        }
    }
    @objc private func swipedLeft(){
        sideMenu.hide()
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseInOut){
            self.navigationController?.navigationBar.layer.opacity = 1
//            self.collectionView.backgroundColor = Constants.Colors.backgroundWhite
//            self.view.backgroundColor = Constants.Colors.backgroundWhite
//            self.collectionView.layer.opacity = 1
            self.menuButton.isEnabled = true
        }
    }
    private func reloadMenu(){
        sideMenu.reloadMenu()
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseInOut){
            self.navigationController?.navigationBar.layer.opacity = 1
//            self.collectionView.backgroundColor = Constants.Colors.backgroundWhite
//            self.view.backgroundColor = Constants.Colors.backgroundWhite
//            self.collectionView.layer.opacity = 1
            self.menuButton.isEnabled = true
        }
    }
}

extension FavoriteNewsVC: SideMenuDelegate {
    func openItem(item: String) {
        switch item {
        case "Лента":
            navigationController?.popToRootViewController(animated: true)
            reloadMenu()
        case "Избранное":
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

