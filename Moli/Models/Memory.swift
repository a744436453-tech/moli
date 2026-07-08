import Foundation

struct Memory: Codable, Equatable, Identifiable {
    let id: UUID
    let petID: UUID
    let title: String
    let createdAt: Date
}
