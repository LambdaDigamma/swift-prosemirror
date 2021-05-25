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
                paragraph
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
    
}

public extension Collection where Element == Content {
    
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
            .lineLimit(nil)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
}
