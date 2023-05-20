import Foundation
import SwiftUI

public extension View {
    @ViewBuilder
    func dvNavigationLink<Destination: View>(
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
