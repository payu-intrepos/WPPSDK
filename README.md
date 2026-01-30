# Swift Package Manager Integration Guide (iOS)

> A step-by-step guide for iOS developers (SDK consumers) to integrate an external SDK using Swift Package Manager (SPM).

## What You Will Achieve

By following this guide, you will be able to:

- Add an external SDK to your iOS project using SPM
- Lock the SDK to a specific version
- Import and use the SDK in your code
- Troubleshoot common SPM integration issues

## Prerequisites

- Xcode 12 or later (latest recommended)
- iOS deployment target supported by the SDK
- Access to the SDK Git repository
- A valid `Package.swift` at the repository root

## SDK Information

- **Repository URL:** https://github.com/payu-intrepos/WPPSDK
- **SDK Version:** `1.0.0-alpha.1`

## Option 1: Add via Xcode UI (Recommended)

1. Open your `.xcodeproj` or `.xcworkspace` in Xcode.
2. Navigate to **File → Add Package Dependencies**.
3. Paste the repository URL:
   ```
   https://github.com/payu-intrepos/WPPSDK
   ```
4. Select **Exact Version** and enter:
   ```
   1.0.0-alpha.1
   ```
5. Choose your app target and click **Add Package**.

## Option 2: Add via Package.swift (Advanced)

```swift
dependencies: [
    .package(
        url: "https://github.com/payu-intrepos/WPPSDK",
        exact: "1.0.0-alpha.1"
    )
]
```

```swift
targets: [
    .target(
        name: "YourAppTarget",
        dependencies: ["WPPSDK"]
    )
]
```

## Using the SDK

```swift
import WPPSDK
```

Refer to the SDK documentation for API usage details.

## Troubleshooting

- Ensure the version tag exists in the repository
- Confirm `Package.swift` is at the repo root
- Clean build folder and restart Xcode if needed

## Getting Help

Provide the SDK team with:
- Xcode version
- iOS version
- SDK version
- Error logs or screenshots
