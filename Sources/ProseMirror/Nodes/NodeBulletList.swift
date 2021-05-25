//
//  NodeBulletList.swift
//  
//
//  Created by Lennart Fischer on 22.05.21.
//

import Foundation

public struct ListBulletStyle: EnvironmentKey {
    public static var defaultValue: BulletStyle = .disk
}

public extension EnvironmentValues {
    var listBulletStyle: BulletStyle {
        get { self[ListBulletStyle.self] }
        set { self[ListBulletStyle.self] = newValue }
    }
}

public struct NodeBulletList: Codable, Equatable {
    
    public var type: String = "bulletList"
    public var content: [Content] = []
    
    
    public init(type: String = "bulletList", content: [Content]) {
        self.type = type
        self.content = content
    }
    
}

#if canImport(SwiftUI)
import SwiftUI

public extension NodeBulletList {
    
    @ViewBuilder
    func render() -> some View {
        
        VStack(spacing: 12) {
            
            ForEach(0..<content.count) { index in
                content[index].render()
                    .environment(\.listBulletStyle, .square)
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
        .render()
        .padding()
    }
    
}

#endif
