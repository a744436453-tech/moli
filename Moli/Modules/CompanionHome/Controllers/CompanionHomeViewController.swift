import UIKit

final class CompanionHomeViewController: UIViewController {
    private let viewModel = CompanionHomeViewModel()
    private let greetingLabel = UILabel()
    private let moodLabel = UILabel()
    private let petAvatarView = UIView()
    private let ballView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .moliCreamWhite
        configureLayout()
        updateState(message: viewModel.greeting, mood: "心情很好，想陪你待一会儿。")
    }

    private func configureLayout() {
        let scrollView = UIScrollView()
        let contentStack = UIStackView()
        contentStack.axis = .vertical
        contentStack.spacing = 22
        contentStack.alignment = .fill

        view.addSubview(scrollView)
        scrollView.addSubview(contentStack)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentStack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentStack.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 24),
            contentStack.leadingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leadingAnchor, constant: 24),
            contentStack.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor, constant: -24),
            contentStack.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -32)
        ])

        let heroCard = makeHeroCard()
        let actions = makeActionGrid()
        let hintCard = makeHintCard()

        contentStack.addArrangedSubview(heroCard)
        contentStack.addArrangedSubview(actions)
        contentStack.addArrangedSubview(hintCard)
    }

    private func makeHeroCard() -> UIView {
        let cardView = UIView()
        cardView.backgroundColor = UIColor.white.withAlphaComponent(0.78)
        cardView.layer.cornerRadius = 28
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOpacity = 0.08
        cardView.layer.shadowRadius = 24
        cardView.layer.shadowOffset = CGSize(width: 0, height: 16)

        petAvatarView.backgroundColor = .moliMilkYellow
        petAvatarView.layer.cornerRadius = 80
        petAvatarView.layer.borderColor = UIColor.white.cgColor
        petAvatarView.layer.borderWidth = 8

        let faceLabel = UILabel()
        faceLabel.text = "• ᴥ •"
        faceLabel.font = .systemFont(ofSize: 34, weight: .bold)
        faceLabel.textAlignment = .center
        faceLabel.textColor = UIColor.black.withAlphaComponent(0.68)
        petAvatarView.addSubview(faceLabel)
        faceLabel.translatesAutoresizingMaskIntoConstraints = false

        greetingLabel.font = .systemFont(ofSize: 24, weight: .bold)
        greetingLabel.textColor = UIColor.black.withAlphaComponent(0.82)
        greetingLabel.textAlignment = .center
        greetingLabel.numberOfLines = 0

        moodLabel.font = .systemFont(ofSize: 15, weight: .medium)
        moodLabel.textColor = UIColor.black.withAlphaComponent(0.52)
        moodLabel.textAlignment = .center
        moodLabel.numberOfLines = 0

        let stackView = UIStackView(arrangedSubviews: [petAvatarView, greetingLabel, moodLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 18
        cardView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            petAvatarView.widthAnchor.constraint(equalToConstant: 160),
            petAvatarView.heightAnchor.constraint(equalToConstant: 160),
            faceLabel.centerXAnchor.constraint(equalTo: petAvatarView.centerXAnchor),
            faceLabel.centerYAnchor.constraint(equalTo: petAvatarView.centerYAnchor),
            stackView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 28),
            stackView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -24),
            stackView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -28)
        ])

        return cardView
    }

    private func makeActionGrid() -> UIView {
        let feedButton = makeActionButton(title: "投喂", subtitle: "给它一点小零食")
        feedButton.addTarget(self, action: #selector(feedPet), for: .touchUpInside)

        let playButton = makeActionButton(title: "玩球", subtitle: "陪它跑一小会儿")
        playButton.addTarget(self, action: #selector(playBall), for: .touchUpInside)

        let touchButton = makeActionButton(title: "摸摸", subtitle: "轻轻安抚一下")
        touchButton.addTarget(self, action: #selector(touchPet), for: .touchUpInside)

        let chatButton = makeActionButton(title: "说句话", subtitle: "打开聊天陪伴")
        chatButton.addTarget(self, action: #selector(openChat), for: .touchUpInside)

        let stackView = UIStackView(arrangedSubviews: [feedButton, playButton, touchButton, chatButton])
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
    }

    private func makeActionButton(title: String, subtitle: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("\(title)\n\(subtitle)", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.setTitleColor(UIColor.black.withAlphaComponent(0.78), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 18
        button.contentEdgeInsets = UIEdgeInsets(top: 14, left: 18, bottom: 14, right: 18)
        button.contentHorizontalAlignment = .leading
        return button
    }

    private func makeHintCard() -> UIView {
        let cardView = UIView()
        cardView.backgroundColor = UIColor.moliSoftGreen.withAlphaComponent(0.16)
        cardView.layer.cornerRadius = 22

        ballView.backgroundColor = .moliMilkYellow
        ballView.layer.cornerRadius = 18

        let label = UILabel()
        label.text = "今天可以试试玩球互动，Moli 会根据你的选择更新状态。"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = UIColor.black.withAlphaComponent(0.58)
        label.numberOfLines = 0

        let stackView = UIStackView(arrangedSubviews: [ballView, label])
        stackView.axis = .horizontal
        stackView.spacing = 14
        stackView.alignment = .center
        cardView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            ballView.widthAnchor.constraint(equalToConstant: 36),
            ballView.heightAnchor.constraint(equalToConstant: 36),
            stackView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 18),
            stackView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -18),
            stackView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16)
        ])

        return cardView
    }

    private func updateState(message: String, mood: String) {
        greetingLabel.text = message
        moodLabel.text = mood
    }

    @objc private func feedPet() {
        HapticManager.shared.playSoftFeedback()
        viewModel.updateGreeting("谢谢你，我把小零食收好啦。")
        updateState(message: viewModel.greeting, mood: "亲密度 +1，尾巴摇得更快了。")
        pulse(petAvatarView)
    }

    @objc private func playBall() {
        HapticManager.shared.playSoftFeedback()
        viewModel.updateGreeting("球滚出去啦，我追上它了。")
        updateState(message: viewModel.greeting, mood: "活力满满，想再玩一次。")
        pulse(ballView)
    }

    @objc private func touchPet() {
        HapticManager.shared.playSoftFeedback()
        viewModel.updateGreeting("摸摸头的时候，好像又安心了一点。")
        updateState(message: viewModel.greeting, mood: "安静地靠近你。")
        pulse(petAvatarView)
    }

    @objc private func openChat() {
        tabBarController?.selectedIndex = 1
    }

    private func pulse(_ targetView: UIView) {
        UIView.animate(
            withDuration: 0.18,
            animations: {
                targetView.transform = CGAffineTransform(scaleX: 1.08, y: 1.08)
            },
            completion: { _ in
                UIView.animate(withDuration: 0.22) {
                    targetView.transform = .identity
                }
            }
        )
    }
}
