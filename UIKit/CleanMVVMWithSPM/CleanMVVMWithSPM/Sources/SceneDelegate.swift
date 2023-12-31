//
//  SceneDelegate.swift
//  CleanMVVMWithSPM
//
//  Created by gnksbm on 2023/12/22.
//

import UIKit

import Core
import Presentation
import Domain
import Data
import Network

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene)
        else { return }
        window = UIWindow(windowScene: windowScene)
        
        let navigationController = UINavigationController()
        let appCoordinator = AppCoordinator(
            navigationController: navigationController
        )
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        appCoordinator.start()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

#if DEBUG
import SwiftUI

import Presentation

struct SceneDelegatePreview: PreviewProvider {
    
    static var previews: some View {
        UIKitPreview {
            SearchLocationVC(
                viewModel: SearchlocationViewModel(
                    useCase: UseCaseContainer.resolve(
                        type: SearchLocationUseCase.self
                    ),
                    coordinator: DefaultSearchLocationCoordinator(navigationController: .init())
                )
            )
        }
    }
}
#endif
