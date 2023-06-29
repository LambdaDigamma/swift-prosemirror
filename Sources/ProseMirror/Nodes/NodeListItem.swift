//
//  NodeListItem.swift
//  
//
//  Created by Lennart Fischer on 22.05.21.
//

import Foundation
import SwiftUI

public enum BulletStyle: String {
    
    case disk = "disk"
    case dash = "dash"
    
    public var symbol: String {
        switch self {
            case .disk:
                return "•"
            case .dash:
                return "-"
        }
    }

}

public struct NodeListItem: Codable, Equatable, Hashable, View {
    
    @Environment(\.proseUnorderedListItemStyle) private var style
    
    public var type: String = "listItem"
    public var content: [Content]
    
    public init(type: String = "listItem", content: [Content]) {
        self.type = type
        self.content = content
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case content
    }
    
    public var body: some View {
        render()
    }
    
    public func render() -> some View {
        
        content.renderCollection()
        
    }
    
    public static func == (lhs: NodeListItem, rhs: NodeListItem) -> Bool {
        return lhs.type == rhs.type && lhs.content == rhs.content
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(type)
        hasher.combine(content)
    }
    
}

struct NodeListItem_Previews: PreviewProvider {
    
    static var previews: some View {
        
        NodeListItem(content: [
            .text(NodeText(text: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua."))
        ])
        .padding()
        .previewLayout(.sizeThatFits)
        
    }
    
}
