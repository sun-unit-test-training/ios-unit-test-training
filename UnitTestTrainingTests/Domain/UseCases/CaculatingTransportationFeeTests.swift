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

    let errorMessage = "Incorrect"
    
    override func setUp() {
        super.setUp()
    }

    /// Test case 1
    /// - Thành viên premium - Y
    /// - Mua hàng trên 5,000円/yên - Y
    /// - Giao hàng siêu tốc - Y
    
    func testCase1_calculationFee() {
        let result = self.calculationFee(isPremiumMember: true, isQuickDeliver: true, cartAmount: 6000.0)
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
                                         cartAmount: 5100.0)
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
                                         cartAmount: 4900.0)
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
                                         cartAmount: 3000.0)
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
                                         cartAmount: 7000.0)
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
                                         cartAmount: 5100.0)
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
                                         cartAmount: 4750.0)
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
                                         cartAmount: 3400.0)
        XCTAssertEqual(result.standardFee, 500.0)
        XCTAssertEqual(result.quickFee, 0.0)
    }
    
    /// Testcase 9
    func test_cartAmountInputInvalid1() {
        let result = self.validateCardAmount("abca")
        XCTAssertEqual(result, errorMessage)
    }
    
    func test_cartAmountInputInvalid2() {
        let result = self.validateCardAmount("ab41ca")
        XCTAssertEqual(result, errorMessage)
    }
    
    func test_cartAmountInputValid1() {
        let result = self.validateCardAmount("500")
        XCTAssertEqual(result, "")
    }
    
    func test_cartAmountInputValid2() {
        let result = self.validateCardAmount("5000")
        XCTAssertEqual(result, "")
    }
}
