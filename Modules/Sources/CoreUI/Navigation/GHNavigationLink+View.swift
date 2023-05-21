import Foundation
import SwiftUI

public extension View {
    @ViewBuilder
    func ghNavigationLink<Destination: View>(
        isActive: Binding<Bool>,
        destination: @escaping () -> Destination
    ) -> some View {
        modifier(
            GHNavigationLink(
                isActive: isActive,
                destination: destination
            )
        )
    }
}
