//
//  NodeHeadline.swift
//  
//
//  Created by Lennart Fischer on 22.05.21.
//

import Foundation
import SwiftUI

public struct NodeHeadline: Codable, Equatable {
    
    public var type: String = "headline"
    public var content: [Content] = []
    public var attrs: HeadlineAttributes?
    
    public init(type: String = "headline", content: [Content] = [], attrs: HeadlineAttributes? = nil) {
        self.type = type
        self.content = content
        self.attrs = attrs
    }
    
    public struct HeadlineAttributes: Codable, Equatable {
        public var level: Int = 1
        
        public init(level: Int = 1) {
            self.level = level
        }
    }
    
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
        } else if level == 3 {
            return .semibold
        } else {
            return .regular
        }
    }
    
    @ViewBuilder
    public func render() -> some View {
        content.reducedText(weight: fontWeight)
            .if(level == 1) { view in
                view.font(.title)
            }
            .if(level == 2) { view in
                view.font(.title2)
            }
            .if(level == 3) { view in
                view.font(.title3)
            }
    }
}
