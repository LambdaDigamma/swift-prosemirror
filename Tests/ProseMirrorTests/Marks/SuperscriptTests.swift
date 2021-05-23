//
//  SuperscriptTests.swift
//  
//
//  Created by Lennart Fischer on 23.05.21.
//

import XCTest
@testable import ProseMirror

final class SuperscriptTests: XCTestCase {
    
    func testSuperscript() throws {
        
        let input = """
        {
            "type": "doc",
            "content": [
                {
                    "type": "text",
                    "text": "See 1)",
                    "marks": [
                        {
                            "type": "superscript"
                        }
                    ]
                }
            ]
        }
        """
        
        let parser = Parser()
        let document = try parser.parse(input)
        
        XCTAssertEqual(document.content.count, 1)
        XCTAssertEqual(document.content, [
            .text(
                NodeText(text: "See 1)", marks: [.superscript])
            )
        ])
    }
    
    static var allTests = [
        ("testSuperscript", testSuperscript)
    ]
}
