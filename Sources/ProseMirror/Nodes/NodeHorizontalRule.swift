//
//  NodeHorizontalRule.swift
//  
//
//  Created by Lennart Fischer on 25.05.21.
//

import SwiftUI

public struct NodeHorizontalRule: Codable, Equatable, Hashable, View {
    
    public var type: String = "horizontalRule"
    
    public init(type: String = "horizontalRule") {
        self.type = type
    }
    
    public var body: some View {
        render()
    }
    
    @ViewBuilder
    public func render() -> some View {
        
        Rectangle()
            .fill(Color.gray)
            .frame(maxWidth: .infinity, maxHeight: 2)
        
    }
    
}


struct NodeHorizontalRule_Previews: PreviewProvider {
    
    static var previews: some View {
        
        VStack {
            NodeHeadline(content: [
                "Headline #1".toNodeTextContent()
            ])
            NodeHorizontalRule()
        }
        .padding()
        
    }
    
}
