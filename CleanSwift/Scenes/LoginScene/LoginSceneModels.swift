//
//  LoginSceneModels.swift
//  CleanSwift
//
//  Created by Natali Malich on 04.07.2022.
//

import UIKit

enum LoginScene {
    // MARK: Use cases
    
    enum Something {
        struct Request {
            var userName: String?
            var userPhoneNumber: String?
        }
        struct Response {
            var success: Bool
        }
        struct ViewModel {
            var success: Bool
        }
    }
}
