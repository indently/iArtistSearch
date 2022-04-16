//
//  Content-ViewModelTests.swift
//  ProjectTests
//
//  Created by Federico on 13/04/2022.
//

import XCTest

class Content_ViewModelTests: XCTestCase {

    func test_decodeJSON_returnsDecodedJSON() {
        let json = "Search.json"
        let result: ItunesResult = Bundle.main.decode(file: json)
        
        XCTAssertNotNil(result)
    }
    
    func test_fetchResults_returnsResults() {
        // Implement more tests
    }

}
