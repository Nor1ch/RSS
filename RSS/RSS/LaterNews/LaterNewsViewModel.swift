//
//  LaterNewsViewModel.swift
//  RSS
//
//  Created by Nor1 on 08.02.2023.
//

import Foundation

class LaterNewsViewModel {
    typealias Routes = FavoriteNewsRoute & NewsFeedRoute
    let router: Routes
    
    init(router: Routes){
        self.router = router
    }
    
    func openFavorite(){
        router.openFavoriteNews()
    }
    func openFeed(){
        router.openNewsFeed()
    }
}
