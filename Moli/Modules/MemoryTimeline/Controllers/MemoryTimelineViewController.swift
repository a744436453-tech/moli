import UIKit

final class MemoryTimelineViewController: UIViewController {
    private let tableView = UITableView(frame: .zero, style: .plain)
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter
    }()

    private var memories: [MemoryEntry] = [
        MemoryEntry(id: UUID(), title: "第一次见面", note: "它小心翼翼地靠近，然后把头放在掌心里。", date: Date()),
        MemoryEntry(id: UUID(), title: "最喜欢的午后", note: "阳光落在沙发上，它睡得很香。", date: Date()),
        MemoryEntry(id: UUID(), title: "今天的陪伴", note: "生成了第一条 Moli 回忆时间线。", date: Date())
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .moliCreamWhite
        configureHeader()
        configureTableView()
    }

    private func configureHeader() {
        let petInfoCard = UIView()
        petInfoCard.backgroundColor = UIColor.white.withAlphaComponent(0.82)
        petInfoCard.layer.cornerRadius = 24

        let titleLabel = UILabel()
        titleLabel.text = "Moli 的回忆"
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.textColor = UIColor.black.withAlphaComponent(0.82)

        let subtitleLabel = UILabel()
        subtitleLabel.text = "记录重要时刻，也允许想念慢慢安放。"
        subtitleLabel.font = .systemFont(ofSize: 15, weight: .medium)
        subtitleLabel.textColor = UIColor.black.withAlphaComponent(0.52)
        subtitleLabel.numberOfLines = 0

        let addButton = GradientButton(title: "新增回忆")
        addButton.addTarget(self, action: #selector(addMemory), for: .touchUpInside)

        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel, addButton])
        stackView.axis = .vertical
        stackView.spacing = 12
        petInfoCard.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(petInfoCard)
        petInfoCard.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            petInfoCard.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 18),
            petInfoCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            petInfoCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            stackView.topAnchor.constraint(equalTo: petInfoCard.topAnchor, constant: 18),
            stackView.leadingAnchor.constraint(equalTo: petInfoCard.leadingAnchor, constant: 18),
            stackView.trailingAnchor.constraint(equalTo: petInfoCard.trailingAnchor, constant: -18),
            stackView.bottomAnchor.constraint(equalTo: petInfoCard.bottomAnchor, constant: -18)
        ])
    }

    private func configureTableView() {
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        guard let headerView = view.subviews.first else { return }
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 18),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    @objc private func addMemory() {
        HapticManager.shared.playSoftFeedback()
        memories.insert(
            MemoryEntry(
                id: UUID(),
                title: "新的温柔片段",
                note: "你刚刚为 Moli 留下了一条新的回忆。",
                date: Date()
            ),
            at: 0
        )
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
}

extension MemoryTimelineViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        memories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let memory = memories[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoryCell")
            ?? UITableViewCell(style: .subtitle, reuseIdentifier: "MemoryCell")
        cell.textLabel?.text = "\(dateFormatter.string(from: memory.date))  \(memory.title)"
        cell.textLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        cell.textLabel?.textColor = UIColor.black.withAlphaComponent(0.78)
        cell.detailTextLabel?.text = memory.note
        cell.detailTextLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        cell.detailTextLabel?.textColor = UIColor.black.withAlphaComponent(0.54)
        cell.detailTextLabel?.numberOfLines = 0
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
}
