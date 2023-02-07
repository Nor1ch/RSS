//
//  ContainerVC.swift
//  RSS
//
//  Created by Nor1 on 07.02.2023.
//

import Foundation
import UIKit
import SnapKit

class ContainerVC: UIViewController {
    private let idCell = "ID"
    private let array: [String] = ["Лента", "Избранное", "Прочитать позже", "Ваши подписки"]
    private var leadingConstraint: NSLayoutConstraint!
    
    private lazy var headerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constants.Colors.white
        return view
    }()
    
    private lazy var userImage: UIImageView = {
       let view = UIImageView()
        view.layer.borderWidth = 2
        view.layer.masksToBounds = false
        view.layer.borderColor = Constants.Colors.lightGreen?.cgColor
        view.layer.cornerRadius = 40
        view.clipsToBounds = true
        view.image = UIImage(systemName: "person")
        return view
    }()
    
    private lazy var userName: UILabel = {
        let view = UILabel()
        view.text = "Илья Черепанин"
        view.font = Constants.Fonts.userNameOpenSans20
        return view
    }()
    private lazy var userEmail: UILabel = {
        let view = UILabel()
        view.text = "iliacherepanin@gmail.com"
        view.textColor = Constants.Colors.grey
        view.font = Constants.Fonts.userEmailOpenSans16
        return view
    }()
    
    private lazy var stackUser: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = Constants.Colors.white
        view.addArrangedSubview(userName)
        view.addArrangedSubview(userEmail)
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.spacing = 4
        return view
    }()
    
    private lazy var tableViewMenu: UITableView = {
       let view = UITableView()
        view.separatorStyle = .none
        view.rowHeight = 60
        view.backgroundColor = Constants.Colors.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sideMenu: UIView = {
       let view = UIView()
        view.backgroundColor = Constants.Colors.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerView)
        view.addSubview(tableViewMenu)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVews()
        makeConstraints()
    }
    
    private func setupVews() {
        view.addSubview(sideMenu)
        headerView.addSubview(userImage)
        headerView.addSubview(stackUser)
        tableViewMenu.dataSource = self
        tableViewMenu.register(UITableViewCell.self, forCellReuseIdentifier: idCell)
        view.frame.origin.x = -UIScreen.main.bounds.width
    }
    private func makeConstraints(){
        headerView.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(25)
            make.height.equalTo(160)
            make.left.equalToSuperview().offset(25)
        }
        tableViewMenu.snp.makeConstraints { make in
            make.right.bottom.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom).offset(40)
            make.left.equalToSuperview()
        }
        stackUser.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(15)
            make.left.equalToSuperview()
        }
        userImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.left.equalToSuperview().offset(5)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        
        
        sideMenu.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        leadingConstraint = sideMenu.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -view.frame.size.width)
        leadingConstraint.isActive = true
        sideMenu.widthAnchor.constraint(equalToConstant: view.frame.size.width * 0.7).isActive = true
        sideMenu.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    func show(){
        view.frame.origin.x = 0
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseInOut){
            self.leadingConstraint.constant = 0
            self.view?.layer.opacity = 1
            self.view.layoutIfNeeded()
        }
    }
    func hide(){
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseInOut){
            self.leadingConstraint.constant = -self.view.frame.width
            self.view?.layer.opacity = 0.5
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.view.frame.origin.x = -self.view.frame.width
        }
    }
}
extension ContainerVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewMenu.dequeueReusableCell(withIdentifier: self.idCell)
        let item = array[indexPath.row]
        cell?.textLabel?.text = item
        cell?.textLabel?.font = Constants.Fonts.burgerMenuItemOpenSans_Light18
        return cell ?? UITableViewCell()
    }
    
    
}
