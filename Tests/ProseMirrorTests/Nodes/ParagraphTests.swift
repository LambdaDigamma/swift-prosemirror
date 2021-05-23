//
//  ParagraphTests.swift
//  
//
//  Created by Lennart Fischer on 22.05.21.
//

import XCTest
@testable import ProseMirror

final class ParagraphTests: XCTestCase {
    
    func testMultipleParagraph() throws {
        
        let input = """
        {
            "type": "doc",
            "content": [
                {
                    "type": "paragraph",
                    "content": [
                        {
                            "text": "Pünktlich zu unserem 50-jährigem Jubiläum ziehen wir mit dem Hauptteil des Marktes zurück in den Schlosspark und erfüllen uns und vielen langjährigen Festivalbesuchern damit einen sehnlichen Wunsch.",
                            "type": "text"
                        }
                    ]
                },
                {
                    "type": "paragraph",
                    "content": [
                        {
                            "text": "Pünktlich zu unserem 50-jährigem Jubiläum ziehen wir mit dem Hauptteil des Marktes zurück in den Schlosspark und erfüllen uns und vielen langjährigen Festivalbesuchern damit einen sehnlichen Wunsch.",
                            "type": "text"
                        }
                    ]
                }
            ]
        }
        """
        
        let parser = Parser()
        let document = try parser.parse(input)
        
        XCTAssertEqual(document.content.count, 2)
        XCTAssertEqual(document.content, [
            .paragraph(
                NodeParagraph(content: [
                    .text(NodeText(
                        text: "Pünktlich zu unserem 50-jährigem Jubiläum ziehen wir mit dem Hauptteil des Marktes zurück in den Schlosspark und erfüllen uns und vielen langjährigen Festivalbesuchern damit einen sehnlichen Wunsch."
                    ))
                ])
            ),
            .paragraph(
                NodeParagraph(content: [
                    .text(NodeText(
                            text: "Pünktlich zu unserem 50-jährigem Jubiläum ziehen wir mit dem Hauptteil des Marktes zurück in den Schlosspark und erfüllen uns und vielen langjährigen Festivalbesuchern damit einen sehnlichen Wunsch."))
                ])
            )
        ])
    }
    
    static var allTests = [
        ("testMultipleParagraph", testMultipleParagraph),
    ]
}
