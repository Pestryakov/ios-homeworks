//
//  InfoViewController.swift
//  Navigation
//
//  Created by Maxim P on 17/05/2024.
//

import UIKit

class InfoViewController: UIViewController {
    
    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Attention", for: .normal)
        button.setTitleColor(.systemMint, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(actionButton)
        
        NSLayoutConstraint.activate([
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        actionButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }
    
    @objc func showAlert() {
        let alertController = UIAlertController(title: "Attention", message: "Select your gender", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "Male", style: .default) {_ in
            print("You selected Male")
        }
        
        let action2 = UIAlertAction(title: "Female", style: .default) {_ in
            print("You selected Female")
        }
        
        alertController.addAction(action1)
        alertController.addAction(action2)
        
        present(alertController, animated: true, completion: nil)
    }
}
