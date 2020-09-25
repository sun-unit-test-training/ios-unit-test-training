//
//  Exercise6ViewModelTests.swift
//  UnitTestTrainingTests
//
//  Created by nguyen.the.trinh on 9/17/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class Exercise6ViewModelTests: XCTestCase {
    private var viewModel: Exercise6ViewModel!
    private var navigator: Exercise6NavigatorMock!
    private var useCase: Exercise6UseCaseMock!
    private var input: Exercise6ViewModel.Input!
    private var output: Exercise6ViewModel.Output!
    private var disposeBag: DisposeBag!
    
    // Triggers
    private let loadTrigger = PublishSubject<Void>()
    private let watchMovieTrigger = PublishSubject<Bool>()
    private let moneySpentTrigger = PublishSubject<String>()
    
    override func setUp() {
        super.setUp()
        navigator = Exercise6NavigatorMock()
        useCase = Exercise6UseCaseMock()
        viewModel = Exercise6ViewModel(navigator: navigator, useCase: useCase)
        input = Exercise6ViewModel.Input(
            loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
            isWatchMovieTrigger: watchMovieTrigger.asDriverOnErrorJustComplete(),
            moneySpentTrigger: moneySpentTrigger.asDriverOnErrorJustComplete()
        )
        disposeBag = DisposeBag()
        
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_loadTrigger_calculateFreeMinute() {
        // act
        loadTrigger.onNext(())
        
        // assert
        XCTAssert(useCase.calculateFreeMinutesCalled)
        XCTAssertFalse(useCase.watchMovie)
        XCTAssertEqual(output.freeMinutes, String("0.0"))
    }
    
    func test_watchMovie_calculateFreeMinute() {
        // act
        watchMovieTrigger.onNext(true)
        
        // asset
        XCTAssert(useCase.calculateFreeMinutesCalled)
        XCTAssertTrue(useCase.watchMovie)
    }
    
    func test_moneySpent_calculateFreeMinute() {
        // act
        moneySpentTrigger.onNext("2000.0")
        
        // asset
        XCTAssert(useCase.calculateFreeMinutesCalled)
        XCTAssert(useCase.isvalidateMoneySpentCalled)
        XCTAssertFalse(useCase.watchMovie)
    }
    
    func test_moneySpentTrigger_validateMoneySpent() {
        // act
        moneySpentTrigger.onNext("1000.0")
        
        // assert
        XCTAssert(useCase.isvalidateMoneySpentCalled)
    }
}
