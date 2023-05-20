import Core
import SwiftUI

public enum GHButton {
    public struct Style: Equatable {
        public let background: Color
        public let foreground: Color
        public let font: SwiftUI.Font
        public let cornerRadius: CGFloat

        public init(
            background: Color,
            foreground: Color,
            font: SwiftUI.Font = FontFamily.Roboto.bold.swiftUIFont(size: 18),
            cornerRadius: CGFloat = 100
        ) {
            self.background = background
            self.foreground = foreground
            self.font = font
            self.cornerRadius = cornerRadius
        }
    }
}

public extension GHButton.Style {
    static let primary: Self = .init(
        background: Asset.Colors.primary.swiftUIColor,
        foreground: Asset.Colors.overPrimary.swiftUIColor
    )

    static let secondary: Self = .init(
        background: Asset.Colors.secondary.swiftUIColor,
        foreground: Asset.Colors.overSecondary.swiftUIColor
    )
}
