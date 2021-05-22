//
//  Document.swift
//  
//
//  Created by Lennart Fischer on 05.04.21.
//

import Foundation
import SwiftUI

//public var defaultNodes: []

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
        }
    }
    
}

public struct Document: NodeStructure, Renderable {
    
    public var type: String
    public var content: [Content] = []
    
    public init() {
        self.type = "document"
        self.content = []
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
    
    func render() -> some View {
        
        EmptyView()
        
    }
    
}

struct DocumentPreviews: PreviewProvider {
    
    static var previews: some View {
        
        return Document().render()
        
    }
    
}



















public class AnyNode: Codable {
    public var type: String
    public var content: [AnyNode]?
}

public struct Heading: Codable {
    
    public struct Attributes: Codable {
        public let level: Int
    }
    
    let attributes: Attributes
    
    public enum CodingKeys: String, CodingKey {
        case attributes = "attrs"
    }
    
}


protocol NodeData: Codable {
    
}


//public class AnyNode: Codable {
//
//    var data: NodeData
//
//    init(_ base: NodeData) {
//        self.data = base
//    }
//
//    private enum CodingKeys: CodingKey {
//        case type, data
//    }
//
//    required public init(from decoder: Decoder) throws {
//
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
////        let type = try container.decode(BlockType.self, forKey: .type)
////        self.data = try type.metatype.init(from: container.superDecoder(forKey: .data))
//
//    }
//
//    public func encode(to encoder: Encoder) throws {
//
//        var container = encoder.container(keyedBy: CodingKeys.self)
//
//        try container.encode(type(of: data).type, forKey: .type)
//        try data.encode(to: container.superEncoder(forKey: .data))
//
//    }
//
//}
