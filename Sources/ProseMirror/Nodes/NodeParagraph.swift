//
//  NodeParagraph.swift
//  
//
//  Created by Lennart Fischer on 22.05.21.
//

import Foundation

public struct NodeParagraph: Codable, Equatable {
    
    public var type: String = "paragraph"
    public var content: [Content]
    
    public init(type: String = "paragraph", content: [Content] = []) {
        self.type = type
        self.content = content
    }
    
}

#if canImport(SwiftUI)

import SwiftUI

extension NodeParagraph {
    
    @ViewBuilder
    public func render() -> some View {
        content.reducedText()
            .padding(.bottom, 4)
    }
    
}

struct NodeParagraph_Previews: PreviewProvider {
    
    static var previews: some View {
        NodeParagraph(content: [
            "This is an example paragraph ".toNodeTextContent(),
            "with some bold text.".toNodeTextContent(marks: [.bold])
        ])
        .render()
        .padding()
    }
    
}

#endif
