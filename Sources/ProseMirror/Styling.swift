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

private struct ProseHeadlineColorKey: EnvironmentKey {
    static let defaultValue = Color.primary
}

private struct ProseUnorderedListItemStyle: EnvironmentKey {
    static let defaultValue = BulletStyle.disk
}

public extension EnvironmentValues {
    var proseDefaultColor: Color {
        get { self[ProseDefaultColorKey.self] }
        set { self[ProseDefaultColorKey.self] = newValue }
    }
    var proseHeadlineColor: Color {
        get { self[ProseHeadlineColorKey.self] }
        set { self[ProseHeadlineColorKey.self] = newValue }
    }
    var proseUnorderedListItemStyle: BulletStyle {
        get { self[ProseUnorderedListItemStyle.self] }
        set { self[ProseUnorderedListItemStyle.self] = newValue }
    }
}

public extension View {
    func proseDefaultColor(_ color: Color) -> some View {
        environment(\.proseDefaultColor, color)
    }
    func proseHeadlineColor(_ color: Color) -> some View {
        environment(\.proseHeadlineColor, color)
    }
    func proseUnorderedListItemStyle(_ style: BulletStyle) -> some View {
        environment(\.proseUnorderedListItemStyle, style)
    }
}
