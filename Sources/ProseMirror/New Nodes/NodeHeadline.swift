//
//  NodeHeadline.swift
//  
//
//  Created by Lennart Fischer on 22.05.21.
//

import Foundation

public struct NodeHeadline: Codable, Equatable {
    public var type: String = "headline"
    public var content: [Content] = []
    public var attrs: HeadlineAttributes?
    
    public struct HeadlineAttributes: Codable, Equatable {
        var level: Int = 1
    }
}
