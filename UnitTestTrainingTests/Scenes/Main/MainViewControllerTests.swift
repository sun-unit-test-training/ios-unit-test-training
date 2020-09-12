//
//  MainViewControllerTests.swift
//  UnitTestTrainingTests
//
//  Created by Tuan Truong on 9/12/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import UIKit
import Reusable

final class MainViewControllerTests: XCTestCase {
    var viewController: MainViewController!
    
    override func setUp() {
        super.setUp()
        viewController = MainViewController.instantiate()
    }
    
    func test_ibOutlets() {
        _ = viewController.view
        XCTAssertNotNil(viewController.tableView)
    }
}
