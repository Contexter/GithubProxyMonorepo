// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "GithubProxyMonorepo",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .library(name: "Actions", targets: ["Actions"]),
        .library(name: "Branches", targets: ["Branches"]),
        .library(name: "Commits", targets: ["Commits"]),
        .library(name: "Issues", targets: ["Issues"]),
        .library(name: "Labels", targets: ["Labels"]),
        .library(name: "Milestones", targets: ["Milestones"]),
        .library(name: "RepoCM", targets: ["RepoCM"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        .package(url: "https://github.com/apple/swift-openapi-generator.git", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-openapi-runtime.git", from: "0.1.3")
    ],
    targets: [
        .target(
            name: "Actions",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime")
            ],
            path: "Sources/Actions",
            resources: [
                .copy("Actions.yaml") // Declare the YAML as a resource
            ]
        ),
        .target(
            name: "Branches",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime")
            ],
            path: "Sources/Branches",
            resources: [
                .copy("Branches.yaml") // Declare the YAML as a resource
            ]
        ),
        .target(
            name: "Commits",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime")
            ],
            path: "Sources/Commits",
            resources: [
                .copy("Commits.yaml") // Declare the YAML as a resource
            ]
        ),
        .target(
            name: "Issues",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime")
            ],
            path: "Sources/Issues",
            resources: [
                .copy("Issues.yaml") // Declare the YAML as a resource
            ]
        ),
        .target(
            name: "Labels",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime")
            ],
            path: "Sources/Labels",
            resources: [
                .copy("Labels.yaml") // Declare the YAML as a resource
            ]
        ),
        .target(
            name: "Milestones",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime")
            ],
            path: "Sources/Milestones",
            resources: [
                .copy("Milestones.yaml") // Declare the YAML as a resource
            ]
        ),
        .target(
            name: "RepoCM",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime")
            ],
            path: "Sources/RepoCM",
            resources: [
                .copy("RepoCM.yaml") // Declare the YAML as a resource
            ]
        ),
        .testTarget(
            name: "ActionsTests",
            dependencies: ["Actions"],
            path: "Tests/ActionsTests"
        ),
        .testTarget(
            name: "BranchesTests",
            dependencies: ["Branches"],
            path: "Tests/BranchesTests"
        ),
        .testTarget(
            name: "CommitsTests",
            dependencies: ["Commits"],
            path: "Tests/CommitsTests"
        ),
        .testTarget(
            name: "IssuesTests",
            dependencies: ["Issues"],
            path: "Tests/IssuesTests"
        ),
        .testTarget(
            name: "LabelsTests",
            dependencies: ["Labels"],
            path: "Tests/LabelsTests"
        ),
        .testTarget(
            name: "MilestonesTests",
            dependencies: ["Milestones"],
            path: "Tests/MilestonesTests"
        ),
        .testTarget(
            name: "RepoCMTests",
            dependencies: ["RepoCM"],
            path: "Tests/RepoCMTests"
        )
    ]
)
