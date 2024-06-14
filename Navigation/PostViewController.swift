//
//  PostViewController.swift
//  Navigation
//
//  Created by Maxim P on 17/05/2024.
//

import UIKit

struct myPost {
    var title: String
}


class PostViewController: UIViewController {
    
   
    var post: myPost?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemIndigo
        
        if let post = post {
            title = post.title
        }
        
                let infoButton = UIBarButtonItem(title: "More", style: .plain, target: self, action: #selector(infoButtonTapped))
                navigationItem.rightBarButtonItem = infoButton
    }
    
        @objc func infoButtonTapped() {
            let infoViewController = InfoViewController()
    
            infoViewController.modalTransitionStyle = .flipHorizontal
            infoViewController.modalPresentationStyle = .pageSheet
    
            present(infoViewController, animated: true, completion: nil)
        }
    
}
