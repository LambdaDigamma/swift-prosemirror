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
    public var attrs: ParagraphAttributes?
    
    public init(
        type: String = "paragraph",
        content: [Content] = [],
        attrs: ParagraphAttributes? = nil
    ) {
        self.type = type
        self.content = content
        self.attrs = attrs
    }
    
    public struct ParagraphAttributes: Codable, Equatable {
        public var textAlignment: TextAlignment = .left
        
        public init(textAlignment: TextAlignment = .left) {
            self.textAlignment = textAlignment
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.textAlignment = (try? container.decode(ProseMirror.TextAlignment.self, forKey: .textAlignment)) ?? .left
        }
        
        public enum CodingKeys: String, CodingKey {
            case textAlignment = "textAlign"
        }
    }
    
    @ViewBuilder
    public func render() -> some View {
        content.reducedText()
            .multilineTextAlignment(attrs?.textAlignment.toUI() ?? .leading)
            .layoutPriority(100)
            .padding(.bottom, 4)
            .frame(
                maxWidth: .infinity,
                alignment: attrs?.textAlignment.toFrameAlignment() ?? .leading
            )
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
        .previewLayout(.sizeThatFits)
        
        NodeParagraph(content: [
            "This is an example paragraph ".toNodeTextContent(),
            "with some bold text.".toNodeTextContent(marks: [.bold])
        ], attrs: NodeParagraph.ParagraphAttributes(textAlignment: .center))
            .render()
            .padding()
            .previewLayout(.sizeThatFits)
    }
    
}
