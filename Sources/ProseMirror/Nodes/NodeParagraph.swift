//
//  NodeParagraph.swift
//  
//
//  Created by Lennart Fischer on 22.05.21.
//

import Foundation
import SwiftUI

public struct NodeParagraph: Codable, Equatable {
    
    public var type: String = "paragraph"
    public var content: [Content]
    
    public init(type: String = "paragraph", content: [Content] = []) {
        self.type = type
        self.content = content
    }
    
    @ViewBuilder
    public func render() -> some View {
        content.reducedText()
            .padding(.bottom, 4)
    }
    
}
