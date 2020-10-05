//
//  Exercise11UseCaseMock.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 10/5/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import RxSwift
import MGArchitecture

final class Exercise11UseCaseMock: Exercise11UseCaseType {

    // MARK: - getArticleList

    var getArticlesCalled = false

    var getArticlesReturnValue: Observable<PagingInfo<Article>> = {
        let items = [
            Article()
        ]

        let page = PagingInfo<Article>(page: 1, items: items)
        return Observable.just(page)
    }()

    func getArticles(page: Int) -> Observable<PagingInfo<Article>> {
        getArticlesCalled = true
        return getArticlesReturnValue
    }
}
