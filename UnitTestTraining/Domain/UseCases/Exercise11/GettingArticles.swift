//
//  GettingArticles.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 10/5/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation
import MGArchitecture
import RxSwift

protocol GettingArticles {
    var articleGateway: ArticleGatewayType { get }
}

extension GettingArticles {
    func getArticles(dto: GetArticlesDto) -> Observable<PagingInfo<Article>> {
        return articleGateway.getArticles(dto: dto)
    }
}
