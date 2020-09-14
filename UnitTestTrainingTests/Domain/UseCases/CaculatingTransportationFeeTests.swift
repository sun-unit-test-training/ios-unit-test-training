//
//  CaculatingTransportationFeeTests.swift
//  UnitTestTrainingTests
//
//  Created by Dung Khuat on 9/14/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//
@testable import UnitTestTraining
import XCTest

final class CaculatingTransportationFeeTests: XCTestCase, CaculatingTransportationFee {

    override func setUp() {
        super.setUp()
    }

    /// Test case 1
    /// - Thành viên premium - Y
    /// - Mua hàng trên 5,000円/yên - Y
    /// - Giao hàng siêu tốc - Y
    
    func testCase1_calculationFee() {
        let result = self.calculationFee(isPremiumMember: true, isQuickDeliver: true, isCartAmountGreaterThan5000: true)
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }
    
    /// Test case 2
    /// - Thành viên premium - Y
    /// - Mua hàng trên 5,000円/yên - Y
    /// - Giao hàng siêu tốc - N
    
    func testCase2_calculationFee() {
        let result = self.calculationFee(isPremiumMember: true,
                                         isQuickDeliver: false,
                                         isCartAmountGreaterThan5000: true)
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 0.0)
    }
    
    /// Test case 3
    /// - Thành viên premium - Y
    /// - Mua hàng trên 5,000円/yên - N
    /// - Giao hàng siêu tốc - Y
    
    func testCase3_calculationFee() {
        let result = self.calculationFee(isPremiumMember: true,
                                         isQuickDeliver: true,
                                         isCartAmountGreaterThan5000: false)
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }
    
    /// Test case 4
    /// - Thành viên premium - Y
    /// - Mua hàng trên 5,000円/yên - N
    /// - Giao hàng siêu tốc - N
    
    func testCase4_calculationFee() {
        let result = self.calculationFee(isPremiumMember: true,
                                         isQuickDeliver: false,
                                         isCartAmountGreaterThan5000: false)
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 0.0)
    }
    
    /// Test case 5
    /// - Thành viên premium - N
    /// - Mua hàng trên 5,000円/yên - Y
    /// - Giao hàng siêu tốc - Y
    
    func testCase5_calculationFee() {
        let result = self.calculationFee(isPremiumMember: false,
                                         isQuickDeliver: true,
                                         isCartAmountGreaterThan5000: true)
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }
    
    /// Test case 6
    /// - Thành viên premium - N
    /// - Mua hàng trên 5,000円/yên - Y
    /// - Giao hàng siêu tốc - N
    
    func testCase6_calculationFee() {
        let result = self.calculationFee(isPremiumMember: false,
                                         isQuickDeliver: false,
                                         isCartAmountGreaterThan5000: true)
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 0.0)
    }
    
    /// Test case 7
    /// - Thành viên premium - N
    /// - Mua hàng trên 5,000円/yên - N
    /// - Giao hàng siêu tốc - Y
    
    func testCase7_calculationFee() {
        let result = self.calculationFee(isPremiumMember: false,
                                         isQuickDeliver: true,
                                         isCartAmountGreaterThan5000: false)
        XCTAssertEqual(result.standardFee, 500.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }
    
    /// Test case 8
    /// - Thành viên premium - N
    /// - Mua hàng trên 5,000円/yên - N
    /// - Giao hàng siêu tốc - N
    
    func testCase8_calculationFee() {
        let result = self.calculationFee(isPremiumMember: false,
                                         isQuickDeliver: false,
                                         isCartAmountGreaterThan5000: false)
        XCTAssertEqual(result.standardFee, 500.0)
        XCTAssertEqual(result.quickFee, 0.0)
    }
}
