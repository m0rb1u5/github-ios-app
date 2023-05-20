import SFSafeSymbols
import SwiftUI

public enum TabBarType: CaseIterable {
    case home
    case users
    case repos
    case orgs
    case profile

    public var title: String {
        switch self {
        case .home:
            return L10n.homeTab

        case .users:
            return L10n.usersTab

        case .repos:
            return L10n.reposTab

        case .orgs:
            return L10n.orgsTab

        case .profile:
            return L10n.profileTab
        }
    }

    public var image: Image {
        switch self {
        case .home:
            return Image(systemSymbol: .houseFill)

        case .users:
            return Image(systemSymbol: .person3Fill)

        case .repos:
            return Image(systemSymbol: .shippingboxFill)

        case .orgs:
            return Image(systemSymbol: .building2Fill)

        case .profile:
            return Image(systemSymbol: .personFill)
        }
    }
}
