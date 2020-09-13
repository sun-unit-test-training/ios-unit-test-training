//
//  Exercise1ViewControllerTests.swift
//  UnitTestTrainingTests
//
//  Created by Tuan Truong on 9/13/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import UIKit
import Reusable

final class Exercise1ViewControllerTests: XCTestCase {
    var viewController: Exercise1ViewController!
    
    override func setUp() {
        super.setUp()
        viewController = Exercise1ViewController.instantiate()
    }
    
    func test_ibOutlets() {
        _ = viewController.view
        XCTAssertNotNil(viewController.voucherSwitch)
        XCTAssertNotNil(viewController.promotionTimeSwitch)
        XCTAssertNotNil(viewController.priceLabel)
    }
}
