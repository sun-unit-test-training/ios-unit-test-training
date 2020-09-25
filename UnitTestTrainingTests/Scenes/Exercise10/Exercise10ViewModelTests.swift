//
//  Exercise10ViewModelTests.swift
//  UnitTestTrainingTests
//
//  Created by NguyenCK on 9/24/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class Exercise10ViewModelTests: XCTestCase {
    private var viewModel: Exercise10ViewModel!
    private var navigator: Exercise10NavigatorMock!
    private var useCase: Exercise10UseCaseMock!
    private var input: Exercise10ViewModel.Input!
    private var output: Exercise10ViewModel.Output!
    
    private var disposeBag: DisposeBag!
    
    private let loadTrigger = PublishSubject<Void>()
    private let memberRankTrigger = PublishSubject<Int>()
    private let prepaidTypeTrigger = PublishSubject<Int>()
    private let participateLotteryTrigger = PublishSubject<Bool>()
    
    override func setUp() {
        super.setUp()
        navigator = Exercise10NavigatorMock()
        useCase = Exercise10UseCaseMock()
        viewModel = Exercise10ViewModel(navigator: navigator, useCase: useCase)
        disposeBag = DisposeBag()
        input = Exercise10ViewModel.Input(
            loadTrigger: loadTrigger.asDriverOnErrorJustComplete(),
            memberRankTrigger: memberRankTrigger.asDriverOnErrorJustComplete(),
            prepaidTypeTrigger: prepaidTypeTrigger.asDriverOnErrorJustComplete(),
            participateLotteryTrigger: participateLotteryTrigger.asDriverOnErrorJustComplete())
        output = viewModel.transform(input, disposeBag: disposeBag)
    }
    
    func test_restaurantPromotion_onLoad() {
        // act
        loadTrigger.onNext(())
        
        // assert
        XCTAssert(useCase.calculateRestaurantPromotionCalled)
    }
    
    func test_restaurantPromotion_onMemberRank_involked() {
        // act
        memberRankTrigger.onNext(1)
        
        // assert
        XCTAssert(useCase.calculateRestaurantPromotionCalled)
    }
    
    func test_restaurantPromotion_onPrepaid_involked() {
        // act
        prepaidTypeTrigger.onNext(1)
        
        // assert
        XCTAssert(useCase.calculateRestaurantPromotionCalled)
    }
    
    func test_restaurantPromotion_onParticipate_involked() {
        // act
        participateLotteryTrigger.onNext(true)
        
        // assert
        XCTAssert(useCase.calculateRestaurantPromotionCalled)
    }
    
}
