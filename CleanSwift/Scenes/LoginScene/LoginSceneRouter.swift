//
//  LoginSceneRouter.swift
//  CleanSwift
//
//  Created by Natali Malich on 04.07.2022.
//

import UIKit

protocol LoginSceneRoutingLogic {
    func navigateToHome()
    func showLoginFailure()
}

protocol LoginSceneDataPassing {
    var dataStore: LoginSceneDataStore? { get }
}

class LoginSceneRouter: NSObject, LoginSceneRoutingLogic, LoginSceneDataPassing {
    
    weak var viewController: LoginSceneViewController?
    var dataStore: LoginSceneDataStore?
    
    // MARK: Navigation
    
    func navigateToHome() {
        let sceneFactory = HomeSceneFactory()
        sceneFactory.configurator = HomeSceneConfigurator(sceneFactory: sceneFactory)
        let navController = sceneFactory.makeScene()
        viewController?.navigationController?.pushViewController(navController, animated: true)
    }
    
    func showLoginFailure() {
        let action = UIAlertAction(title: "OK", style: .destructive)
        let alertController = UIAlertController(title: "Произошла ошибка", message: "Данные неверны", preferredStyle: .alert)
        alertController.addAction(action)
        viewController?.present(alertController, animated: true)
    }
    
    // MARK: Passing data
    
    func passDataToSomewhere(source: LoginSceneDataStore, destination: inout HomeSceneDataStore) {
    }
}
