//
//  Exercise11UseCase.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 10/5/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import RxSwift
import MGArchitecture

protocol Exercise11UseCaseType {
    func getArticles(page: Int) -> Observable<PagingInfo<Article>>
}

struct Exercise11UseCase: Exercise11UseCaseType, GettingArticles {
    let articleGateway: ArticleGatewayType
    
    func getArticles(page: Int) -> Observable<PagingInfo<Article>> {
        let dto = GetArticlesDto(query: "covid",
                                 apiKey: API.Urls.newsAPIKey,
                                 page: page,
                                 pageSize: 10)
        return getArticles(dto: dto)
    }
}
