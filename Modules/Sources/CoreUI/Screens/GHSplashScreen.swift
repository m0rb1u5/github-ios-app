import Core
import SwiftUI

public struct GHSplashScreen: View {
    @State var isFinished: Bool = false
    public init(
    ) {
    }

    @ViewBuilder
    public var body: some View {
        if !isFinished {
            VStack(spacing: .zero) {
                Spacer()
                Asset.Images.github.swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .foregroundColor(Asset.Colors.textSecondary.swiftUIColor)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Asset.Colors.overSecondary.swiftUIColor)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation(.linear(duration: 0.9)) {
                        isFinished.toggle()
                    }
                }
            }
        }
    }
}

#if DEBUG
public struct GHSplashScreen_Previews: PreviewProvider {
    public static var previews: some View {
        VStack {
            Text("App")
                .font(.title)
        }
        .overlay {
            GHSplashScreen()
        }
    }
}
#endif
