import Core
import SwiftUI

public struct GHImageCard: View {
    var url: URL
    var size: CGFloat

    public init(
        url: URL,
        size: CGFloat = 100
    ) {
        self.url = url
        self.size = size
    }

    public var body: some View {
        AsyncImage(
            url: url,
            content: {image in
                image
                    .resizable()
                    .scaledToFill()
            },
            placeholder: {
                Asset.Colors.iconTertiary.swiftUIColor
            }
        )
        .frame(width: size, height: size)
        .clipped()
        .cornerRadius(15)
        .shadow(radius: 3)
    }
}

#if DEBUG
public struct GHImageCard_Previews: PreviewProvider {
    public static var previews: some View {
        VStack {
            GHImageCard(
                url: URL(string: "https://avatars.githubusercontent.com/u/1?v=4") ?? URL(fileURLWithPath: ""),
                size: 60
            )
            GHImageCard(
                url: URL(string: "https://avatars.githubusercontent.com/u/1024025?v=4") ?? URL(fileURLWithPath: "")
            )
        }
        .padding()
    }
}
#endif
