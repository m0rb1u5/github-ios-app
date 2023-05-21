import ComposableArchitecture
import Core
import CoreUI
import SwiftUI

public struct UnloggedView: View {
    let store: StoreOf<Unlogged>
    @Namespace private var animation: Namespace.ID

    public init(store: StoreOf<Unlogged>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack(spacing: .zero) {
                GHUnderConstructionScreen()
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}

#if DEBUG
public struct UnloggedView_Previews: PreviewProvider {
    public static var previews: some View {
        UnloggedView(
            store: Store(
                initialState: Unlogged.State(),
                reducer: Unlogged()
            )
        )
    }
}
#endif
