import SwiftUI

struct NavigationBarAppearanceConfig {
    var backgroundColor: UIColor
    var titleColor: UIColor
    var titleFont: UIFont

    func makeAppearance() -> UINavigationBarAppearance {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = backgroundColor

        let attrs: [NSAttributedString.Key: Any] = [
            .foregroundColor: titleColor,
            .font: titleFont
        ]
        appearance.largeTitleTextAttributes = attrs
        appearance.titleTextAttributes = attrs
        return appearance
    }

    func apply(to navigationController: UINavigationController) {
        let appearance = makeAppearance()
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = appearance
        navigationController.navigationBar.compactAppearance = appearance
        navigationController.navigationBar.prefersLargeTitles = true
    }
}

extension NavigationBarAppearanceConfig {
    static let goldAndBlack = NavigationBarAppearanceConfig(
        backgroundColor: .black,
        titleColor: .metallicGold,
        titleFont: .monospacedSystemFont(ofSize: 36, weight: .regular)
    )
}

private struct NavigationConfigurator: UIViewControllerRepresentable {
    let config: NavigationBarAppearanceConfig

    func makeUIViewController(context: Context) -> UIViewController {
        UIViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        DispatchQueue.main.async {
            if let nav = uiViewController.navigationController {
                config.apply(to: nav)
            }
        }
    }
}

extension View {
    func navigationBarStyle(_ config: NavigationBarAppearanceConfig) -> some View {
        self.background(NavigationConfigurator(config: config))
    }
}
