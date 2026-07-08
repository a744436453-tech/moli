import Foundation

struct ChatMessage: Codable, Equatable, Identifiable {
    let id: UUID
    let text: String
    let isFromUser: Bool
    let createdAt: Date
}
