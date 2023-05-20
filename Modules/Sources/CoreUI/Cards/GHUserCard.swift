import Core
import SFSafeSymbols
import SwiftUI

public struct GHUserCard: View {
    var user: User

    public init(
        user: User
    ) {
        self.user = user
    }

    public var body: some View {
        VStack(spacing: 8) {
            HStack(alignment: .center, spacing: 8) {
                GHImageCard(
                    url: user.avatarUrl,
                    size: 60
                )
                .accessibilityLabel(Text(user.title))
                content
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

    @ViewBuilder
    private var content: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(user.title)
                .foregroundColor(Asset.Colors.textSecondary.swiftUIColor)
                .font(FontFamily.Roboto.bold.swiftUIFont(size: 16))
                .multilineTextAlignment(.center)
            if user.title != user.login {
                GHInfoLabel(
                    style: .card,
                    infos: [user.login]
                )
            }
        }
    }
}

#if DEBUG
public struct GHUserCard_Previews: PreviewProvider {
    public static var previews: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                ForEach(User.mockUsers(), id: \.self) { mock in
                    GHUserCard(
                        user: mock
                    )
                }
            }
        }
        .padding(.vertical, 16)
        .padding(.leading, 16)
    }
}
#endif
