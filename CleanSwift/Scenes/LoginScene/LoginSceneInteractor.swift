//
//  LoginSceneInteractor.swift
//  CleanSwift
//
//  Created by Natali Malich on 04.07.2022.
//

import UIKit

protocol LoginSceneBusinessLogic {
    func login(request: LoginScene.Something.Request)
}

protocol LoginSceneDataStore {}

class LoginSceneInteractor: LoginSceneBusinessLogic, LoginSceneDataStore {
    var presenter: LoginScenePresentationLogic?
    
    // MARK: Login
    
    func login(request: LoginScene.Something.Request) {
        let userName = request.userName
        let phoneNumber = request.userPhoneNumber
        
        if NetworkService.shared.login(userName: userName, phoneNumber: phoneNumber) {
            NetworkService.shared.saveUser(userName)
            let response = LoginScene.Something.Response(success: true)
            presenter?.presentLogin(response: response)
        } else {
            let response = LoginScene.Something.Response(success: false)
            presenter?.presentLogin(response: response)
        }
    }
}
