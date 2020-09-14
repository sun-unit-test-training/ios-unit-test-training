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
        // act
        let result = self.getDiscount(clothers: [ClotherOrderItem(count: 4, type: .whiteShirt),
                                                 ClotherOrderItem(count: 4, type: .tie),
                                                 ClotherOrderItem(count: 4, type: .other)])
        
        // assert
        XCTAssertEqual(result, "12%")
    }
    
    /// Test case 2
    /// - total > = 7
    /// - have white shirt
    /// - have not tie
    func test_case2() {
        // act
        let result = self.getDiscount(clothers: [ClotherOrderItem(count: 4, type: .whiteShirt),
                                                 ClotherOrderItem(count: 0, type: .tie),
                                                 ClotherOrderItem(count: 4, type: .other)])
        
        // assert
        XCTAssertEqual(result, "7%")
    }
    
    /// Test case 3
    /// - total > = 7
    /// - have not white shirt
    /// - have not tie
    func test_case3() {
        // act
        let result = self.getDiscount(clothers: [ClotherOrderItem(count: 0, type: .whiteShirt),
                                                 ClotherOrderItem(count: 0, type: .tie),
                                                 ClotherOrderItem(count: 7, type: .other)])
        
        // assert
        XCTAssertEqual(result, "7%")
    }
    
    /// Test case 4
    /// - total < 7
    /// - have white shirt
    /// - have tie
    func test_case4() {
        // act
        let result = self.getDiscount(clothers: [ClotherOrderItem(count: 1, type: .whiteShirt),
                                                 ClotherOrderItem(count: 1, type: .tie),
                                                 ClotherOrderItem(count: 1, type: .other)])
        
        // assert
        XCTAssertEqual(result, "5%")
    }
    
    /// Test case 5
    /// - total < 7
    /// - have white shirt
    /// - have not tie
    func test_case5() {
        // act
        let result = self.getDiscount(clothers: [ClotherOrderItem(count: 1, type: .whiteShirt),
                                                 ClotherOrderItem(count: 0, type: .tie),
                                                 ClotherOrderItem(count: 2, type: .other)])
        
        // assert
        XCTAssertEqual(result, "0%")
    }
    
    /// Test case 6
    /// - total < 7
    /// - have not white shirt
    /// - have not tie
    func test_case6() {
        // act
        let result = self.getDiscount(clothers: [ClotherOrderItem(count: 0, type: .whiteShirt),
                                                 ClotherOrderItem(count: 0, type: .tie),
                                                 ClotherOrderItem(count: 2, type: .other)])
        
        // assert
        XCTAssertEqual(result, "0%")
    }
}

