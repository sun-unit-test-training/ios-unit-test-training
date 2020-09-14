//
//  Exercise7ViewModelTests.swift
//  UnitTestTrainning
//
//  Created by dungkv-1044 on 9/14/20.
//  Copyright © 2020 Sun-Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class Exercise7ViewModelTests: XCTestCase {
    private var viewModel: Exercise7ViewModel!
    private var navigator: Exercise7NavigatorMock!
    private var useCase: Exercise7UseCaseMock!
    private var input: Exercise7ViewModel.Input!
    private var output: Exercise7ViewModel.Output!

    private var disposeBag: DisposeBag!
    
    private let loadTrigger = PublishSubject<Void>()
    private let isPremiumTrigger = PublishSubject<Bool>()
    private let isCartAmountGreaterThan5000 = PublishSubject<Bool>()
    private let isSelectQuickDeliver = PublishSubject<Bool>()

    override func setUp() {
        super.setUp()
        navigator = Exercise7NavigatorMock()
        useCase = Exercise7UseCaseMock()
        viewModel = Exercise7ViewModel(navigator: navigator, useCase: useCase)
        disposeBag = DisposeBag()
        input = Exercise7ViewModel.Input(
            loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
            isPremiumTrigger: isPremiumTrigger.asDriverOnErrorJustComplete(),
            isCartAmountGreaterThan5000: isCartAmountGreaterThan5000.asDriverOnErrorJustComplete(),
            isSelectQuickDeliver: isSelectQuickDeliver.asDriverOnErrorJustComplete())
        output = viewModel.transform(input, disposeBag: disposeBag)
        
        output.$fee.asDriver().drive().disposed(by: disposeBag)
        
    }
    
    func test_loadTrigger() {
        loadTrigger.onNext(())
        XCTAssert(useCase.isCalculationFeeCalled)
        XCTAssertFalse(useCase.isQuickDeliver)
        XCTAssertFalse(useCase.isCartAmountGreaterThan5000)
        XCTAssertFalse(useCase.isPremiumMember)
        XCTAssertEqual(output.fee.standardFee, 500.0)
    }

    func test_isPremiumMemberTrigger() {
        isPremiumTrigger.onNext(true)
        XCTAssert(useCase.isCalculationFeeCalled)
        XCTAssertFalse(useCase.isQuickDeliver)
        XCTAssertFalse(useCase.isCartAmountGreaterThan5000)
        XCTAssert(useCase.isPremiumMember)
    }
    
    func test_isSelectQuickDeliverTrigger() {
        isSelectQuickDeliver.onNext(true)
        XCTAssert(useCase.isCalculationFeeCalled)
        XCTAssert(useCase.isQuickDeliver)
        XCTAssertFalse(useCase.isCartAmountGreaterThan5000)
        XCTAssertFalse(useCase.isPremiumMember)
    }
    
    func test_isCartAmountGreaterThan5000Trigger() {
        isCartAmountGreaterThan5000.onNext(true)
        XCTAssert(useCase.isCalculationFeeCalled)
        XCTAssertFalse(useCase.isQuickDeliver)
        XCTAssert(useCase.isCartAmountGreaterThan5000)
        XCTAssertFalse(useCase.isPremiumMember)
    }
    
}
