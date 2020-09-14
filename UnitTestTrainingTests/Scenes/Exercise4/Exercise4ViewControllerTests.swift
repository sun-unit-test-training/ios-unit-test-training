//
//  Exercise4ViewControllerTests.swift
//  UnitTestTraining
//
//  Created by Long Vu on 9/10/20.
//  Copyright © 2020 Sun*. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import Reusable

final class Exercise4ViewControllerTests: XCTestCase {
    var viewController: Exercise4ViewController!

    override func setUp() {
        super.setUp()
        viewController = Exercise4ViewController.instantiate()
    }

    func test_ibOutlets() {
        _ = viewController.view
        XCTAssertNotNil(viewController.dateBackgroundView)
        XCTAssertNotNil(viewController.dateLabel)
        XCTAssertNotNil(viewController.datePicker)
    }
}
