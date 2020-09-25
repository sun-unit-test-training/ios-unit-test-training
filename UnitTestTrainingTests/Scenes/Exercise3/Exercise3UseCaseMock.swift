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
    
    // MARK: - getClotherData
    
    var getClotherItemsCalled = false
    var getClotherItemsReturnValue: [ClotherOrderItem] = {
        return [
            ClotherOrderItem(type: .whiteShirt),
            ClotherOrderItem(type: .tie),
            ClotherOrderItem(type: .other)
        ]
    }()
    
    func getClotherItems() -> [ClotherOrderItem] {
        getClotherItemsCalled = true
        return getClotherItemsReturnValue
    }
    
    // MARK: - getDiscount
    
    var getDiscountCalled = false
    var getDiscountReturnValue = 0.12
    
    func getDiscount(of order: ClotherOrder) -> Double {
        getDiscountCalled = true
        return getDiscountReturnValue
    }
}
