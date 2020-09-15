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
        guard let purchaseTime = Date(hour: 9) else { return }
        let dto = CalculateBeerPriceDto(usingVoucher: true, purchaseTime: purchaseTime)
        let result = self.calculateBeerPrice(dto: dto)
        
        // assert
        XCTAssertEqual(result, 100.0)
    }
    
    /// Test case 2
    /// - No voucher
    /// - In promotion time
    func test_calculateBeerPrice_inPromotionTime() {
        // act
        guard let purchaseTime = Date(hour: 16) else { return }
        let dto = CalculateBeerPriceDto(usingVoucher: false, purchaseTime: purchaseTime)
        let result = self.calculateBeerPrice(dto: dto)
        
        // assert
        XCTAssertEqual(result, 290.0)
    }
    
    /// Test case 3
    /// - No voucher
    /// - Not in promotion time
    func test_calculateBeerPrice() {
        // act
        guard let purchaseTime = Date(hour: 9) else { return }
        let dto = CalculateBeerPriceDto(usingVoucher: false, purchaseTime: purchaseTime)
        let result = self.calculateBeerPrice(dto: dto)
        
        // assert
        XCTAssertEqual(result, 490.0)
    }

}
