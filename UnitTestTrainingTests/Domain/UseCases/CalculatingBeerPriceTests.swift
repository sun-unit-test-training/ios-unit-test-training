//
//  CalculatingBeerPriceTests.swift
//  UnitTestTrainingTests
//
//  Created by Tuan Truong on 9/13/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest

final class CalculatingBeerPriceTests: XCTestCase, CalculatingBeerPrice {
    
    override func setUp() {
        super.setUp()
    }
    
    /// Test case 1
    /// - Using voucher
    /// - Not in promotion time
    func test_calculateBeerPrice_usingVoucher() {
        // act
        let result = self.calculateBeerPrice(usingVoucher: true, isInPromotionTime: false)
        
        // assert
        XCTAssertEqual(result, 100.0)
    }
    
    /// Test case 2
    /// - No voucher
    /// - In promotion time
    func test_calculateBeerPrice_inPromotionTime() {
        // act
        let result = self.calculateBeerPrice(usingVoucher: false, isInPromotionTime: true)
        
        // assert
        XCTAssertEqual(result, 290.0)
    }
    
    /// Test case 3
    /// - No voucher
    /// - Not in promotion time
    func test_calculateBeerPrice() {
        // act
        let result = self.calculateBeerPrice(usingVoucher: false, isInPromotionTime: false)
        
        // assert
        XCTAssertEqual(result, 490.0)
    }

}
