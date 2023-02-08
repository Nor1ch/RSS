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
    func openNewsFeed()
}

extension NewsFeedRoute where Self: Router {
    func makeNewsFeed() -> UIViewController {
        let router = MainRouter(rootTransition: EmptyTransition())
        let viewModel = NewsFeedViewModel(router: router)
        let viewController = NewsFeedVC(viewModel: viewModel)
        let navigation = UINavigationController(rootViewController: viewController)
        router.root = viewController
        return navigation
    }
    func openNewsFeed(transition: Transition) {
        let router = MainRouter(rootTransition: EmptyTransition())
        let viewModel = NewsFeedViewModel(router: router)
        let viewController = NewsFeedVC(viewModel: viewModel)
        viewController.title = Constants.Text.Navigation.title
        router.root = viewController
        route(to: viewController, as: transition)
    }
    func openNewsFeed(){
        openNewsFeed(transition: PushTransition())
    }
}

extension MainRouter: NewsFeedRoute {}
