//
//  Exercise3ViewModelTests.swift
//  UnitTestTraining
//
//  Created by Nguyen.dong.son on 9/11/20.
//  Copyright © 2020 Sun-Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift

final class Exercise3ViewModelTests: XCTestCase {
    private var viewModel: Exercise3ViewModel!
    private var navigator: Exercise3NavigatorMock!
    private var useCase: Exercise3UseCaseMock!
    
    private var input: Exercise3ViewModel.Input!
    private var output: Exercise3ViewModel.Output!

    private var disposeBag: DisposeBag!
    
    private let loadTrigger = PublishSubject<Void>()
    private let addTrigger = PublishSubject<IndexPath>()
    private let minusTrigger = PublishSubject<IndexPath>()

    override func setUp() {
        super.setUp()
        navigator = Exercise3NavigatorMock()
        useCase = Exercise3UseCaseMock()
        viewModel = Exercise3ViewModel(navigator: navigator, useCase: useCase)

        input = Exercise3ViewModel.Input(loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
                                         addTrigger: addTrigger.asDriverOnErrorJustComplete(),
                                         minusTrigger: minusTrigger.asDriverOnErrorJustComplete())
        
        disposeBag = DisposeBag()
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_loadTrigger_getClotherData() {
        // act
        loadTrigger.onNext(())
        
        // assert
        XCTAssert(useCase.getClotherDataCalled)
        XCTAssertEqual(output.clotherList.count, 3)
    }
    
    func test_minus_and_add() {
        // act
        loadTrigger.onNext(())
        addTrigger.onNext(IndexPath(row: 0, section: 0))
        minusTrigger.onNext(IndexPath(row: 0, section: 0))
        
        // assert
        XCTAssert(useCase.addCalled)
        XCTAssert(useCase.minusCalled)
    }
    
    func test_getDiscount() {
        // act
        loadTrigger.onNext(())
        addTrigger.onNext(IndexPath(row: 0, section: 0))
        addTrigger.onNext(IndexPath(row: 1, section: 0))
        addTrigger.onNext(IndexPath(row: 2, section: 0))
        
        // assert
        XCTAssert(useCase.getDiscountCalled)
    }
}
