import Foundation

final class StorageManager {
    static let shared = StorageManager()
    private let defaults = UserDefaults.standard

    private init() {}

    func set<T>(_ value: T, forKey key: String) {
        defaults.set(value, forKey: key)
    }

    func value<T>(forKey key: String) -> T? {
        defaults.object(forKey: key) as? T
    }
}
