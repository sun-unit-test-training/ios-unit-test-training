//
//  AppViewModelTests.swift
//  UnitTestTrainingTests
//
//  Created by Tuan Truong on 9/12/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class AppViewModelTests: XCTestCase {
    private var viewModel: AppViewModel!
    private var navigator: AppNavigatorMock!
    private var useCase: AppUseCaseMock!
    private var input: AppViewModel.Input!
    private var output: AppViewModel.Output!
    private var disposeBag: DisposeBag!
    
    // Triggers
    private let loadTrigger = PublishSubject<Void>()
    
    override func setUp() {
        super.setUp()
        navigator = AppNavigatorMock()
        useCase = AppUseCaseMock()
        viewModel = AppViewModel(navigator: navigator, useCase: useCase)
        
        input = AppViewModel.Input(loadTrigger: loadTrigger.asDriverOnErrorJustComplete())
        disposeBag = DisposeBag()
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_loadTrigger_toMain() {
        // act
        loadTrigger.onNext(())
        
        // assert
        XCTAssert(navigator.toMainCalled)
    }
}
