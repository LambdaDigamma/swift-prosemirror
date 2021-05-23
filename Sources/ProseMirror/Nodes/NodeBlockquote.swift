//
//  NodeBlockquote.swift
//  
//
//  Created by Lennart Fischer on 23.05.21.
//

import Foundation

public struct NodeBlockquote: Codable, Equatable {
    public var type: String = "blockquote"
    public var content: [Content]
    
    public init(type: String = "blockquote", content: [Content]) {
        self.type = type
        self.content = content
    }
}
