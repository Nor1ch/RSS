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
    
    
    private var imageViewNews: UIImageView = {
       let view = UIImageView()
        view.image = UIImage(systemName: "heart")
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    private var titleNews: UILabel = {
        let view = UILabel()
        view.text = "Самое зрелищное шоу пройдет сегодня в Москве"
        view.contentMode = .scaleAspectFit
        view.numberOfLines = 0
        view.font = Constants.Fonts.titlePostOpenSans_Regular24
        view.textColor = Constants.Colors.black
        return view
    }()
    
    private var descriptionNews: UILabel = {
       let view = UILabel()
        view.text = "уоавлыдвоадл олдлвоафолдыаод фофд одлыао фоыа дфаы лол афуоавлыдвоадл олдлвоафолдыаод фофд одлыао фоыа дфаы лол афуоавлыдвоадл олдлвоафолдыаод фофд одлыао фоыа дфаы лол аф"
        view.numberOfLines = 3
        view.font = Constants.Fonts.descriptionPostOpenSans_Regular14
        view.textColor = Constants.Colors.grey
        return view
    }()
    
    private var sourceNews: UILabel = {
       let view = UILabel()
        view.text = "Village.ru"
        view.font = Constants.Fonts.sourcePostOpenSans_SemiBold14
        view.textColor = Constants.Colors.lightGreenText
        return view
    }()
    private var postedTimeNews: UILabel = {
        let view = UILabel()
        view.text = "25 мин.назад"
        view.font = Constants.Fonts.sourcePostOpenSans_SemiBold14
        view.textColor = Constants.Colors.grey
        return view
    }()
    
    private var stackText: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        return view
    }()
    
    private var stackButtons: UIStackView = {
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
    private var labelempty: UILabel = {
       let view = UILabel()
        view.text = " "
        return view
    }()
    private var stackInfos: UIStackView = {
       let view = UIStackView()
        view.axis = .vertical
        return view
    }()
    
    private var stackBottom: UIStackView = {
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
            make.height.equalTo(150)
        }
        stackText.snp.makeConstraints { make in
            make.top.equalTo(imageViewNews.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
        }
        stackBottom.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(20)
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
    func makeCell(title: String, description: String, source: String, date: String, image: UIImage){
        self.imageViewNews.image = image
        self.titleNews.text = title
        self.descriptionNews.text = description
        self.sourceNews.text = source
        self.postedTimeNews.text = date
    }
}
