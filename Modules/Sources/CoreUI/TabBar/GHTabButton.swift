import Core
import SwiftUI

public struct GHTabButton: View {
    var tab: TabBarType
    @Binding var selectedTab: TabBarType
    var animation: Namespace.ID

    public init(
        tab: TabBarType,
        selectedTab: Binding<TabBarType>,
        animation: Namespace.ID
    ) {
        self.tab = tab
        self._selectedTab = selectedTab
        self.animation = animation
    }

    public var body: some View {
        Button(
            action: {
                withAnimation {
                    selectedTab = tab
                }
            }, label: {
                VStack(spacing: 6) {
                    ZStack {
                        GHTabCustomShape()
                            .fill(Color.clear)
                            .frame(width: 45, height: 6)

                        if selectedTab == tab {
                            GHTabCustomShape()
                                .fill(Asset.Colors.primary.swiftUIColor)
                                .frame(width: 45, height: 6)
                                .matchedGeometryEffect(id: "Tab_Change", in: animation)
                        }
                    }
                    .padding(.bottom, 10)

                    tab.image
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(
                            selectedTab == tab ? Asset.Colors.primary.swiftUIColor :
                                Asset.Colors.textSecondary.swiftUIColor.opacity(0.2)
                        )
                        .frame(width: 24, height: 24)
                        .accessibilityLabel(Text(tab.title))
                }
            }
        )
    }
}

#if DEBUG
public struct GHTabButton_Previews: PreviewProvider {
    public static var previews: some View {
        HStack {
            GHTabButton(
                tab: .home,
                selectedTab: .constant(.home),
                animation: Namespace().wrappedValue
            )
            GHTabButton(
                tab: .users,
                selectedTab: .constant(.home),
                animation: Namespace().wrappedValue
            )
        }
    }
}
#endif
