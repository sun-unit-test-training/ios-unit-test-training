//
//  Exercise3UseCase.swift
//  UnitTestTraining
//
//  Created by Nguyen.dong.son on 9/11/20.
//  Copyright © 2020 Sun-Asterisk. All rights reserved.
//
import Then
import RxSwift

protocol Exercise3UseCaseType {
    func getClotherData() -> [ClotherOrderItem]
    func getDiscount(clothers: [ClotherOrderItem]) -> Double
    func minus(dto: CaculatingClotherDiscountDto) -> [ClotherOrderItem]
    func add(dto: CaculatingClotherDiscountDto) -> [ClotherOrderItem]
}

struct Exercise3UseCase: Exercise3UseCaseType, CaculatingClotherDiscount {
    
}
