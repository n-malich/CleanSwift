//
//  LoginScenePresenter.swift
//  CleanSwift
//
//  Created by Natali Malich on 04.07.2022.
//

import UIKit

protocol LoginScenePresentationLogic {
    func presentLogin(response: LoginScene.Something.Response)
}

class LoginScenePresenter: LoginScenePresentationLogic {
    weak var viewController: LoginSceneDisplayLogic?
    
    // MARK: Do something
    
    func presentLogin(response: LoginScene.Something.Response) {
        let viewModel = LoginScene.Something.ViewModel(success: response.success)
        viewController?.displayLogin(viewModel: viewModel)
    }
}
