//
//  EmptyTransition.swift
//  RSS
//
//  Created by Nor1 on 06.02.2023.
//

import Foundation
import UIKit

class EmptyTransition : Transition {
    func open(_ viewController: UIViewController, from: UIViewController, completion: (() -> Void)?) {}
    
    func close(_ viewController: UIViewController, completion: (() -> Void)?) {}
}
