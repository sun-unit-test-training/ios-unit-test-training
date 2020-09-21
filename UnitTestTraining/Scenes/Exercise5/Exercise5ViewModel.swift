//
//  Exercise5ViewModel.swift
//  UnitTestTraining
//
//  Created by can.khac.nguyen on 9/17/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import RxSwift
import RxCocoa
import MGArchitecture

struct Exercise5ViewModel {
    let navigator: Exercise5NavigatorType
    let useCase: Exercise5UseCaseType
}

// MARK: - ViewModel

extension Exercise5ViewModel: ViewModel {
    struct Input {
        let loadTrigger: Driver<Void>
        let priceTrigger: Driver<String>
        let receiveMethodTrigger: Driver<Int>
        let usingCouponTrigger: Driver<Bool>
        let intoMoneyTrigger: Driver<Void>
    }
    
    struct Output {
        @Property var isHiddenUsingCoupon = false
        @Property var errorMessage = ""
        @Property var fee = CalculatePizzaFeeResult(fee: 0.0, promotions: [])
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        let price = input.priceTrigger.startWith("")
        let receiveMethod = input.receiveMethodTrigger
            .map { ReceiveMethod(rawValue: $0) ?? .deliver }
            .startWith(.deliver)
        let usingCoupon = input.usingCouponTrigger.startWith(false)
        
        receiveMethod
            .map { $0 == .takeAway }
            .drive(output.$isHiddenUsingCoupon)
            .disposed(by: disposeBag)
        
        input.priceTrigger
            .map(useCase.validatePizzaPrice(_:))
            .map { $0.message }
            .drive(output.$errorMessage)
            .disposed(by: disposeBag)
        
        input.intoMoneyTrigger
            .withLatestFrom(Driver.combineLatest(price, receiveMethod, usingCoupon))
            .map { price, receiveMethod, usingCoupon -> CalculatePizzaFeeResult in
                let dto = CalculatePizzaFeeDto(priceString: price,
                                               receiveMethod: receiveMethod,
                                               usingCoupon: usingCoupon)
                return self.useCase.calculateFee(dto: dto)
            }
            .drive(output.$fee)
            .disposed(by: disposeBag)
        
        return output
    }
}
