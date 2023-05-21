// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Modules",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Modules",
            targets: [
                "Core",
                "Network",
                "Users-Repository",
                "Users-Repository-Live",
                "Repos-Repository",
                "Repos-Repository-Live",
                "Orgs-Repository",
                "Orgs-Repository-Live",
                "CoreUI",
                "Entry",
                "Logged",
                "Unlogged"
            ]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture",
            exact: Version(0, 52, 0)
        ),
        .package(
            url: "https://github.com/Moya/Moya.git",
            exact: Version(15, 0, 3)
        ),
        .package(
            url: "https://github.com/SFSafeSymbols/SFSafeSymbols.git",
            exact: Version(4, 1, 1)
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Core",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "SFSafeSymbols", package: "SFSafeSymbols")
            ],
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "CoreTests",
            dependencies: [
                "Core"
            ]
        ),

        .target(
            name: "Network",
            dependencies: [
                .product(name: "ReactiveMoya", package: "Moya"),
                "Core"
            ],
            resources: [
                .process("Stubs")
            ]
        ),
        .testTarget(
            name: "NetworkTests",
            dependencies: [
                "Network"
            ]
        ),

        .target(
            name: "Users-Repository",
            dependencies: [
                "Core"
            ]
        ),
        .testTarget(
            name: "Users-RepositoryTests",
            dependencies: [
                "Users-Repository"
            ]
        ),

        .target(
            name: "Users-Repository-Live",
            dependencies: [
                "Network",
                "Users-Repository"
            ]
        ),
        .testTarget(
            name: "Users-Repository-LiveTests",
            dependencies: [
                "Users-Repository-Live"
            ]
        ),

        .target(
            name: "Repos-Repository",
            dependencies: [
                "Core"
            ]
        ),
        .testTarget(
            name: "Repos-RepositoryTests",
            dependencies: [
                "Repos-Repository"
            ]
        ),

        .target(
            name: "Repos-Repository-Live",
            dependencies: [
                "Network",
                "Repos-Repository"
            ]
        ),
        .testTarget(
            name: "Repos-Repository-LiveTests",
            dependencies: [
                "Repos-Repository-Live"
            ]
        ),

        .target(
            name: "Orgs-Repository",
            dependencies: [
                "Core"
            ]
        ),
        .testTarget(
            name: "Orgs-RepositoryTests",
            dependencies: [
                "Orgs-Repository"
            ]
        ),

        .target(
            name: "Orgs-Repository-Live",
            dependencies: [
                "Network",
                "Orgs-Repository"
            ]
        ),
        .testTarget(
            name: "Orgs-Repository-LiveTests",
            dependencies: [
                "Orgs-Repository-Live"
            ]
        ),

        .target(
            name: "CoreUI",
            dependencies: [
                "Core"
            ]
        ),
        .testTarget(
            name: "CoreUITests",
            dependencies: [
                "CoreUI"
            ]
        ),

        .target(
            name: "Entry",
            dependencies: [
                "Logged",
                "Unlogged",
                "Network"
            ]
        ),
        .testTarget(
            name: "EntryTests",
            dependencies: [
                "Entry"
            ]
        ),

        .target(
            name: "Unlogged",
            dependencies: [
                "CoreUI"
            ]
        ),
        .testTarget(
            name: "UnloggedTests",
            dependencies: [
                "Unlogged"
            ]
        ),

        .target(
            name: "Logged",
            dependencies: [
                "CoreUI",
                "Users-Repository-Live",
                "Repos-Repository-Live",
                "Orgs-Repository-Live",
            ]
        ),
        .testTarget(
            name: "LoggedTests",
            dependencies: [
                "Logged"
            ]
        ),
    ]
)
