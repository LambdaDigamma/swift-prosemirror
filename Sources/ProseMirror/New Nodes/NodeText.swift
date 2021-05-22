//
//  NodeText.swift
//  
//
//  Created by Lennart Fischer on 22.05.21.
//

import Foundation

public struct NodeText: Codable, Equatable {
    
    public var type: String = "text"
    public var text: String
    public var marks: [MarkTypes] = []
    
    public init(type: String = "text", text: String, marks: [MarkTypes] = []) {
        self.type = type
        self.text = text
        self.marks = marks
    }
    
    public init(from decoder: Decoder) throws {
        self.type = try decoder.container(keyedBy: CodingKeys.self).decode(String.self, forKey: .type)
        self.text = try decoder.container(keyedBy: CodingKeys.self).decode(String.self, forKey: .text)
        self.marks = try decoder.container(keyedBy: CodingKeys.self).decodeIfPresent([MarkTypes].self, forKey: .marks) ?? []
    }
    
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
        case marks = "marks"
    }
    
}
