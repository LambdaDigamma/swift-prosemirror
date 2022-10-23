//
//  NodeCodeBlock.swift
//  
//
//  Created by Lennart Fischer on 25.05.21.
//

import SwiftUI

public struct NodeCodeBlock: Codable, Equatable, Hashable, View {
    
    public var type: String = "codeBlock"
    public var content: [Content]
    
    public init(type: String = "codeBlock", content: [Content]) {
        self.type = type
        self.content = content
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case content
    }
    
    public static func == (lhs: NodeCodeBlock, rhs: NodeCodeBlock) -> Bool {
        return lhs.type == rhs.type
            && lhs.content == rhs.content
    }
    
    // MARK: - Rendering
    
    @Environment(\.proseCodeBackgroundColor) var background: Color
    @Environment(\.proseCodeForegroundColor) var foreground: Color
    
    public var body: some View {
        render()
    }
    
    @ViewBuilder
    public func render() -> some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            content.reducedText()
                .font(.system(.body, design: .monospaced))
                .frame(maxWidth: .infinity)
                .padding()
        })
        .foregroundColor(foreground)
        .background(background)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(type)
        hasher.combine(content)
    }
    
}

struct NodeCodeBlock_Previews: PreviewProvider {
    
    static var previews: some View {
        
        NodeCodeBlock(content: [
            "let someDocument = Document(content: [NodeText(\"test\"])".toNodeTextContent(),
            .hardBreak(NodeHardBreak()),
            "someDocument.render()".toNodeTextContent(),
        ])
        .padding(.vertical)
        .previewLayout(.sizeThatFits)
        
        NodeCodeBlock(content: [
            "let someDocument = Document(content: [NodeText(\"test\"])".toNodeTextContent(),
            .hardBreak(NodeHardBreak()),
            "someDocument.render()".toNodeTextContent(),
        ])
        .proseCodeBackgroundColor(.blue)
        .padding(.vertical)
        .previewLayout(.sizeThatFits)
        
    }
    
}
