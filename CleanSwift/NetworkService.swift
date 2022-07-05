//
//  LoginSceneWorker.swift
//  CleanSwift
//
//  Created by Natali Malich on 04.07.2022.
//

import UIKit

class NetworkService {
    
    static let shared = NetworkService()
    
    private let defaultName = "Иванов Иван Иванович"
    private let defaultNumber = "9139999999"
    
    func login(userName: String?, phoneNumber: String?) -> Bool {
        guard let userName = userName, let phoneNumber = phoneNumber else { return false }
        return userName == defaultName && phoneNumber == defaultNumber
    }
    
    func saveUser(_ userName: String?) {
        UserDefaults.standard.set(userName, forKey: "userName")
    }
    
    func getUserName() -> String? {
        return UserDefaults.standard.string(forKey: "userName")
    }
}
