//
//  BulletListTests.swift
//  
//
//  Created by Lennart Fischer on 22.05.21.
//

import Foundation

import XCTest
@testable import ProseMirror

final class BulletListTests: XCTestCase {
    
    func testBulletList() throws {
        
        let input = """
        {
            "type": "doc",
            "content": [
                {
                    "type": "bulletList",
                    "content": [
                        {
                            "type": "listItem",
                            "content": [
                                {
                                    "type": "text",
                                    "text": "first list item",
                                }
                            ]
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
            .bulletList(
                NodeBulletList(content: [
                    .listItem(NodeListItem(content: [
                        .text(NodeText(
                            text: "first list item"
                        ))
                    ]))
                ])
            ),
        ])
    }
    
    static var allTests = [
        ("testBulletList", testBulletList),
    ]
}
