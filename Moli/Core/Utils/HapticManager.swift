import UIKit

final class HapticManager {
    static let shared = HapticManager()

    private init() {}

    func playSoftFeedback() {
        UIImpactFeedbackGenerator(style: .soft).impactOccurred()
    }
}
