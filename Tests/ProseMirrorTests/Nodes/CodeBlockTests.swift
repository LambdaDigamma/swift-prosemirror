//
//  CodeBlockTests.swift
//  
//
//  Created by Lennart Fischer on 26.05.21.
//

import XCTest
@testable import ProseMirror

final class CodeBlockTests: XCTestCase {
    
    func testCodeBlock() throws {
        
        let input = """
        {
            "type": "doc",
            "content": [
                {
                    "type": "codeBlock",
                    "content": [
                        {
                            "text": "Just testing",
                            "type": "text"
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
            .codeBlock(
                NodeCodeBlock(content: [
                    .text(NodeText(
                        text: "Just testing"
                    ))
                ])
            ),
        ])
    }
    
    static var allTests = [
        ("testCodeBlock", testCodeBlock),
    ]
}

