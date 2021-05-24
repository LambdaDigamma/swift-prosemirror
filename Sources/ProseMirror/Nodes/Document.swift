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
        return Document().render()
    }
    
}

#endif


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
