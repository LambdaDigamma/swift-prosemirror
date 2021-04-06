//
//  ParserTests.swift
//  
//
//  Created by Lennart Fischer on 06.04.21.
//

import Foundation
import XCTest
@testable import ProseMirror

class ParserTests: XCTestCase {
    
//    func test_parseEmptyDocument() throws {
//
//        let parser = Parser()
//
//        let input = """
//        {
//            "type": "doc",
//            "content": []
//        }
//        """
//
//        let document = try parser.parse(input)
//
//        XCTAssertEqual(document.content!.count, 0)
//
//    }
//
//    func test_parseHeading() throws {
//
//        let parser = Parser()
//
//        let input = """
//        {
//            "type": "doc",
//            "content": [
//                {
//                    "type": "heading",
//                    "attrs": {
//                        "level": 2
//                    },
//                    "content": [
//                        {
//                            "type": "text",
//                            "text": "Example Headline"
//                        }
//                    ],
//                }
//            ]
//        }
//        """
//
//        let document = try parser.parse(input)
//
//        print(document)
//
//        XCTAssertEqual(document.content!.count, 1)
//
//    }
//
//    func test_parseHeadingObject() throws {
//
//        let input = """
//        {
//            "type": "heading",
//            "attrs": {
//                "level": 2
//            },
//            "content": [
//                {
//                    "type": "text",
//                    "text": "Example Headline"
//                }
//            ],
//        }
//        """
//
//        guard let data = input.data(using: .utf8) else {
//            fatalError("Parsing failed")
//        }
//
//        let heading = try JSONDecoder.defaultProseMirrorDecoder.decode(Heading.self, from: data)
//
//        print(heading)
//
//
//    }
    
}
