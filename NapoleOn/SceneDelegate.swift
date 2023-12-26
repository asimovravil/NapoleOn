//
//  SceneDelegate.swift
//  NapoleOn
//
//  Created by Ravil on 23.12.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var navigation: UINavigationController!
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        window?.overrideUserInterfaceStyle = .dark
        window?.rootViewController = KakakakaViewController()
        window?.makeKeyAndVisible()
    
        BouterViewController.shared.request { [weak self] url in
            if let url = url {
                self?.window?.rootViewController = WKNavigationBouter(url: url)
            } else {
                if !BouterAppStore.isOnboardingShowed {
                    self?.navigation = UINavigationController(
                        rootViewController: TrainingViewController()
                    )
                }
                self?.window?.rootViewController = self?.navigation
            }
        }
    }
}

