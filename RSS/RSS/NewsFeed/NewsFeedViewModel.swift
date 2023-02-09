//
//  NewsFeedViewModel.swift
//  RSS
//
//  Created by Nor1 on 06.02.2023.
//

import Foundation
import Combine

class NewsFeedViewModel {
    
    typealias Routes = FavoriteNewsRoute & LaterNewsRoute
    private let router: Routes
    
    init(router: Routes){
        self.router = router
        cancelable =
            getNews()
            .assign(to: \.newsArray, on: self)
    }
    
    @Published var newsArray: [NewsModelToShow] = []
    private var cancelable: AnyCancellable? = nil
    
    
    func openFavorites(){
        router.openFavoriteNews()
    }
    func openLater(){
        router.openLaterNews()
    }
}
