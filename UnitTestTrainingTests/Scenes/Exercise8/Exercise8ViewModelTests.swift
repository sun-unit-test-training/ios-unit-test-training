//
//  Exercise8ViewModelTests.swift
//  UnitTestTraining
//
//  Created by dungkv-1044 on 9/17/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift

final class Exercise8ViewModelTests: XCTestCase {
    private var viewModel: Exercise8ViewModel!
    private var navigator: Exercise8NavigatorMock!
    private var useCase: Exercise8UseCaseMock!
    
    private var input: Exercise8ViewModel.Input!
    private var output: Exercise8ViewModel.Output!

    private var disposeBag: DisposeBag!

    private let loadTrigger = PublishSubject<Void>()
    private let isMaleTrigger = PublishSubject<Bool>()
    private let ageTrigger = PublishSubject<String>()
    private let dateTrigger = PublishSubject<Date>()
    
    override func setUp() {
        super.setUp()
        navigator = Exercise8NavigatorMock()
        useCase = Exercise8UseCaseMock()
        viewModel = Exercise8ViewModel(navigator: navigator, useCase: useCase)
        disposeBag = DisposeBag()
        input = Exercise8ViewModel.Input(
                   loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
                   ageTrigger: ageTrigger.asDriverOnErrorJustComplete(),
                   isMaleTrigger: isMaleTrigger.asDriverOnErrorJustComplete(),
                   dateTrigger: dateTrigger.asDriverOnErrorJustComplete())
        output = viewModel.transform(input, disposeBag: disposeBag)
        output.$fee.asDriver().drive().disposed(by: disposeBag)
    }
    
    func test_loadTrigger() {
        loadTrigger.onNext(())
        XCTAssert(useCase.isCalculatePlayFeeCalled)
        XCTAssertFalse(useCase.isMale)
        XCTAssertEqual(output.fee, 0.0)
        XCTAssertEqual(useCase.age, 0)
        XCTAssertEqual(useCase.date.dayInWeek(), Date().dayInWeek())
    }
    
    func test_ageTrigger() {
        ageTrigger.onNext("9")
        XCTAssert(useCase.isCalculatePlayFeeCalled)
        XCTAssertFalse(useCase.isMale)
        XCTAssertEqual(output.fee, 0.0)
        XCTAssertEqual(useCase.age, 9)
        XCTAssertEqual(useCase.date.dayInWeek(), Date().dayInWeek())
    }
    
    func test_isMaleTrigger() {
        isMaleTrigger.onNext(true)
        XCTAssert(useCase.isCalculatePlayFeeCalled)
        XCTAssert(useCase.isMale)
        XCTAssertEqual(output.fee, 0.0)
        XCTAssertEqual(useCase.age, 0)
        XCTAssertEqual(useCase.date.dayInWeek(), Date().dayInWeek())
    }
    
    func test_dateTrigger() {
        dateTrigger.onNext(Date())
        XCTAssert(useCase.isCalculatePlayFeeCalled)
        XCTAssertFalse(useCase.isMale)
        XCTAssertEqual(output.fee, 0.0)
        XCTAssertEqual(useCase.age, 0)
        XCTAssertEqual(useCase.date.dayInWeek(), Date().dayInWeek())
    }
}
