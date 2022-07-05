//
//  HomeSceneRouter.swift
//  CleanSwift
//
//  Created by Natali Malich on 04.07.2022.
//

import UIKit

@objc protocol HomeSceneRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol HomeSceneDataPassing {
    var dataStore: HomeSceneDataStore? { get }
}

class HomeSceneRouter: NSObject, HomeSceneRoutingLogic, HomeSceneDataPassing {
    weak var viewController: HomeSceneViewController?
    var dataStore: HomeSceneDataStore?
    
    // MARK: Navigation
    
    //func navigateToSomewhere(source: HomeSceneViewController, destination: SomewhereViewController) {
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: HomeSceneDataStore, destination: inout SomewhereDataStore) {
    //  destination.name = source.name
    //}
}
