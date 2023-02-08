//
//  NavigationBarTitle+extension.swift
//  RSS
//
//  Created by Nor1 on 08.02.2023.
//

import Foundation
import UIKit

extension UINavigationItem {
    func setTitleSubtitle(sub: String) {
        let title = UILabel()
        title.text = Constants.Text.Navigation.title
        title.font = Constants.Fonts.headerRaleway23
        title.sizeToFit()
        let subtitle = UILabel()
        subtitle.text = sub
        subtitle.font = Constants.Fonts.userEmailOpenSans16
        subtitle.sizeToFit()
        let stackView = UIStackView(arrangedSubviews: [title,subtitle])
        stackView.distribution = .equalCentering
        stackView.axis = .vertical
        stackView.alignment = .center
        
        let width = max(title.frame.size.width, subtitle.frame.size.width)
        stackView.frame = CGRect(x: 0, y: 0, width: width, height: 35)
        
        title.sizeToFit()
        subtitle.sizeToFit()
        self.titleView = stackView
    }
}
