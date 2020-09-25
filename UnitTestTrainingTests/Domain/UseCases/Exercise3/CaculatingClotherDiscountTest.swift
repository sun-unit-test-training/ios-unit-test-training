//
//  CaculatingClotherDiscountTest.swift
//  UnitTestTrainingTests
//
//  Created by nguyen.dong.son on 9/14/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest

final class CaculatingClotherDiscountTest: XCTestCase, CaculatingClotherDiscount {
    
    override func setUp() {
        super.setUp()
    }
        
    /// Test case 1
    /// - total > = 7
    /// - have white shirt
    /// - have tie
    func test_case1() {
        // arrange
        let order = ClotherOrder(items: [ClotherOrderItem(total: 4, type: .whiteShirt),
                                         ClotherOrderItem(total: 4, type: .tie),
                                         ClotherOrderItem(total: 4, type: .other)])
        // act
        let result = self.getDiscount(of: order)
        
        // assert
        XCTAssertEqual(result, 0.12)
    }
    
    /// Test case 2
    /// - total > = 7
    /// - have white shirt
    /// - have not tie
    func test_case2() {
        // arrange
        let order = ClotherOrder(items: [ClotherOrderItem(total: 4, type: .whiteShirt),
                                         ClotherOrderItem(total: 0, type: .tie),
                                         ClotherOrderItem(total: 4, type: .other)])
        // act
        let result = self.getDiscount(of: order)
        
        // assert
        XCTAssertEqual(result, 0.07)
    }
    
    /// Test case 3
    /// - total > = 7
    /// - have not white shirt
    /// - have not tie
    func test_case3() {
        // arrange
        let order = ClotherOrder(items: [ClotherOrderItem(total: 0, type: .whiteShirt),
                                         ClotherOrderItem(total: 0, type: .tie),
                                         ClotherOrderItem(total: 7, type: .other)])
        
        // act
        let result = self.getDiscount(of: order)
        
        // assert
        XCTAssertEqual(result, 0.07)
    }
    
    /// Test case 4
    /// - total < 7
    /// - have white shirt
    /// - have tie
    func test_case4() {
        // arrange
        let order = ClotherOrder(items: [ClotherOrderItem(total: 1, type: .whiteShirt),
                                         ClotherOrderItem(total: 1, type: .tie),
                                         ClotherOrderItem(total: 1, type: .other)])
        
        // act
        let result = self.getDiscount(of: order)
        
        // assert
        XCTAssertEqual(result, 0.05)
    }
    
    /// Test case 5
    /// - total < 7
    /// - have white shirt
    /// - have not tie
    func test_case5() {
        // arrange
        let order = ClotherOrder(items: [ClotherOrderItem(total: 1, type: .whiteShirt),
                                         ClotherOrderItem(total: 0, type: .tie),
                                         ClotherOrderItem(total: 2, type: .other)])
        
        // act
        let result = self.getDiscount(of: order)
        
        // assert
        XCTAssertEqual(result, 0)
    }
    
    /// Test case 6
    /// - total < 7
    /// - have not white shirt
    /// - have not tie
    func test_case6() {
        // arrange
        let order = ClotherOrder(items: [ClotherOrderItem(total: 0, type: .whiteShirt),
                                         ClotherOrderItem(total: 0, type: .tie),
                                         ClotherOrderItem(total: 2, type: .other)])
        
        // act
        let result = self.getDiscount(of: order)
        
        // assert
        XCTAssertEqual(result, 0)
    }
}

