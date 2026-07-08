import UIKit

final class SplashViewController: UIViewController {
    private var splashView: SplashView {
        guard let splashView = view as? SplashView else {
            fatalError("SplashViewController requires SplashView")
        }
        return splashView
    }

    override func loadView() {
        view = SplashView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        splashView.onStartTapped = { [weak self] in
            self?.showMainInterface()
        }
    }

    private func showMainInterface() {
        HapticManager.shared.playSoftFeedback()
        let tabBarController = MainTabBarController()

        guard let window = view.window else {
            present(tabBarController, animated: true)
            return
        }

        UIView.transition(
            with: window,
            duration: 0.32,
            options: [.transitionCrossDissolve, .curveEaseInOut],
            animations: {
                window.rootViewController = tabBarController
            }
        )
    }
}
