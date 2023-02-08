//
//  HeaderColletionView.swift
//  RSS
//
//  Created by Nor1 on 08.02.2023.
//

import Foundation
import UIKit
import SnapKit

class HeaderCollectionView: UICollectionReusableView {
    static let identifier = "HeaderCollectionView"
    
    private lazy var collectionTitle: UILabel = {
        let view = UILabel()
        view.text = "Лента"
        view.font = Constants.Fonts.titleHearedOpenSans_Light32
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupViews(){
        addSubview(collectionTitle)
    }
    private func makeConstraints(){
        collectionTitle.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
