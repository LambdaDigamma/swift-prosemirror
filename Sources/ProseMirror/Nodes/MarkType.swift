//
//  MarkType.swift
//  
//
//  Created by Lennart Fischer on 23.05.21.
//

import Foundation

public enum MarkType: String, Codable {
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
        
        if let type = MarkType(rawValue: type) {
            self = type
        } else {
            throw ProseMirrorError.markNotKnown
        }
        
    }
    
    public enum CodingKeys: String, CodingKey {
        case type = "type"
    }
    
}

