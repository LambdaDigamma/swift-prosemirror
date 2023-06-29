//
//  NodeHeadline.swift
//  
//
//  Created by Lennart Fischer on 22.05.21.
//

import SwiftUI

public struct NodeHeadline: Codable, Equatable, Hashable, View {
    
    public var type: String = "headline"
    public var content: [Content] = []
    public var attrs: HeadlineAttributes?
    
    public init(type: String = "headline", content: [Content] = [], attrs: HeadlineAttributes? = nil) {
        self.type = type
        self.content = content
        self.attrs = attrs
    }
    
    public struct HeadlineAttributes: Codable, Equatable, Hashable {
        public var level: Int = 1
        public var textAlignment: TextAlignment = .left
        
        public init(level: Int = 1, textAlignment: TextAlignment = .left) {
            self.level = level
            self.textAlignment = textAlignment
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.level = try container.decode(Int.self, forKey: .level)
            self.textAlignment = (try? container.decode(ProseMirror.TextAlignment.self, forKey: .textAlignment)) ?? .left
        }
        
        public enum CodingKeys: String, CodingKey {
            case level = "level"
            case textAlignment = "textAlign"
        }
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case content
        case attrs
    }
    
    // MARK: - Rendering
    
    @Environment(\.proseHeadlineColor) private var headlineColor
    
    public var level: Int {
        if let level = attrs?.level {
            return level
        } else {
            return 1
        }
    }
    
    public var fontWeight: Font.Weight {
        if level == 1 {
            return .bold
        } else if level == 2 {
            return .bold
        } else if level >= 3 {
            return .semibold
        } else {
            return .regular
        }
    }
    
    public var body: some View {
        render()
    }
    
    @ViewBuilder
    public func render() -> some View {
        content.reducedText(weight: fontWeight)
            .foregroundColor(headlineColor)
            .if(level == 1) { view in
                view.font(.title)
            }
            .if(level == 2) { view in
                view.font(.title2)
            }
            .if(level >= 3) { view in
                view.font(.title3)
            }
            .multilineTextAlignment(attrs?.textAlignment.toUI() ?? .leading)
            .frame(
                maxWidth: .infinity,
                alignment: attrs?.textAlignment.toFrameAlignment() ?? .leading
            )
    }
    
    public static func == (lhs: NodeHeadline, rhs: NodeHeadline) -> Bool {
        return lhs.type == rhs.type
            && lhs.content == rhs.content
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(type)
        hasher.combine(content)
        hasher.combine(attrs)
    }
    
}

struct NodeHeadline_Previews: PreviewProvider {
    
    static var previews: some View {
        NodeHeadline(content: [
            "This is an example paragraph ".toNodeTextContent(),
            "with some bold text.".toNodeTextContent(marks: [.bold])
        ])
            .render()
            .padding()
            .previewLayout(.sizeThatFits)
        
        NodeHeadline(content: [
            "This is an example paragraph ".toNodeTextContent(),
            "with some bold text.".toNodeTextContent(marks: [.bold])
        ], attrs: NodeHeadline.HeadlineAttributes(level: 2, textAlignment: .center))
            .render()
            .padding()
            .previewLayout(.sizeThatFits)
    }
    
}

