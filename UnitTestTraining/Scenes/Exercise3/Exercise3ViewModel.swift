//
//  Exercise3ViewModel.swift
//  UnitTestTraining
//
//  Created by Nguyen.dong.son on 9/11/20.
//  Copyright © 2020 Sun-Asterisk. All rights reserved.
//

import RxSwift
import RxCocoa
import MGArchitecture
import UIKit

struct Exercise3ViewModel {
    let navigator: Exercise3NavigatorType
    let useCase: Exercise3UseCaseType
}

// MARK: - ViewModelType
extension Exercise3ViewModel: ViewModel {
    
    struct Input {
        let loadTrigger: Driver<Void>
        let addTrigger: Driver<IndexPath>
        let minusTrigger: Driver<IndexPath>
    }

    struct Output {
        @Property var discount = ""
        @Property var clotherList = [ClotherViewModel]()
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        let clotherListSubject = BehaviorRelay<[ClotherOrderItem]>(value: [])
                
        input.loadTrigger
            .map { _ in
                return self.useCase.getClotherData()
            }
            .drive(clotherListSubject)
            .disposed(by: disposeBag)
        
        clotherListSubject
            .asDriver()
            .map { $0.map(ClotherViewModel.init) }
            .drive(output.$clotherList)
            .disposed(by: disposeBag)
        
        select(trigger: input.minusTrigger, items: clotherListSubject.asDriver())
            .map { clother in
                let dto = CaculatingClotherDiscountDto(clother: clother, currentClothers: clotherListSubject.value)
                return self.useCase.minus(dto: dto)
            }
            .drive(clotherListSubject)
            .disposed(by: disposeBag)
        
        select(trigger: input.addTrigger, items: clotherListSubject.asDriver())
            .map { clother in
                let dto = CaculatingClotherDiscountDto(clother: clother, currentClothers: clotherListSubject.value)
                return self.useCase.add(dto: dto)
            }
            .drive(clotherListSubject)
            .disposed(by: disposeBag)
        
        let getDiscount = clotherListSubject
            .asDriver()
            .map { subject in
                self.useCase.getDiscount(clothers: subject)
            }
        
        getDiscount
            .drive(output.$discount)
            .disposed(by: disposeBag)
        
        return output
    }
}
