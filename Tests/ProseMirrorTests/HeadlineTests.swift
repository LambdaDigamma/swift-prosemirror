//
//  HeadlineTests.swift
//  
//
//  Created by Lennart Fischer on 22.05.21.
//

import Foundation

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
        
        let decoder = JSONDecoder()
        
        if let data = input.data(using: .utf8) {
            let document = try decoder.decode(Document.self, from: data)
            
            if let content = document.content {
                XCTAssertEqual(content.count, 1)
                XCTAssertEqual(content, [
                    .headline(
                        NodeHeadline(content: [
                            .text(NodeText(
                                text: "Nur ein Test!"
                            ))
                        ], attrs: NodeHeadline.HeadlineAttributes(level: 1))
                    ),
                ])
            }
        }
    }
    
    func testHeadlineLevel2() throws {
        
        let input = """
        {
            "type": "doc",
            "content": [
                {
                    "type": "headline",
                    "attrs": {
                        "level": 2
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
        
        let decoder = JSONDecoder()
        
        if let data = input.data(using: .utf8) {
            let document = try decoder.decode(Document.self, from: data)
            
            if let content = document.content {
                XCTAssertEqual(content.count, 1)
                XCTAssertEqual(content, [
                    .headline(
                        NodeHeadline(content: [
                            .text(NodeText(
                                text: "Headline 2"
                            ))
                        ], attrs: NodeHeadline.HeadlineAttributes(level: 2))
                    ),
                ])
            }
        }
    }
    
    func testHeadlineLevel3() throws {
        
        let input = """
        {
            "type": "doc",
            "content": [
                {
                    "type": "headline",
                    "attrs": {
                        "level": 3
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
        
        let decoder = JSONDecoder()
        
        if let data = input.data(using: .utf8) {
            let document = try decoder.decode(Document.self, from: data)
            
            if let content = document.content {
                XCTAssertEqual(content.count, 1)
                XCTAssertEqual(content, [
                    .headline(
                        NodeHeadline(content: [
                            .text(NodeText(
                                text: "Headline 3"
                            ))
                        ], attrs: NodeHeadline.HeadlineAttributes(level: 3))
                    ),
                ])
            }
        }
    }
    
    static var allTests = [
        ("testHeadlineLevel1", testHeadlineLevel1),
        ("testHeadlineLevel2", testHeadlineLevel2),
        ("testHeadlineLevel3", testHeadlineLevel3),
    ]
}
