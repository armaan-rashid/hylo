import Foundation

fileprivate let libraryRoot = URL(fileURLWithPath: #filePath).deletingLastPathComponent()

/// The root URL of Hylo's core library.
public let core = libraryRoot.appendingPathComponent("Hylo/Core")

/// The root URL of Hylo's standard library.
public let standardLibrary = libraryRoot.appendingPathComponent("Hylo")
