//
//  LaterNewsRoute.swift
//  RSS
//
//  Created by Nor1 on 08.02.2023.
//

import Foundation

protocol LaterNewsRoute {
    func openLaterNews()
}

extension FavoriteNewsRoute where Self: Router {
    func openLaterNews(transition: Transition) {
        let router = MainRouter(rootTransition: transition)
        let viewModel = LaterNewsViewModel(router: router)
        let viewController = LaterNewsVC(viewModel: viewModel)
        viewController.title = Constants.Text.Navigation.title
        router.root = viewController
        route(to: viewController, as: transition)
    }
    
    func openLaterNews(){
        openLaterNews(transition: PushTransition())
    }
}

extension MainRouter: LaterNewsRoute {}
