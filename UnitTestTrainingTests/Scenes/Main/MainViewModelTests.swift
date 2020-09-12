//
//  MainViewModelTests.swift
//  UnitTestTrainingTests
//
//  Created by Tuan Truong on 9/12/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class MainViewModelTests: XCTestCase {
    private var viewModel: MainViewModel!
    private var navigator: MainNavigatorMock!
    private var useCase: MainUseCaseMock!
    private var input: MainViewModel.Input!
    private var output: MainViewModel.Output!
    private var disposeBag: DisposeBag!
    
    // Triggers
    private let loadTrigger = PublishSubject<Void>()
    private let selectTrigger = PublishSubject<IndexPath>()
    
    override func setUp() {
        super.setUp()
        navigator = MainNavigatorMock()
        useCase = MainUseCaseMock()
        viewModel = MainViewModel(navigator: navigator, useCase: useCase)

        input = MainViewModel.Input(
            loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
            selectTrigger: selectTrigger.asDriverOnErrorJustComplete()
        )
        disposeBag = DisposeBag()
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_loadTrigger_getExerciesList() {
        // act
        loadTrigger.onNext(())
        
        // assert
        XCTAssert(useCase.getExerciesCalled)
        XCTAssertEqual(output.exercises.count, 10)
    }
    
    func test_selectTrigger_toExercise1() {
        // act
        loadTrigger.onNext(())
        selectTrigger.onNext(IndexPath(row: 0, section: 0))
        
        // assert
        XCTAssert(navigator.toExercise1Called)
    }
    
    func test_selectTrigger_toExercise2() {
        // act
        loadTrigger.onNext(())
        selectTrigger.onNext(IndexPath(row: 1, section: 0))
        
        // assert
        XCTAssert(navigator.toExercise2Called)
    }
    
    func test_selectTrigger_toExercise3() {
        // act
        loadTrigger.onNext(())
        selectTrigger.onNext(IndexPath(row: 2, section: 0))
        
        // assert
        XCTAssert(navigator.toExercise3Called)
    }
    
    func test_selectTrigger_toExercise4() {
        // act
        loadTrigger.onNext(())
        selectTrigger.onNext(IndexPath(row: 3, section: 0))
        
        // assert
        XCTAssert(navigator.toExercise4Called)
    }
    
    func test_selectTrigger_toExercise5() {
        // act
        loadTrigger.onNext(())
        selectTrigger.onNext(IndexPath(row: 4, section: 0))
        
        // assert
        XCTAssert(navigator.toExercise5Called)
    }
    
    func test_selectTrigger_toExercise6() {
        // act
        loadTrigger.onNext(())
        selectTrigger.onNext(IndexPath(row: 5, section: 0))
        
        // assert
        XCTAssert(navigator.toExercise6Called)
    }
    
    func test_selectTrigger_toExercise7() {
        // act
        loadTrigger.onNext(())
        selectTrigger.onNext(IndexPath(row: 6, section: 0))
        
        // assert
        XCTAssert(navigator.toExercise7Called)
    }
    
    func test_selectTrigger_toExercise8() {
        // act
        loadTrigger.onNext(())
        selectTrigger.onNext(IndexPath(row: 7, section: 0))
        
        // assert
        XCTAssert(navigator.toExercise8Called)
    }
    
    func test_selectTrigger_toExercise9() {
        // act
        loadTrigger.onNext(())
        selectTrigger.onNext(IndexPath(row: 8, section: 0))
        
        // assert
        XCTAssert(navigator.toExercise9Called)
    }
    
    func test_selectTrigger_toExercise10() {
        // act
        loadTrigger.onNext(())
        selectTrigger.onNext(IndexPath(row: 9, section: 0))
        
        // assert
        XCTAssert(navigator.toExercise10Called)
    }
    
}
