//
//  LoginSceneConfigurator.swift
//  CleanSwift
//
//  Created by Natali Malich on 04.07.2022.
//

import Foundation

protocol LoginSceneConfiguratorProtocol {
    func configured(_ viewController: LoginSceneViewController) -> LoginSceneViewController
}

final class LoginSceneConfigurator: LoginSceneConfiguratorProtocol {
    
    private var sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }
    
    func configured(_ viewController: LoginSceneViewController) -> LoginSceneViewController {
        let interactor = LoginSceneInteractor()
        let presenter = LoginScenePresenter()
        let router = LoginSceneRouter()
        router.viewController = viewController
        router.dataStore = interactor
        presenter.viewController = viewController
        interactor.presenter = presenter
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
