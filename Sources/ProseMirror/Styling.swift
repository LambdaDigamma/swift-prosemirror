//
//  Styling.swift
//  
//
//  Created by Lennart Fischer on 25.05.21.
//

import SwiftUI

public enum DefaultProseStyle {
    
    public static var foreground: Color = Color.primary
    public static var codeBackground: Color = Color("CodeBackground", bundle: Bundle.module)
    public static var codeForeground: Color = Color("CodeForeground", bundle: Bundle.module)
    
}

private struct ProseDefaultColorKey: EnvironmentKey {
    static let defaultValue = DefaultProseStyle.foreground
}

private struct ProseHeadlineColorKey: EnvironmentKey {
    static let defaultValue = DefaultProseStyle.foreground
}

private struct ProseUnorderedListItemStyle: EnvironmentKey {
    static let defaultValue = BulletStyle.disk
}

private struct ProseCodeBackgroundColor: EnvironmentKey {
    static let defaultValue = DefaultProseStyle.codeBackground
}

private struct ProseCodeForegroundColor: EnvironmentKey {
    static let defaultValue = DefaultProseStyle.codeForeground
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
    var proseCodeBackgroundColor: Color {
        get { self[ProseCodeBackgroundColor.self] }
        set { self[ProseCodeBackgroundColor.self] = newValue }
    }
    var proseCodeForegroundColor: Color {
        get { self[ProseCodeForegroundColor.self] }
        set { self[ProseCodeForegroundColor.self] = newValue }
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
    func proseCodeBackgroundColor(_ color: Color) -> some View {
        environment(\.proseCodeBackgroundColor, color)
    }
    func proseCodeForegroundColor(_ color: Color) -> some View {
        environment(\.proseCodeForegroundColor, color)
    }
}
