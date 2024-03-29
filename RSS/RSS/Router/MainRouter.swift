//
//  MainRouter.swift
//  RSS
//
//  Created by Nor1 on 06.02.2023.
//

import Foundation
import UIKit

class MainRouter : Router, Closable, Dismissable {
    weak var root: UIViewController?
    private let rootTransition: Transition
    
    init(rootTransition: Transition) {
        self.rootTransition = rootTransition
    }
    
    func route(to viewController: UIViewController, as transition: Transition, completion: (() -> Void)?) {
        guard let root = root else { return }
        transition.open(viewController, from: root, completion: completion)

    }
    func route(to viewController: UIViewController, as transition: Transition) {
        route(to: viewController, as: transition, completion: nil)
    }
    
    func close(completion: (() -> Void)?) {
        guard let root = root else { return }
        rootTransition.close(root, completion: completion)
    }
    
    func close() {
        close(completion: nil)

    }
    
    func dismiss(completion: (() -> Void)?) {
        root?.dismiss(animated: true, completion: completion)
    }
    
    func dismiss() {
        dismiss(completion: nil)
    }
}
