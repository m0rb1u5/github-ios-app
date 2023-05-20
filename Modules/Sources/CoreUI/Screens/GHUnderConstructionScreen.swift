import Core
import SwiftUI

public struct GHUnderConstructionScreen: View {
    public init(
    ) {
    }

    @ViewBuilder
    public var body: some View {
        VStack(spacing: .zero) {
            Spacer()
            VStack(spacing: 16) {
                Image(systemSymbol: .hammerFill)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .shadow(radius: 3)
                    .accessibilityLabel(L10n.underConstructionDescription + " icon")
                VStack(spacing: 4) {
                    Text(L10n.warningTitle)
                        .foregroundColor(Asset.Colors.textPrimary.swiftUIColor)
                        .font(FontFamily.Roboto.bold.swiftUIFont(size: 18))
                        .multilineTextAlignment(.center)
                    Text(L10n.underConstructionDescription)
                        .foregroundColor(Asset.Colors.textSecondary.swiftUIColor)
                        .font(FontFamily.Roboto.regular.swiftUIFont(size: 16))
                }
            }
            Spacer()
        }
    }
}

#if DEBUG
public struct GHUnderConstructionScreen_Previews: PreviewProvider {
    public static var previews: some View {
        GHUnderConstructionScreen()
    }
}
#endif
