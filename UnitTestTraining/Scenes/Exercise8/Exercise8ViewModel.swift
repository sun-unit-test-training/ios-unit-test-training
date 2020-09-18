//
//  Exercise8ViewModel.swift
//  UnitTestTraining
//
//  Created by dungkv-1044 on 9/17/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import MGArchitecture
import RxSwift
import RxCocoa
import Foundation

struct Exercise8ViewModel {
    let navigator: Exercise8NavigatorType
    let useCase: Exercise8UseCaseType
}

// MARK: - ViewModelType
extension Exercise8ViewModel: ViewModel {
    
    struct Input {
        let loadTrigger: Driver<Void>
        let ageTrigger: Driver<String>
        let isMaleTrigger: Driver<Bool>
        let dateTrigger: Driver<Date>
    }

    struct Output {
        @Property var errorMessage = ""
        @Property var fee = 0.0
        @Property var genderString = "Nữ"
    }

    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        let age = input.ageTrigger.startWith("")
        let isMale = input.isMaleTrigger.startWith(false)
        let date = input.dateTrigger.startWith(Date())
        
        input.ageTrigger.asDriver()
            .map(useCase.validateAge(_:))
            .map { $0.message }
            .drive(output.$errorMessage)
            .disposed(by: disposeBag)
        
        input.isMaleTrigger
        .asDriver()
        .map { (isMale) -> String in
            return !isMale ? "Nữ" : "Nam"
        }
        .drive(output.$genderString)
        .disposed(by: disposeBag)
        
        Driver.merge(
            input.loadTrigger,
            input.ageTrigger.mapToVoid(),
            input.isMaleTrigger.mapToVoid(),
            input.dateTrigger.mapToVoid()
        )
        .withLatestFrom(Driver.combineLatest(age, isMale, date))
        .map { (age, isMale, date) -> Double in
            let age = Int(age) ?? 0
            let dto = CalculateBadmintonFeeDto(isMale: isMale, playDate: date, age: age)
            return self.useCase.calculatePlayFee(dto: dto)
        }
        .map { ($0) }
        .drive(output.$fee)
        .disposed(by: disposeBag)
        
        return output
    }
    
}
