import Foundation

struct InteractionLog: Codable, Equatable, Identifiable {
    let id: UUID
    let petID: UUID
    let type: String
    let createdAt: Date
}
