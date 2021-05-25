//
//  Constant.swift
//  
//
//  Created by Lennart Fischer on 22.05.21.
//

import Foundation

public enum Content: Equatable {
    case headline(NodeHeadline)
    case text(NodeText)
    case hardBreak(NodeHardBreak)
    case paragraph(NodeParagraph)
    case bulletList(NodeBulletList)
    case listItem(NodeListItem)
    case blockquote(NodeBlockquote)
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
            case "hardBreak":
                let hardBreak = try singleContainer.decode(NodeHardBreak.self)
                self = .hardBreak(hardBreak)
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
            case .hardBreak(let hardBreak):
                try singleContainer.encode(hardBreak)
        }
        
    }
    
}
