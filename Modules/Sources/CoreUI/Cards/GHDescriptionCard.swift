import Core
import SFSafeSymbols
import SwiftUI

public struct GHDescriptionCard: View {
    var model: BasicCardProtocol
    var customImage: Image?
    var isSelectable: Bool

    public init(
        model: BasicCardProtocol,
        customImage: Image? = nil,
        isSelectable: Bool = false
    ) {
        self.model = model
        self.customImage = customImage
        self.isSelectable = isSelectable
    }

    public var body: some View {
        VStack(spacing: 8) {
            HStack(alignment: .center, spacing: 8) {
                if let customImage: Image = customImage {
                    customImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                        .cornerRadius(15)
                        .shadow(radius: 3)
                    .accessibilityLabel(Text(model.title))
                } else {
                    GHImageCard(
                        url: model.avatarUrl
                    )
                    .accessibilityLabel(Text(model.title))
                }
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
            Text(LocalizedStringKey(model.title))
                .foregroundColor(Asset.Colors.textPrimary.swiftUIColor)
                .font(FontFamily.Roboto.regular.swiftUIFont(size: 15))
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
