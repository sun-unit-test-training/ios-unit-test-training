//
//  Article.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 10/5/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation
import ObjectMapper
import Then

struct Article {
    var author = ""
    var title = ""
    var description = ""
    var url = ""
    var urlToImage = ""
    var publishedAt = Date()
    var content = ""
}

extension Article: Then { }

extension Article: Mappable {
    init?(map: Map) {
        self.init()
    }
    
    mutating func mapping(map: Map) {
        author <- map["author"]
        title <- map["title"]
        description <- map["description"]
        url <- map["url"]
        urlToImage <- map["urlToImage"]
        publishedAt <- (map["publishedAt"], DateTransform())
        content <- map["content"]
    }
}
