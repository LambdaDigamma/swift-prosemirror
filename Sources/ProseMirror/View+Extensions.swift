//
//  View+Extensions.swift
//  
//
//  Created by Lennart Fischer on 06.04.21.
//

#if canImport(SwiftUI)

import SwiftUI

extension View {
    
    @ViewBuilder
    public func `if`<Content: View>(_ condition: Bool, content: (Self) -> Content) -> some View {
        if condition {
            content(self)
        }
        else {
            self
        }
    }
    
}

extension Text {
    
    public func active(
        _ active: Bool,
        _ modifier: (Text) -> Text
    ) -> Text {
        guard active else { return self }
        return modifier(self)
    }
    
    public func active(
        _ active: Bool,
        _ modifier: (Text) -> () -> Text
    ) -> Text {
        guard active else { return self }
        return modifier(self)()
    }
    
    public func boldify(if condition: Bool) -> Text {
        self.active(condition, Text.bold)
    }
    
    public func italicify(if condition: Bool) -> Text {
        self.active(condition, Text.italic)
    }
    
    public func underline(if condition: Bool) -> Text {
        self.active(condition) { (text: Text) -> Text in
            text.underline()
        }
    }
    
    public func strike(if condition: Bool) -> Text {
        self.active(condition) { (text: Text) -> Text in
            text.strikethrough()
        }
    }
    
    public func superscript(if condition: Bool) -> Text {
        self.active(condition) { (text: Text) -> Text in
            text.font(.system(size: 10.0)).baselineOffset(6)
        }
    }
    
}

#endif
