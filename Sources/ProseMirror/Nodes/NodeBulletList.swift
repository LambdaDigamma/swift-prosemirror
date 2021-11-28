//
//  NodeBulletList.swift
//  
//
//  Created by Lennart Fischer on 22.05.21.
//

import SwiftUI

public struct NodeBulletList: Codable, Equatable, View {
    
    public var type: String = "bulletList"
    public var content: [Content] = []
    
    public init(type: String = "bulletList", content: [Content]) {
        self.type = type
        self.content = content
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case content
    }
    
    public static func == (lhs: NodeBulletList, rhs: NodeBulletList) -> Bool {
        return lhs.type == rhs.type
            && lhs.content == rhs.content
    }
    
    // MARK: - Rendering
    
    @Environment(\.proseUnorderedListItemStyle) private var style
    
    public var body: some View {
        render()
    }
    
    @ViewBuilder
    public func render() -> some View {
        
        VStack(alignment: .leading, spacing: 12) {
            
            ForEach(0..<content.count) { index in
                HStack(alignment: .top) {
                    Text(style.symbol)
                    content[index].render()
                }
                
            }
            
        }
        
    }
    
}

struct NodeBulletList_Previews: PreviewProvider {
    
    static var previews: some View {
        NodeBulletList(content: [
            .listItem(NodeListItem(content: [
                .text(NodeText(text: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.")),
            ])),
            .listItem(NodeListItem(content: [
                .text(NodeText(text: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.")),
            ])),
        ])
        .padding()
        .previewLayout(.sizeThatFits)
        
        NodeBulletList(content: [
            .listItem(NodeListItem(content: [
                .text(NodeText(text: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.")),
            ])),
            .listItem(NodeListItem(content: [
                .text(NodeText(text: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.")),
            ])),
        ])
        .proseUnorderedListItemStyle(.dash)
        .padding()
        .previewLayout(.sizeThatFits)
    }
    
}
