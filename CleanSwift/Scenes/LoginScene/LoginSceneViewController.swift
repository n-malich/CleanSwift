//
//  LoginSceneViewController.swift
//  CleanSwift
//
//  Created by Natali Malich on 04.07.2022.
//

import UIKit

protocol LoginSceneDisplayLogic: AnyObject {
    func displayLogin(viewModel: LoginScene.Something.ViewModel)
}

class LoginSceneViewController: UIViewController, LoginSceneDisplayLogic {
    var interactor: LoginSceneBusinessLogic?
    var router: (NSObjectProtocol & LoginSceneRoutingLogic & LoginSceneDataPassing)?
    
    private lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.activateAnchors()
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "WILDBERRIES TEAM"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .white
        label.activateAnchors()
        return label
    }()
    
    private lazy var userNameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .clear
        textField.textColor = .white
        textField.tintColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "Введите Ф.И.О", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.cornerRadius = 10
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.returnKeyType = UIReturnKeyType.done
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.clipsToBounds = true
        textField.activateAnchors()
        return textField
    }()
    
    private lazy var phoneNumberTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.backgroundColor = .clear
        textField.textColor = .white
        textField.tintColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "_ _ _) _ _ _  _ _  _ _", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.cornerRadius = 10
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.returnKeyType = UIReturnKeyType.done
        textField.clipsToBounds = true
        textField.delegate = self
        textField.activateAnchors()
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("ВХОД", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 10
        button.backgroundColor = .clear
        button.activateAnchors()
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        return button
    }()
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradient()
        setupViews()
        setupConstraints()
        setupHideKeyboardOnTap()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        userNameTextField.text = nil
        phoneNumberTextField.text = nil
    }
    
    // MARK: Login
    
    @objc func login() {
        let dictionary = [")": "", " ": ""]
        let userName = userNameTextField.text
        let userPhoneNumber = phoneNumberTextField.text?.replace(dictionary)
        let request = LoginScene.Something.Request(userName: userName, userPhoneNumber: userPhoneNumber)
        interactor?.login(request: request)
    }
    
    func displayLogin(viewModel: LoginScene.Something.ViewModel) {
        if viewModel.success == true {
            router?.navigateToHome()
        } else {
            userNameTextField.text = nil
            phoneNumberTextField.text = nil
            router?.showLoginFailure()
        }
    }
}

extension LoginSceneViewController {
    func setupViews() {
        view.addSubviews(logoImage, titleLabel, userNameTextField, phoneNumberTextField, loginButton)
    }
}

extension LoginSceneViewController {
    private func setupConstraints() {
        [
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 156),
            logoImage.heightAnchor.constraint(equalToConstant: 114),
            logoImage.widthAnchor.constraint(equalTo: logoImage.heightAnchor),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: logoImage.centerXAnchor),
            
            userNameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 150),
            userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 61),
            userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            userNameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            phoneNumberTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 20),
            phoneNumberTextField.leadingAnchor.constraint(equalTo: userNameTextField.leadingAnchor),
            phoneNumberTextField.trailingAnchor.constraint(equalTo: userNameTextField.trailingAnchor),
            phoneNumberTextField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: phoneNumberTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            loginButton.widthAnchor.constraint(equalToConstant: 70)
        ]
            .forEach {$0.isActive = true}
    }
}

extension LoginSceneViewController {
    func setupGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 0.796, green: 0.067, blue: 0.671, alpha: 1).cgColor,
            UIColor(red: 0.6, green: 0, blue: 0.6, alpha: 1).cgColor,
            UIColor(red: 0.282, green: 0.067, blue: 0.451, alpha: 1).cgColor
        ]
        gradientLayer.frame = self.view.bounds
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.view.layer.addSublayer(gradientLayer)
    }
}

extension LoginSceneViewController: UITextFieldDelegate {
    func formatter(mask: String, phoneNumber: String) -> String {
        let number = phoneNumber.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = number.startIndex
        
        for character in mask where index < number.endIndex {
            if character == "X" {
                result.append(number[index])
                index = number.index(after: index)
            } else {
                result.append(character)
            }
        }
        return result
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return string == "" }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = formatter(mask: "XXX) XXX XX XX", phoneNumber: newString)
        return string == ""
    }
}

extension LoginSceneViewController {
    func setupHideKeyboardOnTap() {
        self.view.addGestureRecognizer(self.endEditingRecognizer())
        self.navigationController?.navigationBar.addGestureRecognizer(self.endEditingRecognizer())
    }
    
    private func endEditingRecognizer() -> UIGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
        tap.cancelsTouchesInView = false
        return tap
    }
}
