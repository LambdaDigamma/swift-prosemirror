//
//  NodeParagraph.swift
//  
//
//  Created by Lennart Fischer on 22.05.21.
//

import SwiftUI

public struct NodeParagraph: Codable, Equatable, View {
    
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
    
    public var body: some View {
        render()
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
