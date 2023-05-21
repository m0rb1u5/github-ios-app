import Combine
import ComposableArchitecture
import Core
import Dispatch

public struct Entry: ReducerProtocol {
    public var mainQueue: AnySchedulerOf<DispatchQueue>

    public init(
        mainQueue: AnySchedulerOf<DispatchQueue> = DispatchQueue.main.eraseToAnyScheduler()
    ) {
        self.mainQueue = mainQueue
    }
}
