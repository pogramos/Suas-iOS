// swift-tools-version:5.0
import PackageDescription

let package = Package(
  name: "Suas",
  platforms: [.macOS(.v10_10), .iOS(.v8), .tvOS(.v9), .watchOS(.v3)],
  products: [
    .library(name: "SuasIOS", targets: ["SuasIOS"])
  ],
  dependencies: [],
  targets: [
    .target(name: "SuasIOS", dependencies: [], path: "Sources"),
    .testTarget(name: "SuasIOSTests", dependencies: ["SuasIOS"], path: "Tests")
  ]
)
