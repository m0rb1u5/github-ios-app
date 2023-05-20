import Foundation
import SwiftUI

public struct GHNavigationLink<Destination: View>: ViewModifier {
    private var isActive: Binding<Bool>
    private var destination: () -> Destination

    public init(
        isActive: Binding<Bool>,
        destination: @escaping () -> Destination
    ) {
        self.isActive = isActive
        self.destination = destination
    }

    public func body(content: Content) -> some View {
        ZStack {
            NavigationLink(
                isActive: isActive,
                destination: destination,
                label: EmptyView().hidden
            )
            .opacity(0)
            content
        }
    }
}
