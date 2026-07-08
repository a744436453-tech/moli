import CoreGraphics

final class PetTouchRegionResolver {
    func region(for point: CGPoint) -> String {
        point.y < 0.5 ? "head" : "body"
    }
}
