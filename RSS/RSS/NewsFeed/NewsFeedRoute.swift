//
//  NewsFeedRoute.swift
//  RSS
//
//  Created by Nor1 on 06.02.2023.
//

import Foundation
import UIKit

protocol NewsFeedRoute {
    func makeNewsFeed() -> UIViewController
}

extension NewsFeedRoute where Self: Router {
    func makeNewsFeed() -> UIViewController {
        let router = MainRouter(rootTransition: EmptyTransition())
        let viewModel = NewsFeedViewModel(router: router)
        let viewController = NewsFeedVC(viewModel: viewModel)
        router.root = viewController
        let navigation = UINavigationController(rootViewController: viewController)
        viewController.title = Constants.Text.Navigation.title
        return navigation
    }
}

extension MainRouter: NewsFeedRoute {}
