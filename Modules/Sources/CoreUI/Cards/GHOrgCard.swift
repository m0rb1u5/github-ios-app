import Core
import SFSafeSymbols
import SwiftUI

public struct GHOrgCard: View {
    var org: Org

    public init(
        org: Org
    ) {
        self.org = org
    }

    public var body: some View {
        VStack(spacing: 8) {
            HStack(alignment: .center, spacing: 8) {
                GHImageCard(
                    url: org.avatarUrl,
                    size: 60
                )
                .accessibilityLabel(Text(org.title))
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
            Text(org.title)
                .foregroundColor(Asset.Colors.textSecondary.swiftUIColor)
                .font(FontFamily.Roboto.bold.swiftUIFont(size: 16))
                .multilineTextAlignment(.center)
            if org.title != org.login {
                GHInfoLabel(
                    style: .card,
                    infos: [org.login]
                )
            }
            bottomInfos
        }
    }

    @ViewBuilder
    private var bottomInfos: some View {
        if let description: String = org.description, !description.isEmpty {
            HStack(spacing: 16) {
                GHInfoLabel(
                    style: .card,
                    infos: [org.description ?? ""],
                    icon: Image(systemSymbol: .textAlignleft)
                )
            }
        }
    }
}

#if DEBUG
public struct GHOrgCard_Previews: PreviewProvider {
    public static var previews: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                ForEach(Org.mockOrgs(), id: \.self) { mock in
                    GHOrgCard(
                        org: mock
                    )
                }
            }
        }
        .padding(.vertical, 16)
        .padding(.leading, 16)
    }
}
#endif
