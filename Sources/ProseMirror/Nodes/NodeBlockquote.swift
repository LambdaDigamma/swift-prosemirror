//
//  NodeBlockquote.swift
//  
//
//  Created by Lennart Fischer on 23.05.21.
//

import Foundation

public struct NodeBlockquote: Codable, Equatable {
    var type: String = "blockquote"
    var content: [Content]
}
