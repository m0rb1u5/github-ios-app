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
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle(L10n.usersTitle)
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
    }

    @ViewBuilder
    private var content: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            GHRequestScreen(state: viewStore.users) { users in
                VStack(spacing: .zero) {
                    ForEach(users, id: \.self) { user in
                        Button(
                            action: { },//viewStore.send(.eventSelected(event)) },
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
