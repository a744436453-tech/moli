import Foundation

struct Pet: Codable, Equatable, Identifiable {
    let id: UUID
    var profile: PetProfile
}
