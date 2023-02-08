//
//  FavoriteNewsRoute.swift
//  RSS
//
//  Created by Nor1 on 08.02.2023.
//

import Foundation
import UIKit

protocol FavoriteNewsRoute {
    func openFavoriteNews()
}

extension FavoriteNewsRoute where Self: Router {
    func openFavoriteNews(transition: Transition) {
        let router = MainRouter(rootTransition: transition)
        let viewModel = FavoriteNewsViewModel(router: router)
        let viewController = FavoriteNewsVC(viewModel: viewModel)
        viewController.title = Constants.Text.Navigation.title
        router.root = viewController
        route(to: viewController, as: transition)
    }
    
    func openFavoriteNews(){
        openFavoriteNews(transition: PushTransition())
    }
}

extension MainRouter: FavoriteNewsRoute {}
