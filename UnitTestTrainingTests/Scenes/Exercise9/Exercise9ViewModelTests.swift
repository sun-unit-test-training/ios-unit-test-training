//
//  Exercise9ViewModelTests.swift
//  UnitTestTrainingTests
//
//  Created by Huy Pham on 9/25/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class Exercise9ViewModelTests: XCTestCase {

    private var viewModel: Exercise9ViewModel!
    private var navigator: Exercise9NavigatorMock!
    private var useCase: Exercise9UseCaseMock!
    private var input: Exercise9ViewModel.Input!
    private var output: Exercise9ViewModel.Output!
    private var disposeBag: DisposeBag!

    // Triggers
    private let magicWandSelectionTrigger = PublishSubject<Bool>()
    private let strategistSelectionTrigger = PublishSubject<Bool>()
    private let darknessKeySelectionTrigger = PublishSubject<Bool>()
    private let lightSwordSelectionTrigger = PublishSubject<Bool>()
    private let hitBigBossTrigger = PublishSubject<Void>()

    override func setUp() {
        super.setUp()
        navigator = Exercise9NavigatorMock()
        useCase = Exercise9UseCaseMock()
        viewModel = Exercise9ViewModel(navigator: navigator, useCase: useCase)
        input = Exercise9ViewModel.Input(
            magicWandSelectionTrigger: magicWandSelectionTrigger.asDriverOnErrorJustComplete(),
            strategistSelectionTrigger: strategistSelectionTrigger.asDriverOnErrorJustComplete(),
            darknessKeySelectionTrigger: darknessKeySelectionTrigger.asDriverOnErrorJustComplete(),
            lightSwordSelectionTrigger: lightSwordSelectionTrigger.asDriverOnErrorJustComplete(),
            hitBigBossTrigger: hitBigBossTrigger.asDriverOnErrorJustComplete())
        disposeBag = DisposeBag()
        output = viewModel.transform(input, disposeBag: disposeBag)
    }

    func test_pressHitBigBoss_calculateHanoiQuestResult() {
        // When
        hitBigBossTrigger.onNext(())

        // Then
        XCTAssertEqual(useCase.calculateHanoiQuestResultCalled, true)
    }

    func test_bringMagicWand_calculateHanoiQuestResult() {
        // When
        magicWandSelectionTrigger.onNext(true)
        hitBigBossTrigger.onNext(())

        // Then
        XCTAssertEqual(useCase.calculateHanoiQuestResultCalled, true)
        XCTAssertEqual(useCase.bringMagicWand, true)
    }

    func test_bringStrategist_calculateHanoiQuestResult() {
        // When
        strategistSelectionTrigger.onNext(true)
        hitBigBossTrigger.onNext(())

        // Then
        XCTAssertEqual(useCase.calculateHanoiQuestResultCalled, true)
        XCTAssertEqual(useCase.bringStrategist, true)
    }

    func test_bringDarknessKey_calculateHanoiQuestResult() {
        // When
        darknessKeySelectionTrigger.onNext(true)
        hitBigBossTrigger.onNext(())

        // Then
        XCTAssertEqual(useCase.calculateHanoiQuestResultCalled, true)
        XCTAssertEqual(useCase.bringDarknessKey, true)
    }

    func test_bringLightSword_calculateHanoiQuestResult() {
        // When
        lightSwordSelectionTrigger.onNext(true)
        hitBigBossTrigger.onNext(())

        // Then
        XCTAssertEqual(useCase.calculateHanoiQuestResultCalled, true)
        XCTAssertEqual(useCase.bringLightSword, true)
    }
}
