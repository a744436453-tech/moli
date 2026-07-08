import UIKit

final class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .moliCreamWhite
        configureLayout()
    }

    private func configureLayout() {
        let avatarView = UIView()
        avatarView.backgroundColor = .moliSoftGreen
        avatarView.layer.cornerRadius = 34

        let titleLabel = UILabel()
        titleLabel.text = "我的 Moli"
        titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        titleLabel.textColor = UIColor.black.withAlphaComponent(0.82)

        let subtitleLabel = UILabel()
        subtitleLabel.text = "管理宠物档案、素材、隐私和纪念内容。"
        subtitleLabel.font = .systemFont(ofSize: 15, weight: .medium)
        subtitleLabel.textColor = UIColor.black.withAlphaComponent(0.52)
        subtitleLabel.numberOfLines = 0

        let headerStack = UIStackView(arrangedSubviews: [avatarView, titleLabel, subtitleLabel])
        headerStack.axis = .vertical
        headerStack.alignment = .leading
        headerStack.spacing = 12

        let profileButton = makeSettingButton(title: "创建宠物档案", action: #selector(openPetProfile))
        let privacyButton = makeSettingButton(title: "隐私与数据导出", action: #selector(showPlaceholder))
        let memoryBookButton = makeSettingButton(title: "生成纪念册", action: #selector(showPlaceholder))

        let stackView = UIStackView(arrangedSubviews: [headerStack, profileButton, privacyButton, memoryBookButton])
        stackView.axis = .vertical
        stackView.spacing = 14
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            avatarView.widthAnchor.constraint(equalToConstant: 68),
            avatarView.heightAnchor.constraint(equalToConstant: 68),
            profileButton.heightAnchor.constraint(equalToConstant: 56),
            privacyButton.heightAnchor.constraint(equalToConstant: 56),
            memoryBookButton.heightAnchor.constraint(equalToConstant: 56),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }

    private func makeSettingButton(title: String, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor(UIColor.black.withAlphaComponent(0.76), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 18
        button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 18, bottom: 12, right: 18)
        button.contentHorizontalAlignment = .leading
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }

    @objc private func openPetProfile() {
        navigationController?.pushViewController(PetProfileFormViewController(), animated: true)
    }

    @objc private func showPlaceholder() {
        HapticManager.shared.playSoftFeedback()
    }
}
