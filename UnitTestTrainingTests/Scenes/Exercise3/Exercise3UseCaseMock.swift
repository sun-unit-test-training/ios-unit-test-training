//
//  Exercise3UseCaseMock.swift
//  UnitTestTraining
//
//  Created by Nguyen.dong.son on 9/11/20.
//  Copyright © 2020 Sun-Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import RxSwift

final class Exercise3UseCaseMock: Exercise3UseCaseType {
    var getClotherDataCalled = false
    var getClotherDataReturnValue: [ClotherOrderItem] = {
        return [
            ClotherOrderItem(type: .whiteShirt),
            ClotherOrderItem(type: .tie),
            ClotherOrderItem(type: .other)
        ]
    }()
    
    func getClotherData() -> [ClotherOrderItem] {
        getClotherDataCalled = true
        return getClotherDataReturnValue
    }
    
    var getDiscountReturnValue = 0.12
    var getDiscountCalled = false
    
    func getDiscount(clothers: [ClotherOrderItem]) -> Double {
        getDiscountCalled = true
        return getDiscountReturnValue
    }
    
    var minusCalled = false
    
    func minus(dto: CaculatingClotherDiscountDto) -> [ClotherOrderItem] {
        minusCalled = true
        return [
            ClotherOrderItem(total: 1, type: .whiteShirt),
            ClotherOrderItem(total: 1, type: .tie),
            ClotherOrderItem(total: 1, type: .other)
        ]
    }
    
    var addCalled = false
    
    func add(dto: CaculatingClotherDiscountDto) -> [ClotherOrderItem] {
        addCalled = true
        return [
            ClotherOrderItem(total: 1, type: .whiteShirt),
            ClotherOrderItem(total: 1, type: .tie),
            ClotherOrderItem(total: 1, type: .other)
        ]
    }
}
