import Foundation

final class ImageGenerationService {
    func generateImage(for profile: PetProfile) async throws -> Data {
        try await APIClient.shared.request(endpoint: .generatePetImage)
    }
}
