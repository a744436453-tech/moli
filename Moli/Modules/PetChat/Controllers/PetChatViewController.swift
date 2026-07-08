import UIKit

final class PetChatViewController: UIViewController {
    private let tableView = UITableView(frame: .zero, style: .plain)
    private let inputField = UITextField()
    private let sendButton = GradientButton(title: "发送")
    private let responseManager = PetChatResponseManager()

    private var messages: [PetChatMessage] = [
        PetChatMessage(id: UUID(), text: "今天也想陪着你。", isFromUser: false, createdAt: Date()),
        PetChatMessage(id: UUID(), text: "可以和我说说今天发生了什么。", isFromUser: false, createdAt: Date())
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .moliCreamWhite
        configureTableView()
        configureInputBar()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollToBottom(animated: false)
    }

    private func configureTableView() {
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.keyboardDismissMode = .interactive
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configureInputBar() {
        inputField.placeholder = "和 Moli 说句话"
        inputField.backgroundColor = .white
        inputField.layer.cornerRadius = 20
        inputField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 1))
        inputField.leftViewMode = .always
        inputField.returnKeyType = .send
        inputField.delegate = self

        sendButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        sendButton.addTarget(self, action: #selector(sendCurrentMessage), for: .touchUpInside)

        let inputStack = UIStackView(arrangedSubviews: [inputField, sendButton])
        inputStack.axis = .horizontal
        inputStack.spacing = 10
        inputStack.alignment = .center
        view.addSubview(inputStack)
        inputStack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            inputStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            inputStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            inputStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            inputField.heightAnchor.constraint(equalToConstant: 44),
            sendButton.widthAnchor.constraint(equalToConstant: 84),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: inputStack.topAnchor, constant: -12)
        ])
    }

    @objc private func sendCurrentMessage() {
        let trimmedText = inputField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        guard !trimmedText.isEmpty else { return }

        HapticManager.shared.playSoftFeedback()
        appendMessage(text: trimmedText, isFromUser: true)
        inputField.text = nil

        let response = responseManager.response(to: trimmedText)
        appendMessage(text: response, isFromUser: false)
    }

    private func appendMessage(text: String, isFromUser: Bool) {
        let message = PetChatMessage(id: UUID(), text: text, isFromUser: isFromUser, createdAt: Date())
        messages.append(message)
        tableView.insertRows(at: [IndexPath(row: messages.count - 1, section: 0)], with: .automatic)
        scrollToBottom(animated: true)
    }

    private func scrollToBottom(animated: Bool) {
        guard !messages.isEmpty else { return }
        tableView.scrollToRow(
            at: IndexPath(row: messages.count - 1, section: 0),
            at: .bottom,
            animated: animated
        )
    }
}

extension PetChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell")
            ?? UITableViewCell(style: .default, reuseIdentifier: "MessageCell")
        cell.textLabel?.text = message.text
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        cell.textLabel?.textColor = UIColor.black.withAlphaComponent(0.78)
        cell.textLabel?.textAlignment = message.isFromUser ? .right : .left
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
}

extension PetChatViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sendCurrentMessage()
        return true
    }
}
