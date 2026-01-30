// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let VERSION_CRASH_REPORTER: PackageDescription.Version = "4.0.3"

let package = Package(
    name: "WPPSDK",
    platforms: [
        .iOS(.v15)
    ],
    
    products: [
        .library(
            name: "Wibmo-PPKit",
            targets: ["WPPSDKTarget"]
        ),
    ],
    
    dependencies: [
        .package(url: "https://github.com/payu-intrepos/PayUCrashReporter-iOS.git", from: VERSION_CRASH_REPORTER),
    ],
    
    targets: [
        .binaryTarget(name: "WPPSDK", path: "./Frameworks/WPPSDK.xcframework"),
        .binaryTarget(name: "MeaPushProvisioning", path: "./Frameworks/MeaPushProvisioning.xcframework"),
        .target(
            name: "WPPSDKTarget",
            dependencies: [
                "WPPSDK",
                "MeaPushProvisioning",
                .product(name: "PayUIndia-CrashReporter", package: "PayUCrashReporter-iOS"),
            ],
            path: "Wrappers/WPPKitWrapper",
        )
    ]
)
