import Foundation

struct PetProfile: Codable, Equatable {
    enum LifeStatus: String, Codable {
        case living
        case departed
    }

    var name: String
    var species: String
    var birthday: Date?
    var lifeStatus: LifeStatus
    var photoURL: URL?
}
