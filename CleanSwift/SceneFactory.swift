//
//  SceneFactory.swift
//  CleanSwift
//
//  Created by Natali Malich on 04.07.2022.
//

import UIKit

protocol SceneFactory {
    func makeScene() -> UIViewController
}

final class LoginSceneFactory: SceneFactory {
    var configurator: LoginSceneConfigurator!
    
    func makeScene() -> UIViewController {
        let loginViewController = LoginSceneViewController()
        return configurator.configured(loginViewController)
    }
}

final class HomeSceneFactory: SceneFactory {
    var configurator: HomeSceneConfigurator!
    
    func makeScene() -> UIViewController {
        let homeViewController = HomeSceneViewController()
        return configurator.configured(homeViewController)
    }
}
