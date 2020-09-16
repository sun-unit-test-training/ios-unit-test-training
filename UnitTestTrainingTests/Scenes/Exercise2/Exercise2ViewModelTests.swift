//
//  Exercise2ViewModelTests.swift
//  TrainingTest
//
//  Created by trinh.giang.dong on 9/16/20.
//  Copyright © 2020 Sun-Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class Exercise2ViewModelTests: XCTestCase {
    private var viewModel: Exercise2ViewModel!
    private var navigator: Exercise2NavigatorMock!
    private var useCase: Exercise2UseCaseMock!
    
    private var input: Exercise2ViewModel.Input!
    private var output: Exercise2ViewModel.Output!

    private var disposeBag: DisposeBag!
    
    private let isVIPTrigger = BehaviorRelay<Bool>(value: true)
    private let submitTrigger = PublishSubject<Void>()

    override func setUp() {
        super.setUp()
        
        disposeBag = DisposeBag()
        
        navigator = Exercise2NavigatorMock()
        useCase = Exercise2UseCaseMock()
        viewModel = Exercise2ViewModel(navigator: navigator, useCase: useCase)

        input = Exercise2ViewModel.Input(
            isVIP: isVIPTrigger.asDriver(),
            submitTrigger: submitTrigger.asDriverOnErrorJustComplete()
        )
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_submitTriggerInvoked_loadHolidays() {
        submitTrigger.onNext(())
        
        XCTAssert(self.useCase.getHolidays_Called)
    }
    
    func test_submitTriggerInvoked_celculateFee() {
        submitTrigger.onNext(())
        
        XCTAssert(self.useCase.calculateFee_Called)
    }
}
