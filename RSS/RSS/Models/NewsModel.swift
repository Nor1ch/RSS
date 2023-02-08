//
//  NewsModel.swift
//  RSS
//
//  Created by Nor1 on 08.02.2023.
//

import Foundation
import UIKit

struct NewsModel: Decodable {
    let title: String
    let link: String
    let source: String
    let image: String
    let date: String
    let description: String
}

struct NewsModelToShow {
    let title: String
    let link: String
    let source: String
    let image: UIImage
    let date: String
    let description: String
}
