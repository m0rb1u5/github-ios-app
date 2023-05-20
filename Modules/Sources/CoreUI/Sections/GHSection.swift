import Core
import SwiftUI

public struct GHSection<Content: View>: View {
    var header: String
    var hasSeeAllButton: Bool
    @Binding var isShowingAll: Bool
    var withTrailingPadding: Bool
    @ViewBuilder var content: Content

    public init(
        header: String,
        hasSeeAllButton: Bool,
        isShowingAll: Binding<Bool> = .constant(false),
        withTrailingPadding: Bool = true,
        @ViewBuilder content: () -> Content
    ) {
        self.header = header
        self.hasSeeAllButton = hasSeeAllButton
        self._isShowingAll = isShowingAll
        self.withTrailingPadding = withTrailingPadding
        self.content = content()
    }

    public var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Divider()
                .frame(width: 5)
                .background(Asset.Colors.primary.swiftUIColor)
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text(header)
                        .foregroundColor(Asset.Colors.textPrimary.swiftUIColor)
                        .font(FontFamily.Roboto.bold.swiftUIFont(size: 18))
                        .multilineTextAlignment(.center)
                    Spacer()
                    if hasSeeAllButton {
                        Button(
                            action: {
                                isShowingAll = true
                            },
                            label: {
                                Text(L10n.seeAll)
                                    .foregroundColor(Asset.Colors.secondary.swiftUIColor)
                                    .font(FontFamily.Roboto.regular.swiftUIFont(size: 16))
                            }
                        )
                    }
                }
                .padding(.trailing, 16)
                content
                    .padding(.trailing, withTrailingPadding ? 16 : 0)
            }
        }
    }
}

#if DEBUG
public struct GHSection_Previews: PreviewProvider {
    public static var previews: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 24) {
                GHSection(
                    header: "Users",
                    hasSeeAllButton: true,
                    withTrailingPadding: false
                ) {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            ForEach(User.mockUsers(), id: \.self) { mock in
                                GHUserCard(
                                    user: mock
                                )
                            }
                        }
                    }
                }
                GHSection(
                    header: "Repositories",
                    hasSeeAllButton: false
                ) {
                    GHADCard(
                        title: Repo.mock().title,
                        icon: Image(systemSymbol: .moonStars),
                        foregroundColor: Asset.Colors.overPrimary.swiftUIColor,
                        backgroundColor: Asset.Colors.primary.swiftUIColor
                    )
                }
            }
        }
    }
}
#endif
