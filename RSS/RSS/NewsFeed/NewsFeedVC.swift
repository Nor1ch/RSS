//
//  NewsFeedVC.swift
//  RSS
//
//  Created by Nor1 on 06.02.2023.
//

import Foundation
import UIKit

class NewsFeedVC: UIViewController {
    
    private let viewModel: NewsFeedViewModel
    
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
        view.backgroundColor = Constants.Colors.backgroundWhite
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifire)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.alwaysBounceVertical = true
    }
    
    private func setupViews(){
        view.addSubview(collectionView)
    }
    private func makeConstraints(){
        collectionView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalToSuperview()
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
