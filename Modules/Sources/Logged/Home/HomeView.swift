import ComposableArchitecture
import Core
import CoreUI
import SwiftUI

// swiftlint:disable type_body_length file_length
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
                /*.dvNavigationLink(
                    isActive: viewStore.binding(
                        get: \.eventDetailIsPresented,
                        send: { Home.Action.presentEventDetail($0) }
                    ),
                    destination: {
                        eventDetailView
                    }
                )
                .dvNavigationLink(
                    isActive: viewStore.binding(
                        get: \.seeAllEvents,
                        send: { Home.Action.seeAllEvents($0) }
                    ),
                    destination: {
                        eventsView
                    }
                )*/
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
        }    }

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
    }

    @ViewBuilder
    private var eventsView: some View {
        IfLetStore(
            store.scope(
                state: \.eventsState,
                action: Home.Action.events
            )
        ) {
            EventsView(store: $0)
        }
    }*/

    @ViewBuilder
    private var usersSection: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            GHSection(
                header: L10n.usersTitle,
                hasSeeAllButton: true
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
                hasSeeAllButton: true
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
                hasSeeAllButton: true
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
// swiftlint:enable type_body_length file_length
