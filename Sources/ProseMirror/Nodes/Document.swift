//
//  Document.swift
//  
//
//  Created by Lennart Fischer on 05.04.21.
//

import SwiftUI

public struct Document: Codable, View, Renderable {
    
    public var type: String
    public var content: [Content] = []
    
    public init(content: [Content] = []) {
        self.type = "document"
        self.content = content
    }
    
    public init(from decoder: Decoder) throws {
        type = try decoder.container(keyedBy: CodingKeys.self)
            .decode(String.self, forKey: .type)
        content = try decoder.container(keyedBy: CodingKeys.self)
            .decodeIfPresent([Content].self, forKey: .content) ?? []
    }
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case content = "content"
    }
    
    @Environment(\.proseDefaultColor) var proseDefaultColor
    
    public var body: some View {
        render()
    }
    
    @ViewBuilder
    public func render() -> some View {
        
        VStack(alignment: .leading, spacing: 0) {
            ForEach(0..<content.count) { i in
                content[i]
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                    .if(i != content.count - 1, content: { view in
                        view.padding(.bottom, 8)
                    })
                    .foregroundColor(proseDefaultColor)
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
}

protocol Renderable {
    
    associatedtype T: View
    func render() -> T
    
}

struct DocumentPreviews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            
            Document(content: [
                .headline(NodeHeadline(content: [
                    "Headline #1".toNodeTextContent()
                ], attrs: NodeHeadline.HeadlineAttributes(level: 1))),
                .paragraph(NodeParagraph(content: [
                    "Just a small paragraph.".toNodeTextContent()
                ])),
                .headline(NodeHeadline(content: [
                    "Headline #2".toNodeTextContent()
                ], attrs: NodeHeadline.HeadlineAttributes(level: 2))),
            ])
            .proseHeadlineColor(.black)
            .proseDefaultColor(.gray)
            .padding()
            .previewLayout(.sizeThatFits)
            
            Document(content: [
                .headline(NodeHeadline(content: [
                    "Headline #1".toNodeTextContent()
                ], attrs: NodeHeadline.HeadlineAttributes(level: 1))),
                .paragraph(NodeParagraph(content: [
                    "Just a small paragraph.".toNodeTextContent()
                ]))
            ])
            .render()
            .environment(\.colorScheme, .dark)
            .padding()
            .background(Color.black)
            .previewLayout(.sizeThatFits)
            
        }
        
        
    }
    
}
