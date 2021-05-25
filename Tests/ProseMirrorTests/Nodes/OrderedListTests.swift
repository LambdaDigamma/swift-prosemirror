//
//  OrderedListTests.swift
//  
//
//  Created by Lennart Fischer on 26.05.21.
//

import XCTest
@testable import ProseMirror

final class OrderedListTests: XCTestCase {
    
    func testOrderedList() throws {
        
        let input = """
        {
            "type": "doc",
            "content": [
                {
                    "type": "orderedList",
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
            .orderedList(
                NodeOrderedList(content: [
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
        ("testOrderedList", testOrderedList),
    ]
}
