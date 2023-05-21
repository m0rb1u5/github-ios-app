import ComposableArchitecture
import Core
import CoreUI
import SwiftUI

// swiftlint:disable type_body_length file_length
public struct OrgsView: View {
    let store: StoreOf<Orgs>

    public init(store: StoreOf<Orgs>) {
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
            .navigationTitle(L10n.orgsTitle)
        }
    }

    @ViewBuilder
    private var content: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            GHRequestScreen(state: viewStore.orgs) { orgs in
                LazyVStack(spacing: .zero) {
                    ForEach(orgs, id: \.self) { org in
                        Button(
                            action: { },
                            label: {
                                GHOrgCard(
                                    org: org
                                )
                            }
                        )
                    }
                }
            }
        }
        .padding(.bottom, 16)
    }
}

#if DEBUG
public struct OrgsView_Previews: PreviewProvider {
    public static var previews: some View {
        OrgsView(
            store: Store(
                initialState: Orgs.State(),
                reducer: Orgs()
            )
        )
    }
}
#endif
// swiftlint:enable type_body_length file_length
