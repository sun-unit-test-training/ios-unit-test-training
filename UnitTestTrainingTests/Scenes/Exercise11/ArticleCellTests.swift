//
//  ArticleCellTests.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 10/5/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import Reusable

final class ArticleCellTests: XCTestCase {
    var cell: ArticleCell!

    override func setUp() {
        super.setUp()
        cell = ArticleCell.loadFromNib()
    }

    func test_ibOutlets() {
        XCTAssertNotNil(cell)
        XCTAssertNotNil(cell.authorLabel)
        XCTAssertNotNil(cell.titleLabel)
        XCTAssertNotNil(cell.descriptionLabel)
    }
}
