//
//  Exercise5ViewModelTests.swift
//  UnitTestTrainingTests
//
//  Created by can.khac.nguyen on 9/20/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class Exercise5ViewModelTests: XCTestCase {
    private var viewModel: Exercise5ViewModel!
    private var navigator: Exercise5NavigatorMock!
    private var useCase: Exercise5UseCaseMock!
    private var input: Exercise5ViewModel.Input!
    private var output: Exercise5ViewModel.Output!

    private var disposeBag: DisposeBag!
    
    private let loadTrigger = PublishSubject<Void>()
    private let priceTrigger = PublishSubject<String>()
    private let receiveMethodTrigger = PublishSubject<Int>()
    private let usingCouponTrigger = PublishSubject<Bool>()
    private let intoMoneyTrigger = PublishSubject<Void>()
    
    override func setUp() {
        super.setUp()
        navigator = Exercise5NavigatorMock()
        useCase = Exercise5UseCaseMock()
        viewModel = Exercise5ViewModel(navigator: navigator, useCase: useCase)
        disposeBag = DisposeBag()
        input = Exercise5ViewModel.Input(loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
                                         priceTrigger: priceTrigger.asDriverOnErrorJustComplete(),
                                         receiveMethodTrigger: receiveMethodTrigger.asDriverOnErrorJustComplete(),
                                         usingCouponTrigger: usingCouponTrigger.asDriverOnErrorJustComplete(),
                                         intoMoneyTrigger: intoMoneyTrigger.asDriverOnErrorJustComplete())
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_validationInvoked_onType() {
        // act
        priceTrigger.onNext("1500")
        
        // assert
        XCTAssert(useCase.validationIsCalled)
    }
    
    func test_intoMoneyTriggerInvoked_onClick() {
        // act
        intoMoneyTrigger.onNext(())
        
        // assert
        XCTAssert(useCase.calculateFeeIsCalled)
    }
}
