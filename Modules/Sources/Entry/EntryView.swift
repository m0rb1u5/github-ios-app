import ComposableArchitecture
import Core
import CoreUI
import Logged
import Unlogged
import SwiftUI

public struct EntryView: View {
    let store: StoreOf<Entry>
    @Namespace private var animation: Namespace.ID

    public init(store: StoreOf<Entry>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack(spacing: .zero) {
                if viewStore.isLogged {
                    loggedView
                } else {
                    unloggedView
                }
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }

    @ViewBuilder
    private var loggedView: some View {
        IfLetStore(
            store.scope(
                state: \.logged,
                action: Entry.Action.logged
            ),
            then: LoggedView.init(store:)
        )
    }

    @ViewBuilder
    private var unloggedView: some View {
        IfLetStore(
            store.scope(
                state: \.unlogged,
                action: Entry.Action.unlogged
            ),
            then: UnloggedView.init(store:)
        )
    }
}

#if DEBUG
public struct EntryView_Previews: PreviewProvider {
    public static var previews: some View {
        EntryView(
            store: Store(
                initialState: Entry.State(),
                reducer: Entry()
            )
        )
    }
}
#endif
