import Foundation

final class HomeViewModel {
    private(set) var greeting = "今天也想陪着你。"

    func updateGreeting(_ message: String) {
        greeting = message
    }
}
