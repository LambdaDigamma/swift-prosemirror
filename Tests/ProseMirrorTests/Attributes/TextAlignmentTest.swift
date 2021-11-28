//
//  File.swift
//  
//
//  Created by Lennart Fischer on 28.11.21.
//

import Foundation
import XCTest
@testable import ProseMirror

final class TextAlignmentTest: XCTestCase {
    
    func test_cases() {
        
        XCTAssertEqual(ProseMirror.TextAlignment.left.rawValue, "left")
        XCTAssertEqual(ProseMirror.TextAlignment.right.rawValue, "right")
        XCTAssertEqual(ProseMirror.TextAlignment.center.rawValue, "center")
        XCTAssertEqual(ProseMirror.TextAlignment.justify.rawValue, "justify")
        
    }
    
}
