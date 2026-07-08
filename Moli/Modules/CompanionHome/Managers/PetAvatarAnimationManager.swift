import Foundation

final class PetAvatarAnimationManager {
    enum AnimationState {
        case idle
        case happy
        case sleeping
    }

    private(set) var currentState: AnimationState = .idle

    func transition(to state: AnimationState) {
        currentState = state
    }
}
