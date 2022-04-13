//
//  ProjectTests.swift
//  ProjectTests
//
//  Created by Federico on 13/04/2022.
//

import XCTest

class ProjectTests: XCTestCase {

    func test_converts_zulu_time_to_string() throws {
        let date = "2007-04-02T07:00:00Z"
        let result = formatDate(date: date)
        XCTAssertEqual(result, "2 apr 2007")
    }
}
