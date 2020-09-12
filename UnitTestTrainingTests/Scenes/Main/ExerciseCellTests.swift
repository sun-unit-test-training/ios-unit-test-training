//
//  ExerciseCellTests.swift
//  UnitTestTrainingTests
//
//  Created by Tuan Truong on 9/12/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest

final class ExerciseCellTests: XCTestCase {
    var cell: ExerciseCell!

    override func setUp() {
        super.setUp()
        cell = ExerciseCell.loadFromNib()
    }

    func test_ibOutlets() {
        XCTAssertNotNil(cell)
        XCTAssertNotNil(cell.titleLabel)
    }
}
