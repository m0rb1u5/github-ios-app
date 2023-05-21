import ComposableArchitecture
import Core
import CoreUI
import SwiftUI

// swiftlint:disable type_body_length file_length
public struct ReposView: View {
    let store: StoreOf<Repos>

    public init(store: StoreOf<Repos>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack(spacing: .zero) {
                ScrollView(showsIndicators: false) {
                    content
                }
                .searchable(
                    text: viewStore.binding(
                        get: \.searchKey,
                        send: { Repos.Action.searchedRepos($0) }
                    ),
                    prompt: "Search a Repo"
                )
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle(L10n.reposTitle)
        }
    }

    @ViewBuilder
    private var content: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            if viewStore.searchKey.isEmpty {
                GHRequestScreen(state: viewStore.repos) { repos in
                    LazyVStack(spacing: .zero) {
                        ForEach(repos, id: \.self) { repo in
                            Button(
                                action: { },//viewStore.send(.eventSelected(event)) },
                                label: {
                                    GHRepoCard(
                                        repo: repo
                                    )
                                }
                            )
                        }
                    }
                }
            } else {
                GHRequestScreen(state: viewStore.searchedRepos) { searchedRepos in
                    LazyVStack(spacing: .zero) {
                        ForEach(searchedRepos.items, id: \.self) { repo in
                            Button(
                                action: { },//viewStore.send(.eventSelected(event)) },
                                label: {
                                    GHRepoCard(
                                        repo: repo
                                    )
                                }
                            )
                        }
                    }
                }
            }
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
}

#if DEBUG
public struct ReposView_Previews: PreviewProvider {
    public static var previews: some View {
        ReposView(
            store: Store(
                initialState: Repos.State(),
                reducer: Repos()
            )
        )
    }
}
#endif
// swiftlint:enable type_body_length file_length
