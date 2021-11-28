//
//  HeadlineTests.swift
//  
//
//  Created by Lennart Fischer on 22.05.21.
//

import XCTest
@testable import ProseMirror

final class HeadlineTests: XCTestCase {
    
    func testHeadlineLevel1() throws {
        
        let input = """
        {
            "type": "doc",
            "content": [
                {
                    "type": "headline",
                    "attrs": {
                        "level": 1
                    },
                    "content": [
                        {
                            "text": "Nur ein Test!",
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
            .headline(
                NodeHeadline(content: [
                    .text(NodeText(
                        text: "Nur ein Test!"
                    ))
                ], attrs: NodeHeadline.HeadlineAttributes(level: 1))
            ),
        ])
    }
    
    func testHeadlineLevel2() throws {
        
        let input = """
        {
            "type": "doc",
            "content": [
                {
                    "type": "headline",
                    "attrs": {
                        "level": 2,
                    },
                    "content": [
                        {
                            "text": "Headline 2",
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
            .headline(
                NodeHeadline(content: [
                    .text(NodeText(
                        text: "Headline 2"
                    ))
                ], attrs: NodeHeadline.HeadlineAttributes(level: 2, textAlignment: .left))
            ),
        ])

    }
    
    func testHeadlineLevel3() throws {
        
        let input = """
        {
            "type": "doc",
            "content": [
                {
                    "type": "headline",
                    "attrs": {
                        "level": 3,
                        "textAlign": "center"
                    },
                    "content": [
                        {
                            "text": "Headline 3",
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
            .headline(
                NodeHeadline(content: [
                    .text(NodeText(
                        text: "Headline 3"
                    ))
                ], attrs: NodeHeadline.HeadlineAttributes(level: 3, textAlignment: .right))
            ),
        ])
    }
    
    static var allTests = [
        ("testHeadlineLevel1", testHeadlineLevel1),
        ("testHeadlineLevel2", testHeadlineLevel2),
        ("testHeadlineLevel3", testHeadlineLevel3),
    ]
}
