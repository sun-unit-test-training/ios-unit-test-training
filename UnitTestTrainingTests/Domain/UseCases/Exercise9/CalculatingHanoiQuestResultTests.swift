//
//  CalculatingHanoiQuestResultTests.swift
//  UnitTestTrainingTests
//
//  Created by Huy Pham on 9/25/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import XCTest
@testable import UnitTestTraining

final class CalculatingHanoiQuestResultTests: XCTestCase, CalculatingHanoiQuestResult {
    override func setUp() {
        super.setUp()
    }

    /**
     * Test case 1
     *  - Mang đũa phép
     *  - Có quân sư đồng hành
     *  - Có chìa khóa bóng đêm
     *  - Có kiếm ánh sáng
     */
    func test_case1() {
        // 1. Given
        let dto = HanoiQuestDto(
            bringMagicWand: true,
            bringStrategist: true,
            bringDarknessKey: true,
            bringLightSword: true
        )

        // 2. When
        let result = calculateHanoiQuestResult(dto: dto)

        // 3. Then
        XCTAssertEqual(result, .beatBigBoss)
    }

    /**
     * Test case 2
     *  - Mang đũa phép
     *  - Có quân sư đồng hành
     *  - Có chìa khóa bóng đêm
     *  - Không có kiếm ánh sáng
     */
    func test_case2() {
        // 1. Given
        let dto = HanoiQuestDto(
            bringMagicWand: true,
            bringStrategist: true,
            bringDarknessKey: true,
            bringLightSword: false
        )

        // 2. When
        let result = calculateHanoiQuestResult(dto: dto)

        // 3. Then
        XCTAssertEqual(result, .roomOpened)
    }

    /**
     * Test case 3
     *  - Mang đũa phép
     *  - Có quân sư đồng hành
     *  - Không có chìa khóa bóng đêm
     *  - Có kiếm ánh sáng
     */
    func test_case3() {
        // 1. Given
        let dto = HanoiQuestDto(
            bringMagicWand: true,
            bringStrategist: true,
            bringDarknessKey: false,
            bringLightSword: true
        )

        // 2. When
        let result = calculateHanoiQuestResult(dto: dto)

        // 3. Then
        XCTAssertEqual(result, .roomFound)
    }

    /**
     * Test case 4
     *  - Mang đũa phép
     *  - Không có quân sư đồng hành
     *  - Có chìa khóa bóng đêm
     *  - Có kiếm ánh sáng
     */
    func test_case4() {
        // 1. Given
        let dto = HanoiQuestDto(
            bringMagicWand: true,
            bringStrategist: false,
            bringDarknessKey: true,
            bringLightSword: true
        )

        // 2. When
        let result = calculateHanoiQuestResult(dto: dto)

        // 3. Then
        XCTAssertEqual(result, .beatBigBoss)
    }

    /**
     * Test case 5
     *  - Mang đũa phép
     *  - Không có quân sư đồng hành
     *  - Có chìa khóa bóng đêm
     *  - Không có kiếm ánh sáng
     */
    func test_case5() {
        // 1. Given
        let dto = HanoiQuestDto(
            bringMagicWand: true,
            bringStrategist: false,
            bringDarknessKey: true,
            bringLightSword: false
        )

        // 2. When
        let result = calculateHanoiQuestResult(dto: dto)

        // 3. Then
        XCTAssertEqual(result, .roomOpened)
    }

    /**
     * Test case 6
     *  - Mang đũa phép
     *  - Không có quân sư đồng hành
     *  - Không có chìa khóa bóng đêm
     *  - Có kiếm ánh sáng
     */
    func test_case6() {
        // 1. Given
        let dto = HanoiQuestDto(
            bringMagicWand: true,
            bringStrategist: false,
            bringDarknessKey: false,
            bringLightSword: true
        )

        // 2. When
        let result = calculateHanoiQuestResult(dto: dto)

        // 3. Then
        XCTAssertEqual(result, .roomFound)
    }

    /**
     * Test case 7
     *  - Không mang đũa phép
     *  - Có quân sư đồng hành
     *  - Có chìa khóa bóng đêm
     *  - Có kiếm ánh sáng
     */
    func test_case7() {
        // 1. Given
        let dto = HanoiQuestDto(
            bringMagicWand: false,
            bringStrategist: true,
            bringDarknessKey: true,
            bringLightSword: true
        )

        // 2. When
        let result = calculateHanoiQuestResult(dto: dto)

        // 3. Then
        XCTAssertEqual(result, .beatBigBoss)
    }

    /**
     * Test case 8
     *  - Không mang đũa phép
     *  - Có quân sư đồng hành
     *  - Có chìa khóa bóng đêm
     *  - Không có kiếm ánh sáng
     */
    func test_case8() {
        // 1. Given
        let dto = HanoiQuestDto(
            bringMagicWand: false,
            bringStrategist: true,
            bringDarknessKey: true,
            bringLightSword: false
        )

        // 2. When
        let result = calculateHanoiQuestResult(dto: dto)

        // 3. Then
        XCTAssertEqual(result, .roomOpened)
    }

    /**
     * Test case 9
     *  - Không mang đũa phép
     *  - Có quân sư đồng hành
     *  - Không có chìa khóa bóng đêm
     *  - Có kiếm ánh sáng
     */
    func test_case9() {
        // 1. Given
        let dto = HanoiQuestDto(
            bringMagicWand: false,
            bringStrategist: true,
            bringDarknessKey: false,
            bringLightSword: true
        )

        // 2. When
        let result = calculateHanoiQuestResult(dto: dto)

        // 3. Then
        XCTAssertEqual(result, .roomFound)
    }

    /**
     * Test case 10
     *  - Không mang đũa phép
     *  - Không có quân sư đồng hành
     *  - Có chìa khóa bóng đêm
     *  - Có kiếm ánh sáng
     */
    func test_case10() {
        // 1. Given
        let dto = HanoiQuestDto(
            bringMagicWand: false,
            bringStrategist: false,
            bringDarknessKey: true,
            bringLightSword: true
        )

        // 2. When
        let result = calculateHanoiQuestResult(dto: dto)

        // 3. Then
        XCTAssertEqual(result, .roomNotFound)
    }
}
