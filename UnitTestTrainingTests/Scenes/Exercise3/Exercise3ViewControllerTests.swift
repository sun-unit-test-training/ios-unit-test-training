//
//  Exercise3ViewControllerTests.swift
//  UnitTestTraining
//
//  Created by Nguyen.dong.son on 9/11/20.
//  Copyright © 2020 Sun-Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import Reusable

final class Exercise3ViewControllerTests: XCTestCase {
    var viewController: Exercise3ViewController!

    override func setUp() {
        super.setUp()
        viewController = Exercise3ViewController.instantiate()
    }

    func test_ibOutlets() {
        _ = viewController.view
        XCTAssertNotNil(viewController.tableView)
        XCTAssertNotNil(viewController.discountLabel)
    }
}
