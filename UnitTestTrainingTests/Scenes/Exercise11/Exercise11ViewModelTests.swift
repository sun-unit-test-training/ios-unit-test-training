//
//  Exercise11ViewModelTests.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 10/5/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift

final class Exercise11ViewModelTests: XCTestCase {
    private var viewModel: Exercise11ViewModel!
    private var navigator: Exercise11NavigatorMock!
    private var useCase: Exercise11UseCaseMock!

    private var input: Exercise11ViewModel.Input!
    private var output: Exercise11ViewModel.Output!

    private var disposeBag: DisposeBag!

    private let loadTrigger = PublishSubject<Void>()
    private let reloadTrigger = PublishSubject<Void>()
    private let loadMoreTrigger = PublishSubject<Void>()
    private let selectArticleTrigger = PublishSubject<IndexPath>()

    override func setUp() {
        super.setUp()
        navigator = Exercise11NavigatorMock()
        useCase = Exercise11UseCaseMock()
        viewModel = Exercise11ViewModel(navigator: navigator, useCase: useCase)

        input = Exercise11ViewModel.Input(
            loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
            reloadTrigger: reloadTrigger.asDriverOnErrorJustComplete(),
            loadMoreTrigger: loadMoreTrigger.asDriverOnErrorJustComplete(),
            selectArticleTrigger: selectArticleTrigger.asDriverOnErrorJustComplete()
        )

        disposeBag = DisposeBag()
        output = viewModel.transform(input, disposeBag: disposeBag)
    }

    func test_loadTrigger_getArticleList() {
        // act
        loadTrigger.onNext(())

        // assert
        XCTAssert(useCase.getArticlesCalled)
        XCTAssertEqual(output.articleList.count, 1)
    }

    func test_loadTrigger_getArticleList_failedShowError() {
        // arrange
        useCase.getArticlesReturnValue = Observable.error(TestError())

        // act
        loadTrigger.onNext(())

        // assert
        XCTAssert(useCase.getArticlesCalled)
        XCTAssert(output.error is TestError)
    }

    func test_reloadTrigger_getArticleList() {
        // act
        reloadTrigger.onNext(())

        // assert
        XCTAssert(useCase.getArticlesCalled)
        XCTAssertEqual(output.articleList.count, 1)
    }

    func test_reloadTrigger_getArticleList_failedShowError() {
        // arrange
        useCase.getArticlesReturnValue = Observable.error(TestError())

        // act
        reloadTrigger.onNext(())

        // assert
        XCTAssert(useCase.getArticlesCalled)
        XCTAssert(output.error is TestError)
    }

    func test_reloadTrigger_notGetArticleListIfStillLoading() {
        // arrange
        useCase.getArticlesReturnValue = Observable.never()

        // act
        loadTrigger.onNext(())
        useCase.getArticlesCalled = false
        reloadTrigger.onNext(())

        // assert
        XCTAssertFalse(useCase.getArticlesCalled)
    }

    func test_reloadTrigger_notGetArticleListIfStillReloading() {
        // arrange
        useCase.getArticlesReturnValue = Observable.never()

        // act
        reloadTrigger.onNext(())
        useCase.getArticlesCalled = false
        reloadTrigger.onNext(())

        // assert
        XCTAssertFalse(useCase.getArticlesCalled)
    }

    func test_loadMoreTrigger_loadMoreArticleList() {
        // act
        loadTrigger.onNext(())
        useCase.getArticlesCalled = false
        loadMoreTrigger.onNext(())

        // assert
        XCTAssert(useCase.getArticlesCalled)
        XCTAssertEqual(output.articleList.count, 2)
    }

    func test_loadMoreTrigger_loadMoreArticleList_failedShowError() {
        // act
        loadTrigger.onNext(())
        useCase.getArticlesReturnValue = Observable.error(TestError())
        loadMoreTrigger.onNext(())

        // assert
        XCTAssert(output.error is TestError)
    }

    func test_loadMoreTrigger_notLoadMoreArticleListIfStillLoading() {
        // arrange
        useCase.getArticlesReturnValue = Observable.never()

        // act
        loadTrigger.onNext(())
        useCase.getArticlesCalled = false
        loadMoreTrigger.onNext(())

        // assert
        XCTAssertFalse(useCase.getArticlesCalled)
    }

    func test_loadMoreTrigger_notLoadMoreArticleListIfStillReloading() {
        // arrange
        useCase.getArticlesReturnValue = Observable.never()

        // act
        reloadTrigger.onNext(())
        useCase.getArticlesCalled = false
        loadMoreTrigger.onNext(())

        // assert
        XCTAssertFalse(useCase.getArticlesCalled)
    }

    func test_loadMoreTrigger_notLoadMoreArticleListIfStillLoadingMore() {
        // arrange
        useCase.getArticlesReturnValue = Observable.never()

        // act
        loadMoreTrigger.onNext(())
        useCase.getArticlesCalled = false
        loadMoreTrigger.onNext(())

        // assert
        XCTAssertFalse(useCase.getArticlesCalled)
    }

    func test_selectArticleTrigger_toArticleDetail() {
        // act
        loadTrigger.onNext(())
        selectArticleTrigger.onNext(IndexPath(row: 0, section: 0))

        // assert
        XCTAssert(navigator.toArticleDetailCalled)
    }
}
