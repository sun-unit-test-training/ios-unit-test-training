//
//  Exercise8ViewControllerTests.swift
//  UnitTestTraining
//
//  Created by dungkv-1044 on 9/17/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import Reusable

final class Exercise8ViewControllerTests: XCTestCase {
    var viewController: Exercise8ViewController!

    override func setUp() {
        super.setUp()
        viewController = Exercise8ViewController.instantiate()
    }

    func test_outlet() {
        _ = viewController.view
        XCTAssertNotNil(viewController.tableView)
        XCTAssertNotNil(viewController.ageTextField)
        XCTAssertNotNil(viewController.datePicker)
        XCTAssertNotNil(viewController.genderLabel)
        XCTAssertNotNil(viewController.genderSwitch)
    }
}
