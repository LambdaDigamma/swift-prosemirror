//
//  NodeBlockquote.swift
//  
//
//  Created by Lennart Fischer on 23.05.21.
//

import Foundation
import SwiftUI

public struct NodeBlockquote: Codable, Equatable, View {
    
    public var type: String = "blockquote"
    public var content: [Content]
    
    public init(type: String = "blockquote", content: [Content]) {
        self.type = type
        self.content = content
    }
    
    public var body: some View {
        render()
    }
    
    @ViewBuilder
    public func render() -> some View {
        content.reducedText().padding(.leading).background(HStack {
            Rectangle()
                .fill(Color.primary)
                .frame(maxWidth: 3)
            Spacer()
        })
    }
    
}

struct NodeBlockquotePreviews: PreviewProvider {
    
    static var previews: some View {
        NodeBlockquote(content: [
            .text(NodeText(text: "This is an example text for this blockquote prose element. ")),
            .text(NodeText(text: "Some italic text. ", marks: [.italic])),
            .text(NodeText(text: "And bold text. ", marks: [.bold])),
            .text(NodeText(text: "And strike text. ", marks: [.strike]))
        ])
        .render()
        .padding()
    }
    
}
