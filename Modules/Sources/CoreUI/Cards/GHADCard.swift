import Core
import SwiftUI

public struct GHADCard: View {
    var title: String
    var icon: Image
    var foregroundColor: Color
    var backgroundColor: Color

    public init(
        title: String,
        icon: Image,
        foregroundColor: Color,
        backgroundColor: Color
    ) {
        self.title = title
        self.icon = icon
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }

    public var body: some View {
        HStack(spacing: 4) {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .foregroundColor(foregroundColor)
                    .font(FontFamily.Roboto.bold.swiftUIFont(size: 18))
                    .multilineTextAlignment(.center)

                Text(L10n.tap)
                    .foregroundColor(foregroundColor)
                    .font(FontFamily.Roboto.regular.swiftUIFont(size: 14))
                    .multilineTextAlignment(.center)
            }

            Spacer()
            icon
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .foregroundColor(foregroundColor)
        }
        .padding(.top, 16)
        .padding(.bottom, 12)
        .padding(.horizontal, 12)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [backgroundColor, backgroundColor.opacity(0.4)]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

#if DEBUG
public struct GHADCard_Previews: PreviewProvider {
    public static var previews: some View {
        VStack(alignment: .center) {
            GHADCard(
                title: "Title",
                icon: Image(systemSymbol: .moonStars),
                foregroundColor: Asset.Colors.overPrimary.swiftUIColor,
                backgroundColor: Asset.Colors.primary.swiftUIColor
            )
            .padding(16)
            GHADCard(
                title: "Title",
                icon: Image(systemSymbol: .moonStars),
                foregroundColor: Asset.Colors.overSecondary.swiftUIColor,
                backgroundColor: Asset.Colors.secondary.swiftUIColor
            )
            .padding(16)
        }
    }
}
#endif
