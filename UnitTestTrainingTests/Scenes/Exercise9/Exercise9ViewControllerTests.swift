//
//  Exercise9ViewControllerTests.swift
//  UnitTestTrainingTests
//
//  Created by Huy Pham on 9/25/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import UIKit
import Reusable

final class Exercise9ViewControllerTests: XCTestCase {

    var viewController: Exercise9ViewController!

    override func setUp() {
        super.setUp()
        viewController = Exercise9ViewController.instantiate()
    }

    func test_ibOutlets() {
        // When
        _ = viewController.view

        // Then
        XCTAssertNotNil(viewController.magicWandSelectionSwitch)
        XCTAssertNotNil(viewController.strategistSelectionSwitch)
        XCTAssertNotNil(viewController.darknessKeySelectionSwitch)
        XCTAssertNotNil(viewController.lightSwordSelectionSwitch)
        XCTAssertNotNil(viewController.hitBigBossButton)
        XCTAssertNotNil(viewController.resultLabel)
    }
}
