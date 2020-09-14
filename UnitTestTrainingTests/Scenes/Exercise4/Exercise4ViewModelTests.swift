//
//  Exercise4ViewModelTests.swift
//  UnitTestTraining
//
//  Created by Long Vu on 9/10/20.
//  Copyright © 2020 Sun*. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift

final class Exercise4ViewModelTests: XCTestCase {
    private var viewModel: Exercise4ViewModel!
    private var navigator: Exercise4NavigatorMock!
    private var useCase: Exercise4UseCaseMock!
    
    private var input: Exercise4ViewModel.Input!
    private var output: Exercise4ViewModel.Output!

    private var disposeBag: DisposeBag!
    private let loadTrigger = PublishSubject<Void>()
    private let dateTrigger = PublishSubject<Date>()

    override func setUp() {
        super.setUp()
        navigator = Exercise4NavigatorMock()
        useCase = Exercise4UseCaseMock()
        viewModel = Exercise4ViewModel(navigator: navigator, useCase: useCase)

        input = Exercise4ViewModel.Input(loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
                                         dateTrigger: dateTrigger.asDriverOnErrorJustComplete())
        disposeBag = DisposeBag()
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_loadTrigger_getHolidays() {
        // act
        loadTrigger.onNext(())
        
        // assert
        XCTAssert(useCase.getHolidaysCalled)
    }
    
    func test_dateTrigger_getDateColor() {
        // act
        loadTrigger.onNext(())
        dateTrigger.onNext(Date())
        
        // assert
        XCTAssert(useCase.getDateColorCalled)
    }
}
