//
//  HomeSceneInteractor.swift
//  CleanSwift
//
//  Created by Natali Malich on 04.07.2022.
//

import UIKit

protocol HomeSceneBusinessLogic {
    func showUser(request: HomeScene.Something.Request)
}

protocol HomeSceneDataStore {}

class HomeSceneInteractor: HomeSceneBusinessLogic, HomeSceneDataStore {
    var presenter: HomeScenePresentationLogic?
    
    // MARK: Do something
    
    func showUser(request: HomeScene.Something.Request) {
        let userName = NetworkService.shared.getUserName()
        let response = HomeScene.Something.Response(userName: userName)
        presenter?.presentUser(response: response)
    }
}
