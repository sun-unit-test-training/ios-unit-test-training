//
//  Exersice6ViewModel.swift
//  UnitTestTraining
//
//  Created by nguyen.the.trinh on 9/17/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation
import MGArchitecture
import RxSwift
import RxCocoa

struct Exercise6ViewModel {
    let navigator: Exercise6NavigatorType
    let useCase: Exercise6UseCaseType
}

// MARK: - ViewModel
extension Exercise6ViewModel: ViewModel {
    struct Input {
        let loadTrigger: Driver<Void>
        let isWatchMovieTrigger: Driver<Bool>
        let moneySpentTrigger: Driver<String>
    }
    
    struct Output {
        @Property var freeMinutes = "0"
        @Property var errorMessage = ""
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        
        let isWatchMovie = input.isWatchMovieTrigger
            .startWith(false)

        let moneySpent = input.moneySpentTrigger
            .startWith("0")
        
        input.moneySpentTrigger
            .map { self.useCase.validateMoneyAmount($0) }
            .map { $0.message }
            .asDriver()
            .drive(output.$errorMessage)
            .disposed(by: disposeBag)
        
        Driver.merge(
            input.loadTrigger,
            input.isWatchMovieTrigger.mapToVoid(),
            input.moneySpentTrigger.mapToVoid()
        )
        .withLatestFrom(Driver.combineLatest(isWatchMovie, moneySpent))
        .map { isWatchMovie, moneySpent -> Double in
            let dto = TayHoOrderDto(moneySpent: moneySpent, watchingMovie: isWatchMovie)
            return self.useCase.calculateFreeMinutes(dto: dto)
        }
        .map { String($0) }
        .drive(output.$freeMinutes)
        .disposed(by: disposeBag)
    
        return output
    }
}
