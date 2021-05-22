//
//  TextNode.swift
//  
//
//  Created by Lennart Fischer on 05.04.21.
//

import Foundation
import SwiftUI

public enum MarkTypes: String, Codable {
    case bold = "bold"
    case italic = "italic"
    case underline = "underline"
    case strike = "strike"
    case superscript = "superscript"
//    case `subscript` = "subscript"
//    case code = "code"
//    case link = "link"
//    case highlight = "highlight"
    
    public init(from decoder: Decoder) throws {
        
        let type = try decoder.container(keyedBy: CodingKeys.self).decode(String.self, forKey: .type)
        
        if let type = MarkTypes(rawValue: type) {
            self = type
        } else {
            throw ProseMirrorError.markNotKnown
        }
        
    }
    
    public enum CodingKeys: String, CodingKey {
        case type = "type"
    }
    
}

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
    var marks: [MarkTypes] = []
    
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
