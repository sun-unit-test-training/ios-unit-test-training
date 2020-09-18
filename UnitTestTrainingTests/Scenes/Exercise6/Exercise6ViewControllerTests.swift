//
//  Exercise6ViewControllerTests.swift
//  UnitTestTrainingTests
//
//  Created by nguyen.the.trinh on 9/17/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import UIKit
import Reusable

final class Exercise6ViewControllerTests: XCTestCase {
    var viewController: Exercise6ViewController!
    
    override func setUp() {
        super.setUp()
        viewController = Exercise6ViewController.instantiate()
    }
    
    func test_ibOutlets() {
        _ = viewController.view
        XCTAssertNotNil(viewController.watchMovieSwitch)
        XCTAssertNotNil(viewController.moneySpentTextField)
        XCTAssertNotNil(viewController.errorMessageLabel)
        XCTAssertNotNil(viewController.freeMinutesLabel)
    }
}
