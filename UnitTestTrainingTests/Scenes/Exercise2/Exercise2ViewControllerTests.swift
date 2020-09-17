//
//  Exercise2ViewControllerTests.swift
//  TrainingTest
//
//  Created by trinh.giang.dong on 9/16/20.
//  Copyright © 2020 Sun-Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import Reusable

final class Exercise2ViewControllerTests: XCTestCase {
    var viewController: Exercise2ViewController!

    override func setUp() {
        super.setUp()
        viewController = Exercise2ViewController.instantiate()
    }

    func test_ibOutlets() {
        _ = viewController.view
        XCTAssertNotNil(viewController.vipSwitch)
        XCTAssertNotNil(viewController.submitButton)
    }
}
