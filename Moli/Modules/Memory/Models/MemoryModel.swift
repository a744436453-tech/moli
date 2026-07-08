import Foundation

struct MemoryModel: Codable, Equatable, Identifiable {
    let id: UUID
    let title: String
    let note: String
    let date: Date
}
