//
//  UnderlineTest.swift
//  
//
//  Created by Lennart Fischer on 22.05.21.
//

import XCTest
@testable import ProseMirror

final class UnderlineTests: XCTestCase {
    
    func testUnderlineBold() throws {

        let input = """
        {
            "type": "doc",
            "content": [
                {
                    "type": "text",
                    "text": "Example Text",
                    "marks": [
                        {
                            "type": "underline"
                        },
                        {
                            "type": "bold"
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
                NodeText(text: "Example Text", marks: [.underline, .bold])
            )
        ])
    }
    
    func testItalicStrike() throws {
        
        let input = """
        {
            "type": "doc",
            "content": [
                {
                    "type": "text",
                    "text": "Example Text",
                    "marks": [
                        {
                            "type": "italic"
                        },
                        {
                            "type": "strike"
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
                NodeText(text: "Example Text", marks: [.italic, .strike])
            )
        ])
        
    }

    static var allTests = [
        ("testUnderlineBold", testUnderlineBold),
        ("testItalicStrike", testItalicStrike)
    ]
}
