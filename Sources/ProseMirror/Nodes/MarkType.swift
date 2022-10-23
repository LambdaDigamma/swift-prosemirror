//
//  MarkType.swift
//  
//
//  Created by Lennart Fischer on 23.05.21.
//

import Foundation

public struct MarkLinkAttributes: Codable, Equatable, Hashable {
    public var href: String
    
}

public enum MarkType: Codable, Equatable, Hashable {
    case bold
    case italic
    case underline
    case strike
    case superscript
    case link(attrs: MarkLinkAttributes?)
    //    case link = "link"
    //    case `subscript` = "subscript"
    //    case code = "code"
    //    case link = "link"
    //    case highlight = "highlight"
    
    public init(from decoder: Decoder) throws {
        
        let type = try decoder.container(keyedBy: CodingKeys.self).decode(String.self, forKey: .type)
        
        switch type {
            case MarkType.bold.rawValue:
                self = .bold
            case MarkType.italic.rawValue:
                self = .italic
            case MarkType.underline.rawValue:
                self = .underline
            case MarkType.strike.rawValue:
                self = .strike
            case MarkType.superscript.rawValue:
                self = .superscript
            case "link":
                let attrs = try decoder.container(keyedBy: CodingKeys.self)
                    .decodeIfPresent(MarkLinkAttributes.self, forKey: .attrs)
                self = .link(attrs: attrs)
            default:
                throw ProseMirrorError.markNotKnown
        }
        
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .link(let attrs):
                try container.encodeIfPresent(attrs, forKey: .attrs)
            default:
                try container.encode(self.rawValue, forKey: .type)
        }
    }
    
    public var rawValue: String {
        switch self {
            case .bold:
                return "bold"
            case .italic:
                return "italic"
            case .underline:
                return "underline"
            case .strike:
                return "strike"
            case .superscript:
                return "superscript"
            case .link(_):
                return "link"
        }
    }
    
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case attrs = "attrs"
    }
    
}

