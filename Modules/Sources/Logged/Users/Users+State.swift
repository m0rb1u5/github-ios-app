import ComposableArchitecture
import Core

public extension Users {
    struct State: Equatable {
        public var isInitialized: Bool
        public var users: DataState<[User]>
        public var userDetail: UserDetail.State?
        public var userDetailIsPresented: Bool

        public init(
            isInitialized: Bool = false,
            users: DataState<[User]> = .loading,
            userDetail: UserDetail.State? = nil,
            userDetailIsPresented: Bool = false
        ) {
            self.isInitialized = isInitialized
            self.users = users
            self.userDetail = userDetail
            self.userDetailIsPresented = userDetailIsPresented
        }
    }
}
