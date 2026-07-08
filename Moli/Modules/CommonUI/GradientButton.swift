import UIKit

final class GradientButton: UIButton {
    enum Style {
        case primary
        case secondary
    }

    private let gradientLayer = CAGradientLayer()
    private var buttonStyle: Style = .primary

    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.14) {
                self.transform = self.isHighlighted ? CGAffineTransform(scaleX: 0.97, y: 0.97) : .identity
                self.alpha = self.isHighlighted ? 0.86 : 1.0
            }
        }
    }

    init(title: String? = nil, style: Style = .primary) {
        super.init(frame: .zero)
        configure(title: title, style: style)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure(title: title(for: .normal), style: .primary)
    }

    func configure(title: String?, style: Style = .primary) {
        buttonStyle = style
        setTitle(title, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        layer.cornerRadius = 22
        layer.masksToBounds = true
        contentEdgeInsets = UIEdgeInsets(top: 14, left: 22, bottom: 14, right: 22)

        switch style {
        case .primary:
            gradientLayer.colors = [
                UIColor.moliSoftGreen.cgColor,
                UIColor.moliMilkYellow.cgColor
            ]
            gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
            if gradientLayer.superlayer == nil {
                layer.insertSublayer(gradientLayer, at: 0)
            }
            backgroundColor = .clear
            setTitleColor(.white, for: .normal)
            layer.borderWidth = 0
        case .secondary:
            gradientLayer.removeFromSuperlayer()
            backgroundColor = UIColor.white.withAlphaComponent(0.74)
            setTitleColor(.moliSoftGreen, for: .normal)
            layer.borderWidth = 1
            layer.borderColor = UIColor.moliSoftGreen.withAlphaComponent(0.28).cgColor
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = layer.cornerRadius
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: max(size.width, 128), height: max(size.height, 52))
    }
}
