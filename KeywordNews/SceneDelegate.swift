//
//  SceneDelegate.swift
//  KeywordNews
//
//  Created by terry on 2023/09/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene,
			   willConnectTo session: UISceneSession,
			   options connectionOptions: UIScene.ConnectionOptions) {
		guard let scene = (scene as? UIWindowScene) else { return }

		window = UIWindow(windowScene: scene)

		let layout = UICollectionViewFlowLayout()
		window?.rootViewController = UINavigationController(rootViewController: NewsListViewController(collectionViewLayout: layout))
		window?.backgroundColor = .systemBackground
		window?.makeKeyAndVisible()
	}
}
