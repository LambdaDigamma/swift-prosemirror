//
//  View+Extensions.swift
//  
//
//  Created by Lennart Fischer on 06.04.21.
//

import SwiftUI


extension Text {
    
    func active(
        _ active: Bool,
        _ modifier: (Text) -> Text
    ) -> Text {
        guard active else { return self }
        return modifier(self)
    }
    
    func active(
        _ active: Bool,
        _ modifier: (Text) -> () -> Text
    ) -> Text {
        guard active else { return self }
        return modifier(self)()
    }
    
    func boldify(if condition: Bool) -> Text {
        self.active(condition, Text.bold)
    }
    
    func italicify(if condition: Bool) -> Text {
        self.active(condition, Text.italic)
    }
    
    func underline(if condition: Bool) -> Text {
        self.active(condition) { (text: Text) -> Text in
            text.underline()
        }
    }
    
    func strike(if condition: Bool) -> Text {
        self.active(condition) { (text: Text) -> Text in
            text.strikethrough()
        }
    }
    
    func superscript(if condition: Bool) -> Text {
        self.active(condition) { (text: Text) -> Text in
            text.font(.system(size: 10.0)).baselineOffset(6)
        }
    }
    
}
