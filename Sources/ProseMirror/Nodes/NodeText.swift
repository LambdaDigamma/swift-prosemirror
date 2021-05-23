//
//  NodeText.swift
//  
//
//  Created by Lennart Fischer on 22.05.21.
//

import Foundation
import SwiftUI

public struct NodeText: Codable, Equatable {
    
    public var type: String = "text"
    public var text: String
    public var marks: [MarkType] = []
    
    public init(type: String = "text", text: String, marks: [MarkType] = []) {
        self.type = type
        self.text = text
        self.marks = marks
    }
    
    public init(from decoder: Decoder) throws {
        self.type = try decoder.container(keyedBy: CodingKeys.self).decode(String.self, forKey: .type)
        self.text = try decoder.container(keyedBy: CodingKeys.self).decode(String.self, forKey: .text)
        self.marks = try decoder.container(keyedBy: CodingKeys.self).decodeIfPresent([MarkType].self, forKey: .marks) ?? []
    }
    
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
        case marks = "marks"
    }
    
    // MARK: Rendering
    
    func render() -> Text {
        Text(text)
            .boldify(if: marks.contains(.bold))
            .italicify(if: marks.contains(.italic))
            .underline(if: marks.contains(.underline))
            .strike(if: marks.contains(.strike))
            .superscript(if: marks.contains(.superscript))
    }
    
}

struct NodeText_Previews: PreviewProvider {
    
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
            
            TextNode(text: "Lorem ipsum", marks: [.strike, .italic])
                .render()
                .padding()
                .previewLayout(.sizeThatFits)
            
        }
        
    }
    
}
