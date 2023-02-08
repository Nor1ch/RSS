//
//  NewsVCProtocol.swift
//  RSS
//
//  Created by Nor1 on 08.02.2023.
//

import Foundation
import UIKit

protocol NewsVCProtocol {
    var sideMenu: ContainerVC {get}
    var collectionView: UICollectionView {get}
    var menuBatton: UIBarButtonItem {get}
    
    func menuSwiped()
    func menuTapped()
    
}
