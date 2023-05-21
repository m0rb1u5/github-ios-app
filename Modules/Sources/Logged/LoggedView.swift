import ComposableArchitecture
import Core
import CoreUI
import Home
import SwiftUI

public struct LoggedView: View {
    let store: StoreOf<Logged>
    @Namespace private var animation: Namespace.ID

    public init(store: StoreOf<Logged>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack(spacing: .zero) {
                views
                HStack(spacing: .zero) {
                    ForEach(viewStore.tabs, id: \.self ) { tab in
                        GHTabButton(
                            tab: tab,
                            selectedTab: viewStore.binding(
                                get: \.selectedTab,
                                send: { Logged.Action.selectTab($0) }
                            ),
                            animation: animation
                        )

                        if tab != viewStore.tabs.last {
                            Spacer(minLength: .zero)
                        }
                    }
                }
                .padding(.horizontal, 30)
                .background(Color.gray.opacity(0.15).ignoresSafeArea(.all, edges: .bottom))
            }
            .overlay {
                GHSplashScreen()
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }

    @ViewBuilder
    private var views: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            switch viewStore.selectedTab {
            case .home:
                homeView

            case .users:
                GHUnderConstructionScreen() // TODO: To implement in the future

            case .repos:
                GHUnderConstructionScreen() // TODO: To implement in the future

            case .orgs:
                GHUnderConstructionScreen() // TODO: To implement in the future

            case .profile:
                GHUnderConstructionScreen() // TODO: To implement in the future
            }
        }
    }

    @ViewBuilder
    private var homeView: some View {
        IfLetStore(
            store.scope(
                state: \.home,
                action: Logged.Action.home
            ),
            then: HomeView.init(store:)
        )
    }
}

#if DEBUG
public struct LoggedView_Previews: PreviewProvider {
    public static var previews: some View {
        LoggedView(
            store: Store(
                initialState: Logged.State(),
                reducer: Logged()
            )
        )
    }
}
#endif
