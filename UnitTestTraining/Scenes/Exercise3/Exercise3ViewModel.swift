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
        let subtractTrigger: Driver<IndexPath>
    }

    struct Output {
        @Property var discount: Double = 0
        @Property var clotherList = [ClotherViewModel]()
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        let clotherOrderSubject = BehaviorRelay(value: ClotherOrder())
                
        input.loadTrigger
            .map { self.useCase.getClotherItems() }
            .map { ClotherOrder(items: $0) }
            .drive(clotherOrderSubject)
            .disposed(by: disposeBag)
        
        clotherOrderSubject
            .asDriver()
            .map { $0.items.map(ClotherViewModel.init) }
            .drive(output.$clotherList)
            .disposed(by: disposeBag)
        
        input.subtractTrigger
            .drive(onNext: { indexPath in
                var order = clotherOrderSubject.value
                let item = order.items[indexPath.row]
                order.subtract(item)
                clotherOrderSubject.accept(order)
            })
            .disposed(by: disposeBag)
        
        input.addTrigger
            .drive(onNext: { indexPath in
                var order = clotherOrderSubject.value
                let item = order.items[indexPath.row]
                order.add(item)
                clotherOrderSubject.accept(order)
            })
            .disposed(by: disposeBag)
        
        clotherOrderSubject
            .asDriver()
            .map { order in
                self.useCase.getDiscount(of: order)
            }
            .drive(output.$discount)
            .disposed(by: disposeBag)
        
        return output
    }
}
