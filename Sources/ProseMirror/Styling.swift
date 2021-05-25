//
//  Styling.swift
//  
//
//  Created by Lennart Fischer on 25.05.21.
//

import SwiftUI

private struct ProseDefaultColorKey: EnvironmentKey {
    static let defaultValue = Color.primary
}

extension EnvironmentValues {
    var proseDefaultColor: Color {
        get { self[ProseDefaultColorKey.self] }
        set { self[ProseDefaultColorKey.self] = newValue }
    }
}

extension View {
    func captionBackgroundColor(_ color: Color) -> some View {
        environment(\.proseDefaultColor, color)
    }
}
