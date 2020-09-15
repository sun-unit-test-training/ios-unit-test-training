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
        let cartAmount: Driver<String>
        let isSelectQuickDeliver: Driver<Bool>
    }

    struct Output {
        @Property var fee: (standardFee: Double, quickFee: Double)
        @Property var errorMessage = ""
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output(fee: (0, 0))
        let isPremium = input.isPremiumTrigger.startWith(false)
        let cartAmount = input.cartAmount.startWith("5000.0")
        let isQuickDeliver = input.isSelectQuickDeliver.startWith(false)
        
        input.cartAmount
            .asDriver()
            .map { $0 }
            .map(useCase.validateCardAmount(_:))
            .drive(output.$errorMessage)
            .disposed(by: disposeBag)
        
        Driver.merge(input.loadTrigger,
                     input.isPremiumTrigger.mapToVoid(),
                     input.cartAmount.mapToVoid(),
                     input.isSelectQuickDeliver.mapToVoid()
        )
            .withLatestFrom(Driver.combineLatest(isPremium, cartAmount, isQuickDeliver))
            .map { isPremium, cartAmount, isQuickDeliver -> (standardFee: Double, quickFee: Double) in
                let amount = Double(cartAmount) ?? 0.0
                return self.useCase.calculationFee(
                    isPremiumMember: isPremium,
                    isQuickDeliver: isQuickDeliver,
                    cartAmount: amount)
            }
            .map { ($0.standardFee, $0.quickFee) }
            .drive(output.$fee)
            .disposed(by: disposeBag)
        
        return output
    }
}
