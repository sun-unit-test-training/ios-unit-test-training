//
//  Exercise1ViewModelTests.swift
//  UnitTestTrainingTests
//
//  Created by Tuan Truong on 9/13/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class Exercise1ViewModelTests: XCTestCase {
    private var viewModel: Exercise1ViewModel!
    private var navigator: Exercise1NavigatorMock!
    private var useCase: Exercise1UseCaseMock!
    private var input: Exercise1ViewModel.Input!
    private var output: Exercise1ViewModel.Output!
    private var disposeBag: DisposeBag!

    // Triggers
    private let loadTrigger = PublishSubject<Void>()
    private let voucherTrigger = PublishSubject<Bool>()
    private let promotionTimeTrigger = PublishSubject<Bool>()
    
    override func setUp() {
        super.setUp()
        navigator = Exercise1NavigatorMock()
        useCase = Exercise1UseCaseMock()
        viewModel = Exercise1ViewModel(navigator: navigator, useCase: useCase)
        
        input = Exercise1ViewModel.Input(
            loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
            voucherTrigger: voucherTrigger.asDriverOnErrorJustComplete(),
            promotionTimeTrigger: promotionTimeTrigger.asDriverOnErrorJustComplete()
        )
        disposeBag = DisposeBag()
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_loadTrigger_calculateBeerPrice() {
        // act
        loadTrigger.onNext(())
        
        // assert
        XCTAssert(useCase.calculateBeerPriceCalled)
        XCTAssertFalse(useCase.usingVoucher)
        XCTAssertFalse(useCase.isInPromotionTime)
        XCTAssertEqual(output.price, (490.0).japanCurrency)
    }
    
    func test_voucherTrigger_calculateBeerPrice() {
        // act
        voucherTrigger.onNext(true)
        
        // assert
        XCTAssert(useCase.calculateBeerPriceCalled)
        XCTAssert(useCase.usingVoucher)
        XCTAssertFalse(useCase.isInPromotionTime)
    }
    
    func test_promotionTimeTrigger_calculateBeerPrice() {
        // act
        promotionTimeTrigger.onNext(true)
        
        // assert
        XCTAssert(useCase.calculateBeerPriceCalled)
        XCTAssertFalse(useCase.usingVoucher)
        XCTAssert(useCase.isInPromotionTime)
    }
}
