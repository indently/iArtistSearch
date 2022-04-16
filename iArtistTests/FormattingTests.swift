//
//  ProjectTests.swift
//  ProjectTests
//
//  Created by Federico on 13/04/2022.
//

import XCTest

class UtilsTests: XCTestCase {

    func test_inputStringZTime_returnsDecodedJSON() throws {
        let date = "2007-04-02T07:00:00Z"
        let result = formatDate(date: date)
        let expected = "2 apr 2007"
        XCTAssertEqual(result, expected)
    }
    
    func test_inputSpecialString_returnsEncodedString() {
        let sut = SearchFormatter()
        
        let actual = sut.formatSearchString(text: "Måneskin")
        let expected = "M%C3%A5neskin"
        
        XCTAssertEqual(actual, expected)
    }
    
    func test_validSearchString_returnsTrue() {
        let sut = SearchFormatter()
        
        let actual = sut.isValidSearch(text: "Hello")
        
        XCTAssertTrue(actual)
    }
}

