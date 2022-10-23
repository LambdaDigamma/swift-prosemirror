//
//  TextAlignment.swift
//  
//
//  Created by Lennart Fischer on 28.11.21.
//

import Foundation
import SwiftUI

public enum TextAlignment: String, Codable, Hashable {
    
    case `left` = "left"
    case `right` = "right"
    case center = "center"
    case justify = "justify"
    
    func toUI() -> SwiftUI.TextAlignment {
        switch self {
            case .left:
                return SwiftUI.TextAlignment.leading
            case .right:
                return SwiftUI.TextAlignment.trailing
            case .center:
                return SwiftUI.TextAlignment.center
            case .justify:
                return SwiftUI.TextAlignment.leading
        }
    }
    
    func toFrameAlignment() -> SwiftUI.Alignment {
        switch self {
            case .left:
                return SwiftUI.Alignment.leading
            case .right:
                return SwiftUI.Alignment.trailing
            case .center:
                return SwiftUI.Alignment.center
            case .justify:
                return SwiftUI.Alignment.leading
        }
    }
    
}
