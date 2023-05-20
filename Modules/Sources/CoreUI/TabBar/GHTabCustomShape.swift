import SwiftUI

public struct GHTabCustomShape: Shape {
    public func path(in rect: CGRect) -> Path {
        let path: UIBezierPath = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: [.bottomLeft, .bottomRight],
            cornerRadii: CGSize(width: 10, height: 10)
        )
        return Path(path.cgPath)
    }
}
