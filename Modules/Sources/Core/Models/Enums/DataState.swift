public enum DataState<K> {
    case loading
    case loaded(K)
    case error(DVError)

    public var data: K? {
        switch self {
        case let .loaded(loadedData):
            return loadedData

        default:
            return nil
        }
    }
}

extension DataState: Equatable where K: Equatable {}
