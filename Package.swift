// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let VERSION_CRASH_REPORTER: PackageDescription.Version = "4.0.3"

let package = Package(
    name: "WibmoPPKit",
    platforms: [
        .iOS(.v15)
    ],
    
    products: [
        .library(
            name: "WPPKit",
            targets: ["WPPKitTarget"]
        ),
    ],
    
    dependencies: [
        .package(url: "https://github.com/payu-intrepos/PayUCrashReporter-iOS.git", from: VERSION_CRASH_REPORTER),
    ],
    
    targets: [
        .binaryTarget(name: "WPPSDK", path: "./Frameworks/WPPSDK.xcframework"),
        .binaryTarget(name: "MeaPushProvisioning", path: "./Frameworks/MeaPushProvisioning.xcframework"),
        .target(
            name: "WPPKitTarget",
            dependencies: [
                "MeaPushProvisioning",
                .product(name: "PayUIndia-CrashReporter", package: "PayUCrashReporter-iOS"),
            ],
            path: "Wrappers/WPPKitWrapper",
        )
    ]
)
