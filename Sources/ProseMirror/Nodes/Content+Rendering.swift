//
//  Content+Rendering.swift
//  
//
//  Created by Lennart Fischer on 25.05.21.
//

import SwiftUI

extension Content: View {
    
    public var body: some View {
        render()
    }
    
    @ViewBuilder
    public func render() -> some View {
        switch self {
            case .text(let text):
                text
            case .paragraph(let paragraph):
                paragraph.render()
            case .headline(let headline):
                headline
            case .listItem(let listItem):
                listItem
            case .bulletList(let bulletList):
                bulletList
            case .codeBlock(let codeBlock):
                codeBlock
            case .blockquote(let blockquote):
                blockquote
            case .hardBreak(let hardBreak):
                hardBreak
            case .horizontalRule(let horizontalRule):
                horizontalRule
            default:
                EmptyView()
        }
    }
    
    @ViewBuilder
    public func debugType() -> some View {
        
        switch self {
            case .text(_):
                Text("Text")
            case .hardBreak(_):
                Text("Hardbreak")
            case .headline(_):
                Text("Headline")
            case .paragraph(_):
                Text("Paragraph")
            case .bulletList(_):
                Text("Bullet List")
            case .orderedList(_):
                Text("Ordered List")
            case .listItem(_):
                Text("List Item")
            case .blockquote(_):
                Text("Blockquote")
            case .horizontalRule(_):
                Text("Horizontal Rule")
            case .codeBlock(_):
                Text("Code Block")
        }
        
    }
    
}

public extension Array where Element == Content {
    
    func reducedTextContent() -> [Text] {
        
        var textNodes: [TextRenderable] = []
        
        self.forEach { content in
            switch content {
                case Content.text(let text):
                    textNodes.append(text)
                case Content.hardBreak(let text):
                    textNodes.append(text)
                default: break
            }
        }
        
        return textNodes.map({ $0.render() })
    }
    
    func reducedText(weight: Font.Weight = .regular) -> some View {
        reducedTextContent()
            .reduce(Text(""), { $0 + $1 })
            .fontWeight(weight)
            .lineLimit(1000)
            .layoutPriority(1200)
//            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func renderCollection(spacing: Double = 8) -> some View {
        
        VStack(alignment: .leading) {
            
            ForEach(self.indices, id: \.self) { i in
                self[i].render()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
}
