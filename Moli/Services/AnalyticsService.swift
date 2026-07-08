import Foundation

final class AnalyticsService {
    func track(event: String) {
        Logger.info("Analytics event: \(event)")
    }
}
