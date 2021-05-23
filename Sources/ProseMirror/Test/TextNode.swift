//
//  TextNode.swift
//  
//
//  Created by Lennart Fischer on 05.04.21.
//

import Foundation
import SwiftUI

public enum ProseMirrorError: Error {
    case markNotKnown
}

protocol Renderable {
    
    associatedtype T: View
    func render() -> T
    
}

struct TextNode: NodeStructure, Renderable {
    
    var type: String = "text"
    var text: String = ""
    var marks: [MarkType] = []
    
    func render() -> Text {
        Text(text)
            .boldify(if: marks.contains(.bold))
            .italicify(if: marks.contains(.italic))
            .underline(if: marks.contains(.underline))
            .strike(if: marks.contains(.strike))
            .superscript(if: marks.contains(.superscript))
    }
    
}

struct TextNode_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            
            TextNode(text: "Lorem ipsum", marks: [.bold, .italic])
                .render()
                .padding()
                .previewLayout(.sizeThatFits)
            
            TextNode(text: "Lorem ipsum", marks: [])
                .render()
                .padding()
                .previewLayout(.sizeThatFits)
            
            TextNode(text: "Lorem ipsum", marks: [.strike])
                .render()
                .padding()
                .previewLayout(.sizeThatFits)
            
        }
        
    }
    
}
