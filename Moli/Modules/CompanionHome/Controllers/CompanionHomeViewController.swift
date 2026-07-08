import UIKit

final class CompanionHomeViewController: UIViewController {
    private let viewModel = CompanionHomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .moliCreamWhite
        Logger.info(viewModel.greeting)
    }
}
