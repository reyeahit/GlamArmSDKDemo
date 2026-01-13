# GlamArmSDKDemo

A Swift/iOS demo project for integrating and testing the **Glamarm Robot SDK** via **Swift Package Manager (SPM)** using a prebuilt **XCFramework**.

**Project folder:** `glamarmSDKTest/`

---

## 1. What’s Included

- SPM integration with `GlamarmRobotSDK.xcframework` (binary target)
- Basic usage demo (init / connect / simple commands — see demo code)
- Troubleshooting notes for common SPM/indexing issues

---

## 2. Requirements

- **Xcode:** Use a recent version (preferably the same major Xcode version used to build the SDK)
- **iOS:** 13.0+
- **Swift:** 5.7+

---

## 3. Getting Started

### 3.1 Clone

```bash
git clone https://github.com/reyeahit/GlamArmSDKDemo.git
cd GlamArmSDKDemo
```

### 3.2 Open the project

Open the Xcode project inside `glamarmSDKTest/` (use `.xcodeproj` / `.xcworkspace` depending on what’s included).

---

## 4. SPM Integration

### 4.1 Add Package in Xcode

1. In Xcode, go to **File → Add Packages…**
2. Paste your **SPM package repository URL** (the repo that contains `Package.swift`), for example:

```text
https://github.com/<your-org>/<your-spm-package-repo>.git
```

> **Note:** This must be the repository that contains `Package.swift`, **not** the `.xcframework.zip` URL.

3. Choose a version/tag
4. Add it to your app target

### 4.2 Add dependency in `Package.swift` (SwiftPM projects)

```swift
dependencies: [
  .package(url: "https://github.com/<your-org>/<your-spm-package-repo>.git", from: "1.0.7")
]
```

---

## 5. Usage Example

```swift
import GlamarmRobotSDK

// Example only — adjust to match the real SDK API
// let robot = GlamarmRobot()
// robot.connect(...)
// robot.moveTo(...)
```

---

## 6. Troubleshooting

### 6.1 Package updated but Xcode still uses the old one

This is usually caching.

1. Xcode → **File → Packages → Reset Package Caches**
2. Quit Xcode
3. Delete DerivedData:

```bash
rm -rf ~/Library/Developer/Xcode/DerivedData
```

4. Reopen Xcode and build again

### 6.2 Build succeeds but “Jump to Definition” / autocomplete doesn’t work

Binary XCFrameworks can have limited/unstable indexing when:

- Xcode caches are stale
- Dependencies aren’t resolved for the indexer
- Xcode/Swift version differs from the SDK build environment

Try the cache reset steps above first.

### 6.3 Error: “Failed to build module … for importation … textual interface …”

Usually related to indexing/import of `.swiftinterface` or dependency resolution.

Checklist:

- Reset Package Caches + delete DerivedData
- When releasing a new SDK zip, use a **new tag/version** (don’t reuse the same URL with different contents)
- Ensure the SDK supports the target platforms you enabled (iOS/macOS)

---

## 7. Project Structure

```text
GlamArmSDKDemo/
└── glamarmSDKTest/          # Demo project (Xcode)
    ├── ...                  # Xcode project files
    └── ...                  # demo source code
```

---

## 8. Versioning

- Demo code: tracked by this repo commits
- SDK version: controlled by the SPM version/tag you select (e.g. `1.0.7`)

---

## 9. License



---

## 10. Contact

For SDK access, integration support, or business inquiries:

- **Author:** Reyeah
- **GitHub:** `reyeahit`
