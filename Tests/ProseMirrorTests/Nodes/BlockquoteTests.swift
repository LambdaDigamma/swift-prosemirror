//
//  BlockquotesTests.swift
//  
//
//  Created by Lennart Fischer on 23.05.21.
//

import XCTest
@testable import ProseMirror

final class BlockquoteTests: XCTestCase {
    
    func testBlockquote() throws {
        
        let input = """
        {
            "type": "doc",
            "content": [
                {
                    "type": "blockquote",
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
            .blockquote(
                NodeBlockquote(content: [
                    .text(NodeText(
                        text: "Just testing"
                    ))
                ])
            ),
        ])
    }
    
    static var allTests = [
        ("testBlockquote", testBlockquote),
    ]
}
