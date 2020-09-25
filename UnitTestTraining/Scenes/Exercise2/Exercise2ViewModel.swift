//
//  Exercise2ViewModel.swift
//  TrainingTest
//
//  Created by trinh.giang.dong on 9/16/20.
//  Copyright © 2020 Sun-Asterisk. All rights reserved.
//

import MGArchitecture
import RxSwift
import RxCocoa
import UIKit
import Foundation

struct Exercise2ViewModel {
    let navigator: Exercise2NavigatorType
    let useCase: Exercise2UseCaseType
}

// MARK: - ViewModelType
extension Exercise2ViewModel: ViewModel {
    struct Input {
        let isVIPTrigger: Driver<Bool>
        let dateTrigger: Driver<Date>
        let submitTrigger: Driver<Void>
    }

    struct Output {
        @Property var pickedDate = Date()
        @Property var fee = 0
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        
        input.dateTrigger
            .drive(output.$pickedDate)
            .disposed(by: disposeBag)
        
        input.submitTrigger
            .withLatestFrom(input.isVIPTrigger)
            .withLatestFrom(input.dateTrigger) { isVIP, date in
                return (isVIP, date)
            }
            .map { (isVIP, date) -> Int in
                let holidays = self.useCase.getHolidays()
                let dto = ATMWithdrawalDto(isVIP: isVIP,
                                           date: date,
                                           holidays: holidays)
                return self.useCase.calculateFee(dto: dto)
            }
            .drive(output.$fee)
            .disposed(by: disposeBag)
        
        return output
    }
}
