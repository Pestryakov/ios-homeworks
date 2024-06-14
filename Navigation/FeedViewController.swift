//
//  FeedViewController.swift
//  Navigation
//
//  Created by Maxim P on 17/05/2024.
//

import UIKit

class FeedViewController: UIViewController {
    
        private lazy var oneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Post One", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonOnePressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var twoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Post Two", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 12
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTwoPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = { [unowned self] in
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = false
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 10.0
        
        stackView.addArrangedSubview(self.oneButton)
        stackView.addArrangedSubview(self.twoButton)
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(stackView)
        setupConstraints()
        
        oneButton.addTarget(self, action: #selector(buttonOnePressed), for: .touchUpInside)
        twoButton.addTarget(self, action: #selector(buttonTwoPressed), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: safeAreaGuide.centerYAnchor),
            oneButton.widthAnchor.constraint(equalToConstant: 200),
            oneButton.heightAnchor.constraint(equalToConstant: 50),
            twoButton.widthAnchor.constraint(equalToConstant: 200),
            twoButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func buttonOnePressed() {
        let postViewController = PostViewController()
        let post = myPost(title: "Post Number One")
        postViewController.post = post
        navigationController?.pushViewController(postViewController, animated: true)
    }
    
    @objc func buttonTwoPressed() {
        let postViewController = PostViewController()
        let post = myPost(title: "Post Number Two")
        postViewController.post = post
        navigationController?.pushViewController(postViewController, animated: true)
    }
}
