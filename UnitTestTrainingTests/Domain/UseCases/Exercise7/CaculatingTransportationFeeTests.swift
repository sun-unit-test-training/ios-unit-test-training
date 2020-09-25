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
        let dto = VietnamMartOrderDto(isPremiumMember: true, isQuickDeliver: true, cartAmount: 6000.0)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }
    
    /// Test case 2
    /// - Thành viên premium - Y
    /// - Mua hàng trên 5,000円/yên - Y
    /// - Giao hàng siêu tốc - N
    
    func testCase2_calculationFee() {
        let dto = VietnamMartOrderDto(isPremiumMember: true, isQuickDeliver: false, cartAmount: 5100.0)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 0.0)
    }
    
    /// Test case 3
    /// - Thành viên premium - Y
    /// - Mua hàng trên 5,000円/yên - N
    /// - Giao hàng siêu tốc - Y
    
    func testCase3_calculationFee() {
        let dto = VietnamMartOrderDto(isPremiumMember: true, isQuickDeliver: true, cartAmount: 4900.0)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }
    
    /// Test case 4
    /// - Thành viên premium - Y
    /// - Mua hàng trên 5,000円/yên - N
    /// - Giao hàng siêu tốc - N
    
    func testCase4_calculationFee() {
        let dto = VietnamMartOrderDto(isPremiumMember: true, isQuickDeliver: false, cartAmount: 6000.0)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 0.0)
    }
    
    /// Test case 5
    /// - Thành viên premium - N
    /// - Mua hàng trên 5,000円/yên - Y
    /// - Giao hàng siêu tốc - Y
    
    func testCase5_calculationFee() {
        let dto = VietnamMartOrderDto(isPremiumMember: false, isQuickDeliver: true, cartAmount: 7000.0)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }
    
    /// Test case 6
    /// - Thành viên premium - N
    /// - Mua hàng trên 5,000円/yên - Y
    /// - Giao hàng siêu tốc - N
    
    func testCase6_calculationFee() {
        let dto = VietnamMartOrderDto(isPremiumMember: false, isQuickDeliver: false, cartAmount: 5100.0)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 0.0)
    }
    
    /// Test case 7
    /// - Thành viên premium - N
    /// - Mua hàng trên 5,000円/yên - N
    /// - Giao hàng siêu tốc - Y
    
    func testCase7_calculationFee() {
        let dto = VietnamMartOrderDto(isPremiumMember: false, isQuickDeliver: true, cartAmount: 4750.0)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 500.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }
    
    /// Test case 8
    /// - Thành viên premium - N
    /// - Mua hàng trên 5,000円/yên - N
    /// - Giao hàng siêu tốc - N
    
    func testCase8_calculationFee() {
        let dto = VietnamMartOrderDto(isPremiumMember: false, isQuickDeliver: false, cartAmount: 3400.0)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 500.0)
        XCTAssertEqual(result.quickFee, 0.0)
    }
    
    /// Test case 9
    /// - Thành viên premium - N
    /// - Mua hàng trên 5,000円/yên - Y
    /// - Giao hàng siêu tốc - Y
    
    func testCase9_calculationFee() {
        let dto = VietnamMartOrderDto(isPremiumMember: false, isQuickDeliver: true, cartAmount: 5000.0)
        let result = self.calculationFee(dto: dto)
        XCTAssertEqual(result.standardFee, 0.0)
        XCTAssertEqual(result.quickFee, 500.0)
    }
}
