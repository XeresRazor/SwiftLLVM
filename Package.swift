// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftLLVM",
    platforms: [
        .macOS(.v13),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SwiftLLVM",
            targets: ["SwiftLLVM"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .systemLibrary(
            name: "cllvm",
            pkgConfig: "cllvm",
            providers: [
                .brew(["llvm@15"])
            ]),
        .target(
            name: "SwiftLLVM",
            dependencies: ["cllvm"]),
        .testTarget(
            name: "SwiftLLVMTests",
            dependencies: ["SwiftLLVM"]),
    ]
)
