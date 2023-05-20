import Core
import SFSafeSymbols
import SwiftUI

public struct GHRepoCard: View {
    var repo: Repo

    public init(
        repo: Repo
    ) {
        self.repo = repo
    }

    public var body: some View {
        VStack(spacing: 8) {
            HStack(alignment: .center, spacing: 8) {
                GHImageCard(
                    url: repo.avatarUrl,
                    size: 60
                )
                .accessibilityLabel(Text(repo.title))
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
            Text(repo.title)
                .foregroundColor(Asset.Colors.textSecondary.swiftUIColor)
                .font(FontFamily.Roboto.bold.swiftUIFont(size: 16))
                .multilineTextAlignment(.center)
            GHInfoLabel(
                style: .card,
                infos: [repo.description ?? ""]
            )
            bottomInfos
        }
    }

    @ViewBuilder
    private var bottomInfos: some View {
        HStack(spacing: 16) {
            if !repo.fork {
                GHInfoLabel(
                    style: .card,
                    infos: [L10n.fork],
                    icon: Image(systemSymbol: .arrowTriangleBranch)
                )
            }
            GHInfoLabel(
                style: .card,
                infos: [repo.isPrivate ? L10n.private : L10n.public],
                icon: Image(systemSymbol: repo.isPrivate ? .lockFill : .lockOpenFill)
            )
        }
    }
}

#if DEBUG
public struct GHRepoCard_Previews: PreviewProvider {
    public static var previews: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                ForEach(Repo.mockRepos(), id: \.self) { mock in
                    GHRepoCard(
                        repo: mock
                    )
                }
            }
        }
        .padding(.vertical, 16)
        .padding(.leading, 16)
    }
}
#endif
