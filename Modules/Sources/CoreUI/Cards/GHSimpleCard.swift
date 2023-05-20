import Core
import SwiftUI

public struct GHSimpleCard: View {
    var model: BasicCardProtocol

    public init(
        model: BasicCardProtocol
    ) {
        self.model = model
    }

    public var body: some View {
        VStack(spacing: 4) {
            GHImageCard(url: model.avatarUrl)
                .accessibilityLabel(Text(model.title))

            Text(model.title)
                .foregroundColor(Asset.Colors.textPrimary.swiftUIColor)
                .font(FontFamily.Roboto.regular.swiftUIFont(size: 12))
                .multilineTextAlignment(.center)
                .frame(width: 100)
        }
    }
}

#if DEBUG
public struct GHSimpleCard_Previews: PreviewProvider {
    public static var previews: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 16) {
                ForEach(Repo.mockRepos(), id: \.self) { mock in
                    GHSimpleCard(
                        model: mock
                    )
                }
            }
        }
        .padding(16)
    }
}
#endif
