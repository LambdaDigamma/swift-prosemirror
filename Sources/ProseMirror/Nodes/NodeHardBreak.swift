//
//  NodeHardBreak.swift
//  
//
//  Created by Lennart Fischer on 24.05.21.
//

import Foundation

public struct NodeHardBreak: Codable, Equatable {
    
    public var type: String = "hardBreak"
    
    public init(type: String = "hardBreak") {
        self.type = type
    }
    
}

#if canImport(SwiftUI)

import SwiftUI

extension NodeHardBreak: TextRenderable {
    
    @ViewBuilder
    public func render() -> Text {
        Text("\n")
    }
    
}

#endif
