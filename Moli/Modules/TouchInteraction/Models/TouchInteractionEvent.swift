import Foundation

struct TouchInteractionEvent: Codable, Equatable {
    let region: String
    let feedbackText: String
    let createdAt: Date
}
