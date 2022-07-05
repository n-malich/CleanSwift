//
//  HomeSceneConfigurator.swift
//  CleanSwift
//
//  Created by Natali Malich
//

import Foundation

protocol HomeSceneConfiguratorProtocol {
    func configured(_ viewController: HomeSceneViewController) -> HomeSceneViewController
}

final class HomeSceneConfigurator: HomeSceneConfiguratorProtocol {
    
    private var sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }
    
    func configured(_ viewController: HomeSceneViewController) -> HomeSceneViewController {
        let interactor = HomeSceneInteractor()
        let presenter = HomeScenePresenter()
        let router = HomeSceneRouter()
        router.viewController = viewController
        router.dataStore = interactor
        presenter.viewController = viewController
        interactor.presenter = presenter
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
