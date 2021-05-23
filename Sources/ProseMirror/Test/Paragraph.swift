//
//  Paragraph.swift
//  
//
//  Created by Lennart Fischer on 05.04.21.
//

import Foundation
import SwiftUI

struct Paragraph: NodeStructure, Renderable {
    
    var type: String = "paragraph"
    
    @ViewBuilder func render() -> some View {
        
        let nodes = [
            TextNode(text: "Hey das ist ein "),
            TextNode(text: "Test", marks: [.bold]),
            TextNode(text: "1) ", marks: [.superscript]),
            TextNode(text: "Ganz langer Text, der hier noch viel weiter geht. Mal schauen, was passiert, wenn er noch länger wird."),
            TextNode(text: "2) ", marks: [.superscript]),
        ]
        
        nodes.map { $0.render() }.reduce(Text(""), { $0 + $1 })
    }
    
}

struct Paragraph_Previews: PreviewProvider {
    
    static var previews: some View {
        
        VStack(spacing: 12) {
            Paragraph().render() // .padding(.bottom, 12)
        }
        
    }
    
}
