import Core
import Foundation
import SwiftUI

public struct GHButtonStyle: ButtonStyle {
    let style: GHButton.Style
    var isLoading: Bool

    public init(
        style: GHButton.Style,
        isLoading: Bool = false
    ) {
        self.style = style
        self.isLoading = isLoading
    }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(isLoading ? 0 : 1.0)
            .foregroundColor(style.foreground)
            .padding(.horizontal, 16)
            .padding(.top, 16)
            .padding(.bottom, 16)
            .frame(maxWidth: .infinity)
            .background(style.background)
            .font(style.font)
            .cornerRadius(style.cornerRadius)
            .overlay(
                GHLoadingView(color: style.foreground)
                    .opacity(isLoading ? 1.0 : 0)
            )
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

#if DEBUG
public struct GHButtonStyle_Previews: PreviewProvider {
    public static var previews: some View {
        VStack {
            Text("Primary Style")
                .font(.title)
            VStack {
                makePreview()
                makePreview(style: .secondary)
                makePreview(isLoading: true)
            }
            .padding(24)
        }
    }

    public static func makePreview(
        style: GHButton.Style = .primary,
        isLoading: Bool = false
    ) -> some View {
        Button(
            action: { },
            label: { Text("Tap Me!") }
        )
        .buttonStyle(
            GHButtonStyle(
                style: style,
                isLoading: isLoading
            )
        )
    }
}
#endif
