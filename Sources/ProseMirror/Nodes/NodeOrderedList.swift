//
//  NodeOrderedList.swift
//  
//
//  Created by Lennart Fischer on 26.05.21.
//

import SwiftUI

public struct NodeOrderedList: Codable, Equatable, View {
    
    public var type: String = "orderedList"
    public var content: [Content] = []
    
    public init(type: String = "orderedList", content: [Content]) {
        self.type = type
        self.content = content
    }
    
    public var body: some View {
        render()
    }
    
    public var width: CGFloat {
        if content.count < 10 {
            return 18
        } else if content.count < 100 {
            return 24
        } else {
            return 32
        }
    }
    
    @ViewBuilder
    public func render() -> some View {
        
        VStack(spacing: 12) {
            
            ForEach(0..<content.count) { index in
                HStack(alignment: .top) {
                    ZStack() {
                        Text("\(index + 1).")
                    }.frame(width: width, alignment: .topLeading)
                    
                    content[index].render()
                }
            }
            
        }
        
    }
    
}

struct NodeOrderedList_Previews: PreviewProvider {
    
    static var previews: some View {
        NodeOrderedList(content: [
            .listItem(NodeListItem(content: [
//                .headline(NodeHeadline(content: [
//                    "Headline".toNodeTextContent()
//                ])),
                .text(NodeText(text: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.")),
            ])),
            .listItem(NodeListItem(content: [
                .text(NodeText(text: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.")),
            ])),
        ])
        .padding()
        .previewLayout(.sizeThatFits)
        
    }
    
}
