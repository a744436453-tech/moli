import Foundation

enum Logger {
    static func info(_ message: String) {
        print("[Moli][INFO] \(message)")
    }

    static func error(_ message: String) {
        print("[Moli][ERROR] \(message)")
    }
}
