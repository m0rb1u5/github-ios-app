import ComposableArchitecture
import Core
import CoreUI
import SwiftUI

// swiftlint:disable type_body_length
public struct UserDetailView: View {
    let store: StoreOf<UserDetail>
    private let gridColumns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    public init(store: StoreOf<UserDetail>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack(spacing: .zero) {
                ScrollView(showsIndicators: false) {
                    content
                }
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle(viewStore.username)
        }
    }

    @ViewBuilder
    private var content: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            GHRequestScreen(state: viewStore.user) { user in
                VStack(spacing: 24) {
                    headerSection(user)
                    infoSection(user)
                    bioSection(user)
                    shareSection(user)
                    orgsSection
                    reposSection
                }
                .padding(.bottom, 16)
            }
        }
    }

    @ViewBuilder
    private func headerSection(_ user: User) -> some View {
        GHSection(
            hasSeeAllButton: false
        ) {
            GHDescriptionCard(
                model: user
            )
        }
    }

    @ViewBuilder
    private func shareSection(_ user: User) -> some View {
        GHSection(
            hasSeeAllButton: false
        ) {
            ShareLink(item: user.htmlUrl)
            .buttonStyle(
                GHButtonStyle(
                    style: .primary
                )
            )
        }
    }

    @ViewBuilder
    private func infoSection(_ user: User) -> some View {
        GHSection(
            header: "Info",
            hasSeeAllButton: false
        ) {
            VStack(spacing: .zero) {
                LazyVGrid(columns: gridColumns, alignment: .leading, spacing: 8) {
                    if let location: String = user.location {
                        GHInfoLabel(
                            style: .modal,
                            infos: [location],
                            icon: Image(systemSymbol: .location)
                        )
                    }
                    accountsInfo(user)
                    if let followers: Int = user.followers {
                        GHInfoLabel(
                            style: .modal,
                            infos: ["\(followers) folowers"],
                            icon: Image(systemSymbol: .person)
                        )
                    }
                    if let following: Int = user.following {
                        GHInfoLabel(
                            style: .modal,
                            infos: ["\(following) following"],
                            icon: Image(systemSymbol: .person)
                        )
                    }
                    if let hireable: Bool = user.hireable {
                        GHInfoLabel(
                            style: .modal,
                            infos: ["Hireable"],
                            icon: Image(systemSymbol: hireable ? .checkmark : .xmark)
                        )
                    }
                    repoCountInfo(user)
                    dateInfo(user)
                }
            }
        }
    }

    @ViewBuilder
    private func accountsInfo(_ user: User) -> some View {
        if let email: String = user.email {
            GHInfoLabel(
                style: .modal,
                infos: [email],
                icon: Image(systemSymbol: .mail)
            )
        }
        if let twitterUsername: String = user.twitterUsername {
            GHInfoLabel(
                style: .modal,
                infos: [twitterUsername],
                icon: Asset.Images.twitter.swiftUIImage
            )
        }
    }

    @ViewBuilder
    private func repoCountInfo(_ user: User) -> some View {
        if let publicRepos: Int = user.publicRepos {
            GHInfoLabel(
                style: .modal,
                infos: ["\(publicRepos) public repos"],
                icon: Image(systemSymbol: .lockOpenFill)
            )
        }
        if let ownedPrivateRepos: Int = user.ownedPrivateRepos {
            GHInfoLabel(
                style: .modal,
                infos: ["\(ownedPrivateRepos) owned private repos"],
                icon: Image(systemSymbol: .lockFill)
            )
        }
        if let totalPrivateRepos: Int = user.totalPrivateRepos {
            GHInfoLabel(
                style: .modal,
                infos: ["\(totalPrivateRepos) total private repos"],
                icon: Image(systemSymbol: .lockFill)
            )
        }
        if let publicGists: Int = user.publicGists {
            GHInfoLabel(
                style: .modal,
                infos: ["\(publicGists) public gists"],
                icon: Image(systemSymbol: .lockOpenFill)
            )
        }
        if let privateGists: Int = user.privateGists {
            GHInfoLabel(
                style: .modal,
                infos: ["\(privateGists) private gists"],
                icon: Image(systemSymbol: .lockFill)
            )
        }
    }

    @ViewBuilder
    private func dateInfo(_ user: User) -> some View {
        if let createdAt: Date = user.createdAt {
            GHInfoLabel(
                style: .modal,
                infos: [createdAt.formatTime()],
                icon: Image(systemSymbol: .play)
            )
        }
        if let updatedAt: Date = user.updatedAt {
            GHInfoLabel(
                style: .modal,
                infos: [updatedAt.formatTime()],
                icon: Image(systemSymbol: .sdcard)
            )
        }
    }

    @ViewBuilder
    private func bioSection(_ user: User) -> some View {
        if showBioSection(user) {
            GHSection(
                header: "Blog and Biography",
                hasSeeAllButton: false
            ) {
                VStack(alignment: .leading, spacing: 16) {
                    if let blog: String = user.blog, !blog.isEmpty {
                        GHInfoLabel(
                            style: .modal,
                            infos: ["[\(blog)](\(blog))"],
                            icon: Image(systemSymbol: .doc)
                        )
                    }
                    if let bio: String = user.bio, !bio.isEmpty {
                        Text(LocalizedStringKey(bio))
                            .foregroundColor(Asset.Colors.textPrimary.swiftUIColor)
                            .font(FontFamily.Roboto.regular.swiftUIFont(size: 18))
                            .multilineTextAlignment(.leading)
                    }
                }
            }
        } else {
            EmptyView()
        }
    }

    @ViewBuilder
    private var orgsSection: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            GHSection(
                header: L10n.orgsTitle,
                hasSeeAllButton: false
            ) {
                GHRequestScreen(state: viewStore.orgs) { orgs in
                    LazyVStack(spacing: .zero) {
                        if orgs.isEmpty {
                            HStack {
                                Text("-")
                                    .foregroundColor(Asset.Colors.textPrimary.swiftUIColor)
                                    .font(FontFamily.Roboto.regular.swiftUIFont(size: 16))
                                    .multilineTextAlignment(.center)
                                Spacer()
                            }
                        } else {
                            ForEach(orgs, id: \.self) { org in
                                GHRowCard(
                                    model: org,
                                    icon: Image(systemSymbol: .building2Fill)
                                )
                            }
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var reposSection: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            GHSection(
                header: L10n.reposTitle,
                hasSeeAllButton: false
            ) {
                GHRequestScreen(state: viewStore.repos) { repos in
                    LazyVStack(spacing: .zero) {
                        if repos.isEmpty {
                            HStack {
                                Text("-")
                                    .foregroundColor(Asset.Colors.textPrimary.swiftUIColor)
                                    .font(FontFamily.Roboto.regular.swiftUIFont(size: 16))
                                    .multilineTextAlignment(.center)
                                Spacer()
                            }
                        } else {
                            ForEach(repos, id: \.self) { repo in
                                GHRowCard(
                                    model: repo,
                                    icon: Image(systemSymbol: .shippingboxFill)
                                )
                            }
                        }
                    }
                }
            }
        }
    }

    private func showBioSection(_ user: User) -> Bool {
        if let bio: String = user.bio, !bio.isEmpty {
            return true
        }
        if let blog: String = user.blog, !blog.isEmpty {
            return true
        }
        return false
    }
}

#if DEBUG
public struct UserDetailView_Previews: PreviewProvider {
    public static var previews: some View {
        UserDetailView(
            store: Store(
                initialState: UserDetail.State(username: "m0rb1u5"),
                reducer: UserDetail()
            )
        )
    }
}
#endif
// swiftlint:enable type_body_length
