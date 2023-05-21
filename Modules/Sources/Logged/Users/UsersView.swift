import ComposableArchitecture
import Core
import CoreUI
import SwiftUI

// swiftlint:disable type_body_length file_length
public struct UsersView: View {
    let store: StoreOf<Users>

    public init(store: StoreOf<Users>) {
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
                        send: { Users.Action.searchedUsers($0) }
                    ),
                    prompt: "Search a User"
                )
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle(L10n.usersTitle)
            .ghNavigationLink(
                isActive: viewStore.binding(
                    get: \.userDetailIsPresented,
                    send: { Users.Action.presentUserDetail($0) }
                ),
                destination: {
                    userDetailView
                }
            )
        }
    }

    @ViewBuilder
    private var content: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            if viewStore.searchKey.isEmpty {
                GHRequestScreen(state: viewStore.users) { users in
                    LazyVStack(spacing: .zero) {
                        ForEach(users, id: \.self) { user in
                            Button(
                                action: { viewStore.send(.userSelected(user)) },
                                label: {
                                    GHUserCard(
                                        user: user
                                    )
                                }
                            )
                        }
                    }
                }
            } else {
                GHRequestScreen(state: viewStore.searchedUsers) { searchedUsers in
                    LazyVStack(spacing: .zero) {
                        ForEach(searchedUsers.items, id: \.self) { user in
                            Button(
                                action: { viewStore.send(.userSelected(user)) },
                                label: {
                                    GHUserCard(
                                        user: user
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

    @ViewBuilder
    private var userDetailView: some View {
        IfLetStore(
            store.scope(
                state: \.userDetail,
                action: Users.Action.userDetail
            )
        ) {
            UserDetailView(store: $0)
        }
    }
}

#if DEBUG
public struct UsersView_Previews: PreviewProvider {
    public static var previews: some View {
        UsersView(
            store: Store(
                initialState: Users.State(),
                reducer: Users()
            )
        )
    }
}
#endif
// swiftlint:enable type_body_length file_length
