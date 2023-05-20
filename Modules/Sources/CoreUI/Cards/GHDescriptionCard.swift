import Core
import SFSafeSymbols
import SwiftUI

public struct GHDescriptionCard: View {
    var model: BasicCardProtocol
    var isSelectable: Bool

    public init(
        model: BasicCardProtocol,
        isSelectable: Bool = false
    ) {
        self.model = model
        self.isSelectable = isSelectable
    }

    public var body: some View {
        VStack(spacing: 8) {
            HStack(alignment: .center, spacing: 8) {
                GHImageCard(
                    url: model.avatarUrl
                )
                .accessibilityLabel(Text(model.title))
                content
                Spacer(minLength: 0)
                if isSelectable {
                    Image(systemSymbol: .chevronForward)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                        .foregroundColor(Asset.Colors.iconTertiary.swiftUIColor)
                        .accessibilityLabel(Text(SFSymbol.chevronForward.rawValue))
                }
            }
            .padding(.top, isSelectable ? 8 : 0)
            .padding(.trailing)
            if isSelectable {
                Divider()
            }
        }
    }

    @ViewBuilder
    private var content: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(model.title)
                .foregroundColor(Asset.Colors.textPrimary.swiftUIColor)
                .font(FontFamily.Roboto.regular.swiftUIFont(size: 18))
                .multilineTextAlignment(.leading)
        }
    }
}

#if DEBUG
public struct GHDescriptionCard_Previews: PreviewProvider {
    public static var previews: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                Text("Normal Card")
                    .font(.title)
                ForEach(Repo.mockRepos(), id: \.self) { mock in
                    GHDescriptionCard(
                        model: mock
                    )
                }
                Text("Selectable Card")
                    .font(.title)
                    .padding(.top, 16)
                ForEach(Repo.mockRepos(), id: \.self) { mock in
                    GHDescriptionCard(
                        model: mock,
                        isSelectable: true
                    )
                }
            }
        }
        .padding(.vertical, 16)
        .padding(.leading, 16)
    }
}
#endif
