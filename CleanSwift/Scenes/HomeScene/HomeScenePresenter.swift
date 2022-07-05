//
//  HomeScenePresenter.swift
//  CleanSwift
//
//  Created by Natali Malich on 04.07.2022.
//

import UIKit

protocol HomeScenePresentationLogic {
    func presentUser(response: HomeScene.Something.Response)
}

class HomeScenePresenter: HomeScenePresentationLogic {
    weak var viewController: HomeSceneDisplayLogic?
    
    // MARK: Do something
    
    func presentUser(response: HomeScene.Something.Response) {
        let viewModel = HomeScene.Something.ViewModel(userName: response.userName)
        viewController?.displayShowUser(viewModel: viewModel)
    }
}
