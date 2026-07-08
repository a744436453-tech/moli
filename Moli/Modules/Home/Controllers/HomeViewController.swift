import UIKit

final class HomeViewController: UIViewController {
    private let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .moliCreamWhite
        Logger.info(viewModel.greeting)
    }
}
