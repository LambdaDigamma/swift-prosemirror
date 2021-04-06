//
//  NodeText.swift
//  
//
//  Created by Lennart Fischer on 22.05.21.
//

import Foundation

public struct NodeText: Codable, Equatable {
    var type: String = "text"
    var text: String
}
