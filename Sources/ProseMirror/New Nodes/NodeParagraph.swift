//
//  NodeParagraph.swift
//  
//
//  Created by Lennart Fischer on 22.05.21.
//

import Foundation

public struct NodeParagraph: Codable, Equatable {
    var type: String = "paragraph"
    var content: [Content]
}
