//
//  Exercise1ViewModel.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 9/13/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

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
        let promotionTimeTrigger: Driver<Bool>
    }
    
    struct Output {
        @Property var price = "0"
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        
        let usingVoucher = input.voucherTrigger
            .startWith(false)
        
        let isInPromotionTime = input.promotionTimeTrigger
            .startWith(false)
        
        Driver.merge(
            input.loadTrigger,
            input.voucherTrigger.mapToVoid(),
            input.promotionTimeTrigger.mapToVoid()
        )
        .withLatestFrom(Driver.combineLatest(usingVoucher, isInPromotionTime))
        .map { usingVoucher, isInPromotionTime -> Double in
            return self.useCase.calculateBeerPrice(
                usingVoucher: usingVoucher,
                isInPromotionTime: isInPromotionTime
            )
        }
        .map { $0.currency }
        .drive(output.$price)
        .disposed(by: disposeBag)
        
        return output
    }
}
