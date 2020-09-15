//
//  Exercise1ViewModel.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 9/13/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation
import MGArchitecture
import RxSwift
import RxCocoa

struct Exercise1ViewModel {
    let navigator: Exercise1NavigatorType
    let useCase: Exercise1UseCaseType
}

// MARK: - ViewModel
extension Exercise1ViewModel: ViewModel {
    struct Input {
        let loadTrigger: Driver<Void>
        let voucherTrigger: Driver<Bool>
        let purchaseTimeTrigger: Driver<Date>
    }
    
    struct Output {
        @Property var price = "0"
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        
        let usingVoucher = input.voucherTrigger
            .startWith(false)
        
        let purchaseTime = input.purchaseTimeTrigger
            .startWith(Date())
        
        Driver.merge(
            input.loadTrigger,
            input.voucherTrigger.mapToVoid(),
            input.purchaseTimeTrigger.mapToVoid()
        )
        .withLatestFrom(Driver.combineLatest(usingVoucher, purchaseTime))
        .map { usingVoucher, purchaseTime -> Double in
            let dto = CalculateBeerPriceDto(usingVoucher: usingVoucher, purchaseTime: purchaseTime)
            return self.useCase.calculateBeerPrice(dto: dto)
        }
        .map { $0.japanCurrency }
        .drive(output.$price)
        .disposed(by: disposeBag)
        
        return output
    }
}
