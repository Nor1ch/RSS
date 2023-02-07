//
//  CustomCell.swift
//  RSS
//
//  Created by Nor1 on 06.02.2023.
//

import Foundation
import UIKit
import SnapKit

class CustomCell: UICollectionViewCell {
    static let identifire = "CustomCell"
    
    
    var imageViewNews: UIImageView = {
       let view = UIImageView()
        view.image = UIImage(systemName: "heart")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    var titleNews: UILabel = {
        let view = UILabel()
        view.text = "Самое зрелищное шоу пройдет сегодня в Москве"
        view.contentMode = .scaleAspectFit
        view.lineBreakMode = .byWordWrapping
        view.numberOfLines = 0
        view.font = Constants.Fonts.titlePostOpenSans_Regular24
        view.textColor = Constants.Colors.black
        return view
    }()
    
    var descriptionNews: UILabel = {
       let view = UILabel()
        view.text = "уоавлыдвоадл олдлвоафолдыаод фофд одлыао фоыа дфаы лол афуоавлыдвоадл олдлвоафолдыаод фофд одлыао фоыа дфаы лол афуоавлыдвоадл олдлвоафолдыаод фофд одлыао фоыа дфаы лол аф"
        view.numberOfLines = 3
        view.lineBreakMode = .byWordWrapping
        view.font = Constants.Fonts.descriptionPostOpenSans_Regular14
        view.textColor = Constants.Colors.grey
        return view
    }()
    
    var sourceNews: UILabel = {
       let view = UILabel()
        view.text = "Village.ru"
        view.font = Constants.Fonts.descriptionPostOpenSans_Regular14
        view.textColor = Constants.Colors.lightGreenText
        return view
    }()
    var postedTimeNews: UILabel = {
        let view = UILabel()
        view.text = "25 мин.назад"
        view.font = Constants.Fonts.sourcePostOpenSans_SemiBold14
        view.textColor = Constants.Colors.grey
        return view
    }()
    
    var stackText: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        return view
    }()
    
    var stackButtons: UIStackView = {
        let favButton = UIButton()
        favButton.setImage(UIImage(systemName: "heart"), for: .normal)
        let laterButton = UIButton()
        laterButton.setImage(UIImage(systemName: "square"), for: .normal)
        let shareButton = UIButton()
        shareButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.addArrangedSubview(favButton)
        view.addArrangedSubview(laterButton)
        view.addArrangedSubview(shareButton)
        return view
    }()
    var labelempty: UILabel = {
       let view = UILabel()
        view.text = " "
        return view
    }()
    var stackInfos: UIStackView = {
       let view = UIStackView()
        view.axis = .vertical
        return view
    }()
    
    var stackBottom: UIStackView = {
       let view = UIStackView()
        view.axis = .horizontal
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        makeConstraints()
        makeShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    private func setupViews(){
        addSubview(imageViewNews)
        addSubview(stackBottom)
        addSubview(stackText)
        stackInfos.addArrangedSubview(sourceNews)
        stackInfos.addArrangedSubview(postedTimeNews)
        stackText.addArrangedSubview(titleNews)
        stackText.addArrangedSubview(descriptionNews)
        stackBottom.addArrangedSubview(stackInfos)
        stackBottom.addArrangedSubview(labelempty)
        stackBottom.addArrangedSubview(stackButtons)
    }
    private func makeConstraints(){
        stackButtons.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(2)
        }
        imageViewNews.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(130)
        }
        stackText.snp.makeConstraints { make in
            make.top.equalTo(imageViewNews.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
        }
        stackBottom.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(30)
            make.height.equalTo(40)
            make.top.equalTo(stackText.snp.bottom).offset(30)
        }
    }
    
    private func makeShadow(){
        backgroundColor = Constants.Colors.white
        layer.cornerRadius = 10
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.masksToBounds = false
        layer.shadowColor = Constants.Colors.black?.cgColor
    }
    
    func setupLayouts(view: UICollectionView){
        self.widthAnchor.constraint(equalToConstant: view.bounds.size.width - 30).isActive = true
    }
}
