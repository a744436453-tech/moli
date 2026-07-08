import UIKit

final class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        viewControllers = [
            makeTab(CompanionHomeViewController(), title: "陪伴", imageName: "pawprint.fill"),
            makeTab(PetChatViewController(), title: "说句话", imageName: "message.fill"),
            makeTab(MemoryTimelineViewController(), title: "回忆", imageName: "sparkles"),
            makeTab(ProfileViewController(), title: "我的", imageName: "person.fill")
        ]
    }

    private func configureAppearance() {
        tabBar.tintColor = .moliSoftGreen
        tabBar.unselectedItemTintColor = UIColor.gray.withAlphaComponent(0.72)
        tabBar.backgroundColor = UIColor.white.withAlphaComponent(0.94)

        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white.withAlphaComponent(0.94)
        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        }
    }

    private func makeTab(_ viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.prefersLargeTitles = true
        viewController.title = title
        navigationController.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(systemName: imageName),
            selectedImage: UIImage(systemName: imageName)
        )
        return navigationController
    }
}
