import Core
import SwiftUI

public enum GHInfo {
    public struct Style: Equatable {
        public let infoColor: Color
        public let iconColor: Color
        public let font: SwiftUI.Font
        public let iconSize: CGFloat

        public init(
            infoColor: Color,
            iconColor: Color,
            font: SwiftUI.Font = FontFamily.Roboto.regular.swiftUIFont(size: 18),
            iconSize: CGFloat = 24
        ) {
            self.infoColor = infoColor
            self.iconColor = iconColor
            self.font = font
            self.iconSize = iconSize
        }
    }
}

public extension GHInfo.Style {
    static let modal: Self = .init(
        infoColor: Asset.Colors.textPrimary.swiftUIColor,
        iconColor: Asset.Colors.iconPrimary.swiftUIColor
    )

    static let card: Self = .init(
        infoColor: Asset.Colors.textTertiary.swiftUIColor,
        iconColor: Asset.Colors.iconSecondary.swiftUIColor,
        font: FontFamily.Roboto.regular.swiftUIFont(size: 12),
        iconSize: 16
    )
}
