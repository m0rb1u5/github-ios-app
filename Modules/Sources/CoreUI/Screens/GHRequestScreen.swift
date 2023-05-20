import Core
import SwiftUI

public struct GHRequestScreen<K, LoadedView>: View where LoadedView: View {
    private let state: DataState<K>
    private let loadedView: (K) -> LoadedView
    private let isComponent: Bool

    public init(
        state: DataState<K>,
        loadedView: @escaping (K) -> LoadedView,
        isComponent: Bool = true
    ) {
        self.state = state
        self.loadedView = loadedView
        self.isComponent = isComponent
    }

    @ViewBuilder
    public var body: some View {
        switch state {
        case .loading:
            VStack(spacing: .zero) {
                if !isComponent {
                    Spacer()
                }
                GHLoadingView(scale: 2.0)
                    .padding(.vertical, 64)
                    .frame(maxWidth: .infinity)
                if !isComponent {
                    Spacer()
                }
            }

        case let .loaded(data):
            loadedView(data)

        case .error:
            VStack(spacing: 8) {
                if !isComponent {
                    Spacer()
                }
                errorView
                    .padding(.vertical, 48)
                    .frame(maxWidth: .infinity)
                if !isComponent {
                    Spacer()
                }
            }
        }
    }

    @ViewBuilder
    private var errorView: some View {
        VStack(spacing: 16) {
            Image(systemSymbol: .ladybugFill)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .shadow(radius: 3)
                .accessibilityLabel(L10n.errorDescription + " icon")
            VStack(spacing: 4) {
                Text(L10n.warningTitle)
                    .foregroundColor(Asset.Colors.textPrimary.swiftUIColor)
                    .font(FontFamily.Roboto.bold.swiftUIFont(size: 18))
                    .multilineTextAlignment(.center)
                Text(L10n.errorDescription)
                    .foregroundColor(Asset.Colors.textSecondary.swiftUIColor)
                    .font(FontFamily.Roboto.regular.swiftUIFont(size: 16))
            }
        }
    }
}

#if DEBUG
public struct GHRequestScreen_Previews: PreviewProvider {
    public static var previews: some View {
        Group {
            previewLoading
            previewLoaded
            previewError
        }
    }

    public static var previewLoading: some View {
        makePreview(.loading)
            .previewDisplayName("Loading")
    }

    public static var previewLoaded: some View {
        makePreview(.loaded(true))
            .previewDisplayName("Loaded")
    }

    public static var previewError: some View {
        makePreview(.error(.mock))
            .previewDisplayName("Error")
    }

    private static func makePreview(
        _ dataState: DataState<Bool>
    ) -> some View {
        GHRequestScreen(
            state: dataState,
            loadedView: loadedView
        )
    }

    private static func loadedView(data: Bool) -> some View {
        Text("Loaded View: " + (data ? "Yes" : "No"))
    }
}
#endif
