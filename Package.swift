// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "ApolloGateway",
  platforms: [
    .iOS(.v12),
    .macOS(.v10_14),
    .tvOS(.v12),
    .watchOS(.v5)
  ],
  products: [
    .library(
      name: "ApolloGateway",
      targets: ["ApolloGateway"]),
    .library(
      name: "ApolloGatewayAPI",
      targets: ["ApolloGatewayAPI"]),
    .library(
      name: "ApolloGatewayUtils",
      targets: ["ApolloGatewayUtils"]),
    .library(
      name: "ApolloGateway-Dynamic",
      type: .dynamic,
      targets: ["ApolloGateway"]),
    .library(
      name: "ApolloGatewayCodegenLib",
      targets: ["ApolloGatewayCodegenLib"]),
    .library(
      name: "ApolloGatewaySQLite",
      targets: ["ApolloGatewaySQLite"]),
    .library(
      name: "ApolloGatewayWebSocket",
      targets: ["ApolloGatewayWebSocket"]),
  ],
  dependencies: [
    .package(
      url: "https://github.com/stephencelis/SQLite.swift.git",
      .upToNextMinor(from: "0.13.1"))
  ],
  targets: [
    .target(
      name: "ApolloGateway",
      dependencies: [
        "ApolloGatewayAPI",
        "ApolloGatewayUtils"
      ],
      path: "Sources/Apollo",
      exclude: [
        "Info.plist"
      ]),
    .target(
      name: "ApolloGatewayAPI",
      dependencies: [],
      path: "Sources/ApolloAPI",
      exclude: [
        "Info.plist",
        "CodegenV1"
      ]),
    .target(
      name: "ApolloGatewayUtils",
      dependencies: [],
      path: "Sources/ApolloUtils",
      exclude: [
        "Info.plist"
      ]),
    .target(
      name: "ApolloGatewayCodegenLib",
      dependencies: [
        "ApolloGatewayUtils",
      ],
      path: "Sources/ApolloCodegenLib",
      exclude: [
        "Info.plist",
        "Frontend/JavaScript",
      ],
      resources: [
        .copy("Frontend/dist/ApolloCodegenFrontend.bundle.js"),
        .copy("Frontend/dist/ApolloCodegenFrontend.bundle.js.map")
      ]),
    .target(
      name: "ApolloGatewaySQLite",
      dependencies: [
        "ApolloGateway",
        .product(name: "SQLite", package: "SQLite.swift"),
      ],
      path: "Sources/ApolloSQLite",
      exclude: [
        "Info.plist"
      ]),
    .target(
      name: "ApolloGatewayWebSocket",
      dependencies: [
        "ApolloGateway",
        "ApolloGatewayUtils"
      ],
      path: "Sources/ApolloWebSocket",
      exclude: [
        "Info.plist"
      ])
  ]
)
