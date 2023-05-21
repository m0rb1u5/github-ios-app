import ComposableArchitecture
import Core
import CoreUI
import SwiftUI

// swiftlint:disable type_body_length
public struct HomeView: View {
    let store: StoreOf<Home>

    public init(store: StoreOf<Home>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            NavigationStack {
                VStack(spacing: .zero) {
                    ScrollView(showsIndicators: false) {
                        content
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        ghNavigationBar
                    }
                }
                /*.ghNavigationLink(
                    isActive: viewStore.binding(
                        get: \.eventDetailIsPresented,
                        send: { Home.Action.presentEventDetail($0) }
                    ),
                    destination: {
                        eventDetailView
                    }
                )*/
                .ghNavigationLink(
                    isActive: viewStore.binding(
                        get: \.seeAllUsers,
                        send: { Home.Action.seeAllUsers($0) }
                    ),
                    destination: {
                        usersView
                    }
                )
                .ghNavigationLink(
                    isActive: viewStore.binding(
                        get: \.seeAllRepos,
                        send: { Home.Action.seeAllRepos($0) }
                    ),
                    destination: {
                        reposView
                    }
                )
                .ghNavigationLink(
                    isActive: viewStore.binding(
                        get: \.seeAllOrgs,
                        send: { Home.Action.seeAllOrgs($0) }
                    ),
                    destination: {
                        orgsView
                    }
                )
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }

    @ViewBuilder
    private var ghNavigationBar: some View {
        ZStack {
            Asset.Images.githubHeader.swiftUIImage
                .resizable()
                .scaledToFit()
                .frame(height: 28)
                .foregroundColor(Asset.Colors.textSecondary.swiftUIColor)
        }
    }

    @ViewBuilder
    private var content: some View {
        VStack(spacing: 24) {
            usersSection
            reposSection
            orgsSection
            developerSection
        }
        .padding(.bottom, 16)
    }

    /*
    @ViewBuilder
    private var eventDetailView: some View {
        IfLetStore(
            store.scope(
                state: \.eventDetail,
                action: Home.Action.eventDetail
            )
        ) {
            EventDetailView(store: $0)
        }
    }*/

    @ViewBuilder
    private var usersView: some View {
        IfLetStore(
            store.scope(
                state: \.usersState,
                action: Home.Action.users
            )
        ) {
            UsersView(store: $0)
        }
    }

    @ViewBuilder
    private var reposView: some View {
        IfLetStore(
            store.scope(
                state: \.reposState,
                action: Home.Action.repos
            )
        ) {
            ReposView(store: $0)
        }
    }

    @ViewBuilder
    private var orgsView: some View {
        IfLetStore(
            store.scope(
                state: \.orgsState,
                action: Home.Action.orgs
            )
        ) {
            OrgsView(store: $0)
        }
    }

    @ViewBuilder
    private var usersSection: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            GHSection(
                header: L10n.usersTitle,
                hasSeeAllButton: true,
                isShowingAll: viewStore.binding(
                    get: \.seeAllUsers,
                    send: { Home.Action.seeAllUsers($0) }
                )
            ) {
                GHRequestScreen(state: viewStore.users) { users in
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(alignment: .top, spacing: 16) {
                            ForEach(users, id: \.self) { user in
                                NavigationLink(
                                    destination: GHUnderConstructionScreen()
                                        .navigationTitle(user.title)
                                        .navigationBarTitleDisplayMode(.inline)
                                ) {
                                    GHSimpleCard(
                                        model: user
                                    )
                                }
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
                hasSeeAllButton: true,
                isShowingAll: viewStore.binding(
                    get: \.seeAllRepos,
                    send: { Home.Action.seeAllRepos($0) }
                )
            ) {
                GHRequestScreen(state: viewStore.repos) { repos in
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(alignment: .top, spacing: 16) {
                            ForEach(repos, id: \.self) { repo in
                                NavigationLink(
                                    destination: GHUnderConstructionScreen()
                                        .navigationTitle(repo.title)
                                        .navigationBarTitleDisplayMode(.inline)
                                ) {
                                    GHSimpleCard(
                                        model: repo
                                    )
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var orgsSection: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            GHSection(
                header: L10n.orgsTitle,
                hasSeeAllButton: true,
                isShowingAll: viewStore.binding(
                    get: \.seeAllOrgs,
                    send: { Home.Action.seeAllOrgs($0) }
                )
            ) {
                GHRequestScreen(state: viewStore.orgs) { orgs in
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(alignment: .top, spacing: 16) {
                            ForEach(orgs, id: \.self) { org in
                                NavigationLink(
                                    destination: GHUnderConstructionScreen()
                                        .navigationTitle(org.title)
                                        .navigationBarTitleDisplayMode(.inline)
                                ) {
                                    GHSimpleCard(
                                        model: org
                                    )
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var developerSection: some View {
        GHSection(
            header: L10n.aboutMeTitle,
            hasSeeAllButton: false
        ) {
            GHDescriptionCard(
                model: BasicCard(id: 1, title: L10n.meDescription, avatarUrl: URL(fileURLWithPath: "")),
                customImage: Asset.Images.me.swiftUIImage
            )
        }
    }
}

#if DEBUG
public struct HomeView_Previews: PreviewProvider {
    public static var previews: some View {
        HomeView(
            store: Store(
                initialState: Home.State(),
                reducer: Home()
            )
        )
    }
}
#endif
// swiftlint:enable type_body_length
