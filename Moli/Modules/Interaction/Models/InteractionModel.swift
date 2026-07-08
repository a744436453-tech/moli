import Foundation

struct InteractionModel: Codable, Equatable {
    let region: String
    let feedbackText: String
    let createdAt: Date
}
