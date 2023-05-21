import ComposableArchitecture
import Core

public extension Users {
    struct State: Equatable {
        public var isInitialized: Bool
        public var users: DataState<[User]>
        public var userDetail: UserDetail.State?
        public var userDetailIsPresented: Bool
        public var searchKey: String
        public var searchedUsers: DataState<SearchResponse<User>>

        public init(
            isInitialized: Bool = false,
            users: DataState<[User]> = .loading,
            userDetail: UserDetail.State? = nil,
            userDetailIsPresented: Bool = false,
            searchKey: String = "",
            searchedUsers: DataState<SearchResponse<User>> = .loading
        ) {
            self.isInitialized = isInitialized
            self.users = users
            self.userDetail = userDetail
            self.userDetailIsPresented = userDetailIsPresented
            self.searchKey = searchKey
            self.searchedUsers = searchedUsers
        }
    }
}
