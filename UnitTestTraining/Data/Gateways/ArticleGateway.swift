//
//  ArticleGateway.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 10/5/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation
import MGArchitecture
import RxSwift

protocol ArticleGatewayType {
    func getArticles(dto: GetArticlesDto) -> Observable<PagingInfo<Article>>
}

struct ArticleGateway: ArticleGatewayType {
    func getArticles(dto: GetArticlesDto) -> Observable<PagingInfo<Article>> {
        let input = API.GetArticlesInput(dto: dto)
        return API.shared.getArticles(input)
            .map { $0.articles }
            .map { articles in
                PagingInfo(page: dto.page, items: articles)
            }
    }
}
