//
//  NodeListItem.swift
//  
//
//  Created by Lennart Fischer on 22.05.21.
//

import Foundation

public struct NodeListItem: Codable, Equatable {
    public var type: String = "listItem"
    public var content: [Content]
}
