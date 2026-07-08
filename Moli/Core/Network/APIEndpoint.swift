import Foundation

enum APIEndpoint {
    case generatePetImage
    case chat

    var path: String {
        switch self {
        case .generatePetImage:
            return "/pet/generate"
        case .chat:
            return "/chat"
        }
    }
}
