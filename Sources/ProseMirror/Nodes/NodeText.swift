//
//  NodeText.swift
//  
//
//  Created by Lennart Fischer on 22.05.21.
//

import SwiftUI

public struct NodeText: Codable, Equatable, TextRenderable, View {
    
    @Environment(\.proseDefaultFontWeight) var proseDefaultFontWeight
    
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
    
    public var body: some View {
        render()
    }
    
    var containedLink: MarkLinkAttributes? {
        
        return marks.compactMap { (mark) -> MarkLinkAttributes? in
            switch mark {
                case .link(let attrs):
                    return attrs
                default: return nil
            }
        }.first
        
    }
    
    public func render() -> Text {
        
        let containedLink = containedLink
        
        return parsedText()
            .active(marks.contains(.bold), { text in
                return text.foregroundColor(Color.primary).bold
            })
//            .boldify(if: marks.contains(.bold))
            .italicify(if: marks.contains(.italic))
            .underline(if: marks.contains(.underline))
            .strike(if: marks.contains(.strike))
            .superscript(if: marks.contains(.superscript))
            .active(containedLink != nil, { (text: Text) -> Text in
                
                if #available(iOS 15, *) {
                    return text
                        .foregroundColor(.accentColor)
                        .underline()
                } else {
                    return text
                }
                
            })
    }
    
    public func parsedText() -> Text {
        
        if #available(iOS 15, *) {
            
            if let href = containedLink?.href, let url = URL(string: href) {
                
                let absoluteURL = url.absoluteString.replacingOccurrences(of: "http://", with: "https://")
                let attributedString = try? AttributedString(markdown: "[\(text)](\(absoluteURL))")
                
                return Text(attributedString ?? AttributedString(text))
                
            } else {
                return Text(text)
            }
            
        } else {
            
            return Text(text)
            
        }
        
    }
    
    public static func == (lhs: NodeText, rhs: NodeText) -> Bool {
        return
            lhs.text == rhs.text &&
            lhs.type == rhs.type &&
            lhs.marks == rhs.marks
    }
    
}

public extension String {
    
    func toNodeText(marks: [MarkType] = []) -> NodeText {
        return NodeText(text: self, marks: marks)
    }
    
    func toNodeTextContent(marks: [MarkType] = []) -> Content {
        return .text(self.toNodeText(marks: marks))
    }
    
    func toParagraphNode() -> NodeParagraph {
        return NodeParagraph(content: [self.toNodeTextContent()])
    }
    
    func toParagraphContent() -> Content {
        return .paragraph(self.toParagraphNode())
    }
    
}

struct NodeText_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            
            NodeText(text: "Lorem ipsum", marks: [.bold])
                .render()
                .padding()
                .previewLayout(.sizeThatFits)
            
            NodeText(text: "Lorem ipsum", marks: [.bold, .italic])
                .render()
                .padding()
                .previewLayout(.sizeThatFits)
            
            NodeText(text: "Lorem ipsum", marks: [])
                .render()
                .padding()
                .previewLayout(.sizeThatFits)
            
            NodeText(text: "Lorem ipsum", marks: [.strike, .italic])
                .render()
                .padding()
                .previewLayout(.sizeThatFits)
            
            NodeText(text: "some Link to DuckDuckGo", marks: [.link(attrs: MarkLinkAttributes(href: "https://duckduckgo.com"))])
                .padding()
                .previewLayout(.sizeThatFits)
            
        }
        
    }
    
}
