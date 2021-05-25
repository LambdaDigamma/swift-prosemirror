//
//  NodeListItem.swift
//  
//
//  Created by Lennart Fischer on 22.05.21.
//

import Foundation

#if canImport(SwiftUI)
import SwiftUI
#endif

public enum BulletStyle: String {
    case disk = "disk"
    case square = "square"
    case dash = "dash"
    
    public var symbol: String {
        switch self {
            case .disk:
                return "•"
            case .square:
                return "▪"
            case .dash:
                return "-"
        }
    }
}

public struct NodeListItem: Codable, Equatable {
    
    public static func == (lhs: NodeListItem, rhs: NodeListItem) -> Bool {
        return lhs.type == rhs.type && lhs.style == rhs.style
    }
    
    
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
    
    #if canImport(SwiftUI)
    
    @Environment(\.listBulletStyle) private var style
    
    #endif
    
}

#if canImport(SwiftUI)

public extension NodeListItem {
    
    func render() -> some View {
        
        HStack(alignment: .top) {
            
            Text(style.symbol)
            
            content.reducedText()
            
        }
        
    }
    
}

struct NodeListItem_Previews: PreviewProvider {
    
    static var previews: some View {
        
        NodeListItem(content: [
            .text(NodeText(text: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua."))
        ])
        .render()
        .environment(\.listBulletStyle, .dash)
        .padding()
        
    }
    
}

#endif
