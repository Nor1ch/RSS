//
//  Constants.swift
//  RSS
//
//  Created by Nor1 on 06.02.2023.
//

import Foundation
import UIKit

enum Constants {
    
    enum Fonts {
        static var headerRaleway23: UIFont? {
            UIFont(name: "Raleway-Light", size: 23)
        }
        static var titleHearedOpenSans_Light32: UIFont? {
            UIFont(name: "OpenSans-Light", size: 24)
        }
        static var titlePostOpenSans_Regular24: UIFont? {
            UIFont(name: "OpenSans-Regular", size: 24)
        }
        static var descriptionPostOpenSans_Regular14: UIFont? {
            UIFont(name: "OpenSans-Regular", size: 14)
        }
        static var sourcePostOpenSans_SemiBold14: UIFont? {
            UIFont(name: "OpenSans-SemiBold", size: 14)
        }
        static var inpuntText_OpenSans18: UIFont? {
            UIFont(name: "OpenSans-Regular", size: 18)
        }
        static var buttonTitleOpenSans_SemiBold16: UIFont? {
            UIFont(name: "OpenSans-SemiBold", size: 16)
        }
        static var userNameOpenSans20: UIFont? {
            UIFont(name: "OpenSans-Regular", size: 20)
        }
        static var userEmailOpenSans16: UIFont? {
            UIFont(name: "OpenSans-Regular", size: 16)
        }
        static var burgerMenuItemOpenSans_Light18: UIFont? {
            UIFont(name: "OpenSans-Light", size: 18)
        }
        static var underlinedOpenSans_Italic14: UIFont? {
            UIFont(name: "OpenSans-Italic", size: 14)
        }
    }
    
    enum Text {
        enum Navigation {
            static let title = "READLIGHT"
        }
        enum Bodies {
            static let emptyFeed = "Ваша лента новостей пуста"
            static let emptyFeedAdd = "Добавьте подписки, чтобы получать интересубшие Вас новости"
        }
        enum Buttons {
            static let addSource = "Добавить источник"
        }
    }
    
    enum Colors {
        static var backgroundWhite: UIColor? {
            UIColor(named: "BackgroundWhite")
        }
        static var black: UIColor? {
            UIColor(named: "Black")
        }
        static var grey: UIColor? {
            UIColor(named: "Grey")
        }
        static var lightGreen: UIColor? {
            UIColor(named: "LightGreen")
        }
        static var lightGreenText: UIColor? {
            UIColor(named: "LightGreenText")
        }
        static var lightRed: UIColor? {
            UIColor(named: "LightRed")
        }
        static var orange: UIColor? {
            UIColor(named: "Orange")
        }
        static var white: UIColor? {
            UIColor(named: "White")
        }
        
    }
}
