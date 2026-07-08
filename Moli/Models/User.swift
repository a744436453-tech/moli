import Foundation

struct User: Codable, Equatable, Identifiable {
    let id: UUID
    var nickname: String
}
