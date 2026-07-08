import UIKit

final class PetProfileFormViewController: UIViewController {
    private let nameField = UITextField()
    private let speciesField = UITextField()
    private let statusControl = UISegmentedControl(items: ["在身边", "已离开"])
    private let resultLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "宠物档案"
        view.backgroundColor = .moliCreamWhite
        configureLayout()
    }

    private func configureLayout() {
        let titleLabel = UILabel()
        titleLabel.text = "先认识一下它"
        titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        titleLabel.textColor = UIColor.black.withAlphaComponent(0.82)

        let subtitleLabel = UILabel()
        subtitleLabel.text = "名字、物种和生命状态会影响后续数字形象和陪伴语气。"
        subtitleLabel.font = .systemFont(ofSize: 15, weight: .medium)
        subtitleLabel.textColor = UIColor.black.withAlphaComponent(0.52)
        subtitleLabel.numberOfLines = 0

        configureTextField(nameField, placeholder: "它叫什么名字？")
        configureTextField(speciesField, placeholder: "例如：猫、狗、兔子")
        statusControl.selectedSegmentIndex = 0

        let generateButton = GradientButton(title: "生成数字形象")
        generateButton.addTarget(self, action: #selector(generateProfile), for: .touchUpInside)

        resultLabel.font = .systemFont(ofSize: 14, weight: .medium)
        resultLabel.textColor = UIColor.black.withAlphaComponent(0.54)
        resultLabel.numberOfLines = 0

        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            subtitleLabel,
            nameField,
            speciesField,
            statusControl,
            generateButton,
            resultLabel
        ])
        stackView.axis = .vertical
        stackView.spacing = 16
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nameField.heightAnchor.constraint(equalToConstant: 50),
            speciesField.heightAnchor.constraint(equalToConstant: 50),
            generateButton.heightAnchor.constraint(equalToConstant: 54),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }

    private func configureTextField(_ textField: UITextField, placeholder: String) {
        textField.placeholder = placeholder
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 18
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 1))
        textField.leftViewMode = .always
    }

    @objc private func generateProfile() {
        HapticManager.shared.playSoftFeedback()
        let name = nameField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let displayName = name?.isEmpty == false ? name ?? "它" : "它"
        resultLabel.text = "\(displayName) 的数字形象已准备创建，下一步可以上传照片和补充性格。"
    }
}
