import Foundation

struct MemoryEntry: Codable, Equatable, Identifiable {
    let id: UUID
    let title: String
    let note: String
    let date: Date
}
