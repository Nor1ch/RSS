//
//  FavoriteNewsViewModel.swift
//  RSS
//
//  Created by Nor1 on 08.02.2023.
//

import Foundation

class FavoriteNewsViewModel {
    typealias Routes = LaterNewsRoute & NewsFeedRoute
    private let router: Routes
    
    init(router: Routes){
        self.router = router
    }
    
    func openLater(){
        router.openLaterNews()
    }
    func openFeed(){
        router.openNewsFeed()
    }
}
