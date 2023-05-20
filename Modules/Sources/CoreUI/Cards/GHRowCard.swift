import Core
import SFSafeSymbols
import SwiftUI

public struct GHRowCard: View {
    var model: BasicCardProtocol
    var icon: Image

    public init(
        model: BasicCardProtocol,
        icon: Image
    ) {
        self.model = model
        self.icon = icon
    }

    public var body: some View {
        VStack(spacing: 8) {
            HStack(alignment: .center, spacing: 8) {
                icon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .foregroundColor(Asset.Colors.iconPrimary.swiftUIColor)
                    .accessibilityLabel(model.title + " icon")
                Text(model.title)
                    .foregroundColor(Asset.Colors.textPrimary.swiftUIColor)
                    .font(FontFamily.Roboto.regular.swiftUIFont(size: 16))
                    .multilineTextAlignment(.center)
                Spacer()
                Image(systemSymbol: .chevronForward)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .foregroundColor(Asset.Colors.iconTertiary.swiftUIColor)
                    .accessibilityLabel(Text(SFSymbol.chevronForward.rawValue))
            }
            .padding(.top, 8)
            .padding(.trailing)
            Divider()
        }
    }
}

#if DEBUG
public struct GHRowCard_Previews: PreviewProvider {
    public static var previews: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                GHRowCard(
                    model: User.mock(),
                    icon: Image(systemSymbol: .person)
                )
                ForEach(Repo.mockRepos(), id: \.self) { mock in
                    GHRowCard(
                        model: mock,
                        icon: Image(systemSymbol: .shippingbox)
                    )
                }
                GHRowCard(
                    model: Org.mock(),
                    icon: Image(systemSymbol: .building)
                )
            }
        }
        .padding(.vertical, 16)
        .padding(.leading, 16)
    }
}
#endif
