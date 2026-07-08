import UIKit

final class SplashView: UIView {
    var onStartTapped: (() -> Void)?

    private let badgeView = UIView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let startButton = GradientButton(title: "开始陪伴")
    private let secondaryLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureHierarchy()
        configureLayout()
    }

    private func configureHierarchy() {
        backgroundColor = .moliCreamWhite

        badgeView.backgroundColor = .white
        badgeView.layer.cornerRadius = 44
        badgeView.layer.shadowColor = UIColor.moliSoftGreen.cgColor
        badgeView.layer.shadowOpacity = 0.18
        badgeView.layer.shadowRadius = 22
        badgeView.layer.shadowOffset = CGSize(width: 0, height: 14)

        let badgeLabel = UILabel()
        badgeLabel.text = "M"
        badgeLabel.font = .systemFont(ofSize: 44, weight: .heavy)
        badgeLabel.textColor = .moliSoftGreen
        badgeLabel.textAlignment = .center
        badgeView.addSubview(badgeLabel)
        badgeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            badgeLabel.centerXAnchor.constraint(equalTo: badgeView.centerXAnchor),
            badgeLabel.centerYAnchor.constraint(equalTo: badgeView.centerYAnchor)
        ])

        titleLabel.text = "Moli"
        titleLabel.font = .systemFont(ofSize: 40, weight: .bold)
        titleLabel.textColor = UIColor.black.withAlphaComponent(0.82)
        titleLabel.textAlignment = .center

        subtitleLabel.text = "把想念变成温柔的日常陪伴"
        subtitleLabel.font = .systemFont(ofSize: 17, weight: .medium)
        subtitleLabel.textColor = UIColor.black.withAlphaComponent(0.54)
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0

        startButton.addTarget(self, action: #selector(startTapped), for: .touchUpInside)

        secondaryLabel.text = "先从创建宠物数字形象开始"
        secondaryLabel.font = .systemFont(ofSize: 13, weight: .regular)
        secondaryLabel.textColor = UIColor.black.withAlphaComponent(0.42)
        secondaryLabel.textAlignment = .center

        let stackView = UIStackView(arrangedSubviews: [
            badgeView,
            titleLabel,
            subtitleLabel,
            startButton,
            secondaryLabel
        ])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 18
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            badgeView.widthAnchor.constraint(equalToConstant: 88),
            badgeView.heightAnchor.constraint(equalToConstant: 88),
            startButton.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 34),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -34),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    private func configureLayout() {
        let glowView = UIView()
        glowView.backgroundColor = UIColor.moliSoftGreen.withAlphaComponent(0.18)
        glowView.layer.cornerRadius = 120
        insertSubview(glowView, at: 0)
        glowView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            glowView.widthAnchor.constraint(equalToConstant: 240),
            glowView.heightAnchor.constraint(equalToConstant: 240),
            glowView.topAnchor.constraint(equalTo: topAnchor, constant: 90),
            glowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 82)
        ])
    }

    @objc private func startTapped() {
        onStartTapped?()
    }
}
