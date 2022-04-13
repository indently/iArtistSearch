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
    
    func test_decodeJSON_returnsDecodedJSON() {
        let json = "Search.json"
        let result: ItunesResult = Bundle.main.decode(file: json)
        
        XCTAssertNotNil(result)
    }
}

