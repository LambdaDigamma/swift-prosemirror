//
//  NodeHardBreak.swift
//  
//
//  Created by Lennart Fischer on 24.05.21.
//

import SwiftUI

public struct NodeHardBreak: Codable, Equatable, View, TextRenderable {
    
    public var type: String = "hardBreak"
    
    public init(type: String = "hardBreak") {
        self.type = type
    }
    
    public var body: some View {
        render()
    }
    
    @ViewBuilder
    public func render() -> Text {
        Text("\n")
    }
    
}
