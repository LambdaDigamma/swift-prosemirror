//
//  HorizontalRule.swift
//  
//
//  Created by Lennart Fischer on 25.05.21.
//

import XCTest
@testable import ProseMirror

final class HorizontalRuleTests: XCTestCase {
    
    func testHorizontalRule() throws {
        
        let input = """
        {
            "type": "doc",
            "content": [
                {
                    "type": "horizontalRule"
                }
            ]
        }
        """
        
        let parser = Parser()
        let document = try parser.parse(input)
        
        XCTAssertEqual(document.content.count, 1)
        XCTAssertEqual(document.content, [
            .horizontalRule(NodeHorizontalRule()),
        ])
    }
    
    static var allTests = [
        ("testHorizontalRule", testHorizontalRule),
    ]
}
