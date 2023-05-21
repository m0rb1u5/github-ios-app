import Combine
import Core
import Foundation
import Moya
import os.log

public extension MoyaManager {
    private static func provider<Endpoint>(
        plugins: [PluginType] = []
    ) -> MoyaProvider<Endpoint> where Endpoint: TargetType {
        .init(
            stubClosure: ProcessInfo.isTest ? MoyaProvider.immediatelyStub : MoyaProvider.neverStub,
            session: session,
            plugins: plugins
        )
    }

    static var usersProvider: MoyaProvider<UsersEndpoint> {
        provider(plugins: createPlugins())
    }

    static var reposProvider: MoyaProvider<ReposEndpoint> {
        provider(plugins: createPlugins())
    }

    static var orgsProvider: MoyaProvider<OrgsEndpoint> {
        provider(plugins: createPlugins())
    }

    private static func createPlugins() -> [PluginType] {
        var plugins: [PluginType] = []
        #if DEBUG
        let networkLogger: PluginType = NetworkLoggerPlugin(
            configuration: .init(
                output: { _, items in
                    for item in items {
                        Logger(subsystem: "Network", category: "Service").info("\(item)")
                    }
                },
                logOptions: .verbose
            )
        )
        plugins.append(networkLogger)
        #endif
        return plugins
    }
}
