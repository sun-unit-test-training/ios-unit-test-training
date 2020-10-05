//
//  Exercise11ViewModel.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 10/5/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import MGArchitecture
import RxSwift
import RxCocoa
import UIKit

struct Exercise11ViewModel {
    let navigator: Exercise11NavigatorType
    let useCase: Exercise11UseCaseType
}

// MARK: - ViewModel
extension Exercise11ViewModel: ViewModel {
    struct Input {
        let loadTrigger: Driver<Void>
        let reloadTrigger: Driver<Void>
        let loadMoreTrigger: Driver<Void>
        let selectArticleTrigger: Driver<IndexPath>
    }

    struct Output {
        @Property var error: Error?
        @Property var isLoading = false
        @Property var isReloading = false
        @Property var isLoadingMore = false
        @Property var articleList = [ArticleItemViewModel]()
    }

    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()

        let getPageInput = GetPageInput(loadTrigger: input.loadTrigger,
                                        reloadTrigger: input.reloadTrigger,
                                        loadMoreTrigger: input.loadMoreTrigger,
                                        getItems: useCase.getArticles)

        let getPageResult = getPage(input: getPageInput)
        let (page, error, isLoading, isReloading, isLoadingMore) = getPageResult.destructured
        
        let articleList = page
            .map { $0.items }

        articleList
            .map { $0.map(ArticleItemViewModel.init) }
            .drive(output.$articleList)
            .disposed(by: disposeBag)

        select(trigger: input.selectArticleTrigger, items: articleList)
            .drive(onNext: navigator.toArticleDetail)
            .disposed(by: disposeBag)

        error
            .drive(output.$error)
            .disposed(by: disposeBag)
        
        isLoading
            .drive(output.$isLoading)
            .disposed(by: disposeBag)
        
        isReloading
            .drive(output.$isReloading)
            .disposed(by: disposeBag)
        
        isLoadingMore
            .drive(output.$isLoadingMore)
            .disposed(by: disposeBag)

        return output
    }
}
