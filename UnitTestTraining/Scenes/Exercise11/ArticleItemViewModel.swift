//
//  ArticleItemViewModel.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 10/5/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

struct ArticleItemViewModel {
    let author: String      
    let title: String      
    let description: String

    init(article: Article) {
        self.author = article.author
        self.title = article.title
        self.description = article.description
    }
}
