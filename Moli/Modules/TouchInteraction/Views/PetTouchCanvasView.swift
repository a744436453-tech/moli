import UIKit

final class PetTouchCanvasView: UIView {
    var onTouchPointChanged: ((CGPoint) -> Void)?
    private(set) var normalizedTouchPoints: [CGPoint] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }

    private func configureView() {
        backgroundColor = UIColor.moliSoftGreen.withAlphaComponent(0.12)
        layer.cornerRadius = 24
        isMultipleTouchEnabled = false
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        record(touches)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        record(touches)
    }

    override func draw(_ rect: CGRect) {
        UIColor.moliMilkYellow.withAlphaComponent(0.8).setFill()
        normalizedTouchPoints.suffix(8).forEach { point in
            let center = CGPoint(x: point.x * bounds.width, y: point.y * bounds.height)
            UIBezierPath(
                ovalIn: CGRect(x: center.x - 8, y: center.y - 8, width: 16, height: 16)
            ).fill()
        }
    }

    private func record(_ touches: Set<UITouch>) {
        guard let touch = touches.first, bounds.width > 0, bounds.height > 0 else { return }
        let point = touch.location(in: self)
        let normalizedPoint = CGPoint(
            x: min(max(point.x / bounds.width, 0), 1),
            y: min(max(point.y / bounds.height, 0), 1)
        )
        normalizedTouchPoints.append(normalizedPoint)
        onTouchPointChanged?(normalizedPoint)
        setNeedsDisplay()
    }
}
