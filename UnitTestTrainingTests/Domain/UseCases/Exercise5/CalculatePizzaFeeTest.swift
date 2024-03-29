//
//  CalculatePizzaFeeTest.swift
//  UnitTestTrainingTests
//
//  Created by can.khac.nguyen on 9/20/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class CalculatePizzaFeeTest: XCTestCase, CalculatePizzaFee {
    
    override func setUp() {
        super.setUp()
    }
    
    /// Test case  1 (High price ~ price > 1500)
    func test_highPrice_deliverMethod_usingCoupon() {
        let dto = PizzaOrderDto(price: "1501", receiveMethod: .deliver, usingCoupon: true)
        let result = self.calculateFee(dto: dto)
        XCTAssertEqual(result.fee, 1200.8)
        XCTAssert(result.promotions.contains(.freePotato))
        XCTAssertFalse(result.promotions.contains(.freeOnMonday))
    }
    
    /// Test case  2 (High price ~ price > 1500)
    func test_highPrice_deliverMethod() {
        let dto = PizzaOrderDto(price: "1501", receiveMethod: .deliver, usingCoupon: false)
        let result = self.calculateFee(dto: dto)
        XCTAssertEqual(result.fee, 1501.0)
        XCTAssert(result.promotions.contains(.freePotato))
        XCTAssertFalse(result.promotions.contains(.freeOnMonday))
    }
    
    /// Test case  3 (High price ~ price > 1500)
    func test_highPrice_takeAwayMethod() {
        let dto = PizzaOrderDto(price: "1501", receiveMethod: .takeAway, usingCoupon: false)
        let result = self.calculateFee(dto: dto)
        XCTAssertEqual(result.fee, 1501.0)
        XCTAssert(result.promotions.contains(.freePotato))
        XCTAssert(result.promotions.contains(.freeOnMonday))
    }
    
    /// Test case  4 (Low price ~ price <= 1500)
    func test_lowPrice_deliverMethod_usingCoupon() {
        let dto = PizzaOrderDto(price: "1500", receiveMethod: .deliver, usingCoupon: true)
        let result = self.calculateFee(dto: dto)
        XCTAssertEqual(result.fee, 1200.0)
        XCTAssertFalse(result.promotions.contains(.freePotato))
        XCTAssertFalse(result.promotions.contains(.freeOnMonday))
    }
    
    /// Test case  5 (Low price ~ price <= 1500)
    func test_lowPrice_deliverMethod() {
        let dto = PizzaOrderDto(price: "1500", receiveMethod: .deliver, usingCoupon: false)
        let result = self.calculateFee(dto: dto)
        XCTAssertEqual(result.fee, 1500.0)
        XCTAssertFalse(result.promotions.contains(.freePotato))
        XCTAssertFalse(result.promotions.contains(.freeOnMonday))
    }
    
    /// Test case  6 (Low price ~ price <= 1500)
    func test_lowPrice_takeAwayMethod() {
        let dto = PizzaOrderDto(price: "1500", receiveMethod: .takeAway, usingCoupon: false)
        let result = self.calculateFee(dto: dto)
        XCTAssertEqual(result.fee, 1500.0)
        XCTAssertFalse(result.promotions.contains(.freePotato))
        XCTAssert(result.promotions.contains(.freeOnMonday))
    }
    
    func test_validatePizzaPrice_success() {
        let result = self.validatePizzaPrice("1500")
        XCTAssert(result.isValid)
    }
    
    func test_validatePizzaPrice_failed() {
        let result = self.validatePizzaPrice("0")
        XCTAssertFalse(result.isValid)
    }
    
    func test_validatePizzaPrice_failed_NaN() {
        let result = self.validatePizzaPrice("abc")
        XCTAssertFalse(result.isValid)
    }
}
