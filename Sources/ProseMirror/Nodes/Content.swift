//
//  Constant.swift
//  
//
//  Created by Lennart Fischer on 22.05.21.
//

import Foundation
import SwiftUI

public enum Content: Equatable {
    case headline(NodeHeadline)
    case text(NodeText)
    case paragraph(NodeParagraph)
    case bulletList(NodeBulletList)
    case listItem(NodeListItem)
    case blockquote(NodeBlockquote)
    
    @ViewBuilder
    public func render() -> some View {
        switch self {
            case .text(let text):
                text.render()
            case .paragraph(let paragraph):
                paragraph.render()
            case .headline(let headline):
                headline.render()
            default:
                EmptyView()
        }
    }
}

public extension Collection where Element == Content {
    
    func reducedTextContent() -> [Text] {
        
        var textNodes: [NodeText] = []
        
        self.forEach { content in
            switch content {
                case Content.text(let text):
                    textNodes.append(text)
                default: break
            }
        }
        
        return textNodes.map({ $0.render() })
    }
    
    func reducedText(weight: Font.Weight = .regular) -> some View {
        reducedTextContent()
            .reduce(Text(""), { $0 + $1 })
            .fontWeight(weight)
            .lineLimit(nil)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
}

extension Content: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case type = "type"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let singleContainer = try decoder.singleValueContainer()
        
        let type = try container.decode(String.self, forKey: .type)
        switch type {
            case "paragraph":
                let paragraph = try singleContainer.decode(NodeParagraph.self)
                self = .paragraph(paragraph)
            case "text":
                let text = try singleContainer.decode(NodeText.self)
                self = .text(text)
            case "headline":
                let headline = try singleContainer.decode(NodeHeadline.self)
                self = .headline(headline)
            case "bulletList":
                let bulletList = try singleContainer.decode(NodeBulletList.self)
                self = .bulletList(bulletList)
            case "listItem":
                let listItem = try singleContainer.decode(NodeListItem.self)
                self = .listItem(listItem)
            case "blockquote":
                let blockquote = try singleContainer.decode(NodeBlockquote.self)
                self = .blockquote(blockquote)
            default:
                fatalError("Unknown type of content.")
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var singleContainer = encoder.singleValueContainer()
        
        switch self {
            case .text(let text):
                try singleContainer.encode(text)
            case .headline(let headline):
                try singleContainer.encode(headline)
            case .paragraph(let paragraph):
                try singleContainer.encode(paragraph)
            case .bulletList(let bulletList):
                try singleContainer.encode(bulletList)
            case .listItem(let listItem):
                try singleContainer.encode(listItem)
            case .blockquote(let blockquote):
                try singleContainer.encode(blockquote)
        }
        
    }
    
}
