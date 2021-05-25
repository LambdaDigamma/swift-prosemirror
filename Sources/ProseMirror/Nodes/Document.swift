//
//  Document.swift
//  
//
//  Created by Lennart Fischer on 05.04.21.
//

import Foundation

public struct Document: Codable {
    
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
    
}

#if canImport(SwiftUI)

import SwiftUI

protocol Renderable {
    
    associatedtype T: View
    func render() -> T
    
}

extension Document: Renderable {
    
    @ViewBuilder
    func render() -> some View {
        
        VStack(alignment: .leading, spacing: 0) {
            ForEach(0..<content.count) { i in
                content[i].render()
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 8)
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
}

struct DocumentPreviews: PreviewProvider {
    
    static var previews: some View {
        return Document(content: [
            .headline(NodeHeadline(content: [
                "Headline #1".toNodeTextContent()
            ], attrs: NodeHeadline.HeadlineAttributes(level: 1))),
            .paragraph(NodeParagraph(content: [
                "Just a small paragraph.".toNodeTextContent()
            ]))
        ])
        .render()
        .padding()
    }
    
}

#endif
