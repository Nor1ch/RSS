//
//  APIcallers.swift
//  RSS
//
//  Created by Nor1 on 08.02.2023.
//

import Foundation
import Combine
import UIKit


func getNews() -> AnyPublisher<[NewsModelToShow],Never> {
    descriptionPublisher()
        .map { models in
            Publishers.MergeMany(models.map { model in
                loadImage(url: model.image)
                    .map { image in
                        NewsModelToShow(title: model.title, link: model.link, source: model.source, image: image, date: model.date, description: model.description)
                    }
            })
                .collect(models.count)
        }
        .switchToLatest()
        .eraseToAnyPublisher()
}
func descriptionPublisher() -> AnyPublisher<[NewsModel],Never> {
    guard let url = url() else {
        print("Wrong URL")
        return Just([]).eraseToAnyPublisher()
    }
    return URLSession.shared.dataTaskPublisher(for: url)
        .map {$0.data}
        .decode(type: [NewsModel].self, decoder: JSONDecoder())
        .replaceError(with: [])
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
}

func loadImage(url:String) -> AnyPublisher<UIImage, Never> {
    guard let url = imageURL(url: url) else {
        print("wrong image url")
        return Just(UIImage()).eraseToAnyPublisher()
    }
    return URLSession.shared.dataTaskPublisher(for: url)
        .map {UIImage(data: $0.data) ?? UIImage()}
        .replaceError(with: UIImage())
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
}


private func imageURL(url: String) -> URL? {
    return URL(string: url)
}
private func url() -> URL? {
    return URL(string: "")
}
