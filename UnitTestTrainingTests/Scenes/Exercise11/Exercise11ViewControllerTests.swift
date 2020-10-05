//
//  Exercise11ViewControllerTests.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 10/5/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import Reusable

final class Exercise11ViewControllerTests: XCTestCase {
    private var viewController: Exercise11ViewController!

    override func setUp() {
		super.setUp()
        viewController = Exercise11ViewController.instantiate()
	}

    func test_ibOutlets() {
        _ = viewController.view
        XCTAssertNotNil(viewController.tableView)
    }
}
