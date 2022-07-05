//
//  HomeSceneViewController.swift
//  CleanSwift
//
//  Created by Natali Malich on 04.07.2022.
//

import UIKit

protocol HomeSceneDisplayLogic: AnyObject {
    func displayShowUser(viewModel: HomeScene.Something.ViewModel)
}

class HomeSceneViewController: UIViewController, HomeSceneDisplayLogic {
    var interactor: HomeSceneBusinessLogic?
    var router: (NSObjectProtocol & HomeSceneRoutingLogic & HomeSceneDataPassing)?
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.activateAnchors()
        return label
    }()
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        showUser()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UserDefaults.standard.removeObject(forKey: "userName")
    }
    
    // MARK: ShowUser
    
    func showUser() {
        let request = HomeScene.Something.Request()
        interactor?.showUser(request: request)
    }
    
    func displayShowUser(viewModel: HomeScene.Something.ViewModel) {
        userNameLabel.text = viewModel.userName
    }
}

extension HomeSceneViewController {
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(userNameLabel)
    }
}

extension HomeSceneViewController {
    private func setupConstraints() {
        [
            userNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
            .forEach {$0.isActive = true}
    }
}
