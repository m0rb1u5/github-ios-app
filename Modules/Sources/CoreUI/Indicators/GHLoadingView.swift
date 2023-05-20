import Core
import SwiftUI

public struct GHLoadingView: View {
    var scale: CGFloat
    var color: Color

    public init(scale: CGFloat = 1.0, color: Color = Asset.Colors.secondary.swiftUIColor) {
        self.scale = scale
        self.color = color
    }

    public var body: some View {
        ProgressView()
            .scaleEffect(scale, anchor: .center)
            .progressViewStyle(CircularProgressViewStyle(tint: color))
    }
}

#if DEBUG
public struct GHLoadingView_Previews: PreviewProvider {
    public static var previews: some View {
        GHLoadingView()
    }
}
#endif
