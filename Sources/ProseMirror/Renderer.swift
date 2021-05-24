//
//  Renderer.swift
//  
//
//  Created by Lennart Fischer on 05.04.21.
//

#if canImport(SwiftUI)

import Foundation
import SwiftUI

//let defaultNodes: [NodeStructure.Type] = [
//    Document.self,
//    Paragraph.self
//]

class Renderer {
    
//    var supportedNodes: [NodeStructure.Type] = defaultNodes
    
    @ViewBuilder func render(document: Document) -> some View {
        
        let textNodes = [
            NodeText(type: "text", text: "fdsakjldf", marks: []),
            NodeText(type: "text", text: "sadfasdjffsadf", marks: []),
        ]
        
        LazyVStack(alignment: .leading) {
            ForEach(0..<textNodes.count) { (index: Int) in
                
                self.renderNode(textNodes[index])
                
            }
        }
        .padding()
        
    }
    
    @ViewBuilder func renderNode(_ textNode: NodeText) -> some View {
        
        textNode.render()
        
    }
    
}

struct Renderer_Preview: PreviewProvider {
    
    static var previews: some View {
        let renderer = Renderer()
        
        return renderer.render(document: Document())
    }
    
}

#endif
