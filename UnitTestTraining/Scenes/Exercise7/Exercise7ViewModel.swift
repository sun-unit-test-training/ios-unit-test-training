//
//  Exercise7ViewModel.swift
//  UnitTestTrainning
//
//  Created by dungkv-1044 on 9/14/20.
//  Copyright © 2020 Sun-Asterisk. All rights reserved.
//

import MGArchitecture
import RxSwift
import RxCocoa

struct Exercise7ViewModel {
    let navigator: Exercise7NavigatorType
    let useCase: Exercise7UseCaseType
}

// MARK: - ViewModel
extension Exercise7ViewModel: ViewModel {
    
    struct Input {
        let loadTrigger: Driver<Void>
        let isPremiumTrigger: Driver<Bool>
        let isCartAmountGreaterThan5000: Driver<Bool>
        let isSelectQuickDeliver: Driver<Bool>
    }

    struct Output {
        @Property var fee: (standardFee: Double, quickFee: Double)
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output(fee: (0, 0))
        let isPremium = input.isPremiumTrigger.startWith(false)
        let isCartAmountGreaterThan5000 = input.isCartAmountGreaterThan5000.startWith(false)
        let isQuickDeliver = input.isSelectQuickDeliver.startWith(false)
        
        Driver.merge(input.loadTrigger,
                     input.isPremiumTrigger.mapToVoid(),
                     input.isCartAmountGreaterThan5000.mapToVoid(),
                     input.isSelectQuickDeliver.mapToVoid()
        )
        .withLatestFrom(Driver.combineLatest(isPremium, isCartAmountGreaterThan5000, isQuickDeliver))
            .map { isPremium, isCartAmountGreaterThan5000, isQuickDeliver -> (standardFee: Double, quickFee: Double) in
                return self.useCase.calculationFee(
                    isPremiumMember: isPremium,
                    isQuickDeliver: isQuickDeliver,
                    isCartAmountGreaterThan5000: isCartAmountGreaterThan5000
            )
            }
        .map {
            ($0.standardFee, $0.quickFee)
        }
        .drive(output.$fee)
    .disposed(by: disposeBag)
        
        return output
    }
}
