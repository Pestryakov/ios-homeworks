//
//  LogInViewController.swift
//  Navigation
//
//  Created by Maxim P on 06/06/2024.
//

import UIKit

class LogInViewController: UIViewController {
    
    private lazy var loginImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Login")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var emailOrPhoneTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email or Phone"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.backgroundColor = .systemGray6
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.backgroundColor = .systemGray6
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = UIColor(named: "NewColorSet")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        button.addTarget(self, action: #selector(logInButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        if button.isSelected {
            button.alpha = 0.8 // Выбранное состояние
        } else if button.isHighlighted {
            button.alpha = 0.8 // Состояние выделения
        } else if !button.isEnabled {
            button.alpha = 0.8 // Неактивное состояние
        } else {
            button.alpha = 1 // Номинальное состояние
        }
        
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    private func setupUI() {
        view.addSubview(loginImageView)
        view.addSubview(emailOrPhoneTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            // Картинка в верхней части экрана
            loginImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            loginImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginImageView.widthAnchor.constraint(equalToConstant: 100),
            loginImageView.heightAnchor.constraint(equalToConstant: 100),
            
            // Поле для ввода email или телефона
            emailOrPhoneTextField.topAnchor.constraint(equalTo: loginImageView.bottomAnchor, constant: 120),
            emailOrPhoneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emailOrPhoneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            emailOrPhoneTextField.heightAnchor.constraint(equalToConstant: 50),
            

            // Поле для ввода пароля
            passwordTextField.topAnchor.constraint(equalTo: emailOrPhoneTextField.bottomAnchor, constant: 0),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            // Кнопка для входа
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func logInButtonTap() {
        let profileViewController = ProfileViewController()
        navigationController?.setViewControllers([profileViewController], animated: true)
    }
}
