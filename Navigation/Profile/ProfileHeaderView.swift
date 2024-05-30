//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Maxim P on 25/05/2024.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Profile")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.text = "Stan Pines"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subTitle: UILabel = {
        let label = UILabel()
        label.text = "Waiting for something..."
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textField: UITextField = {
        let field = UITextField()
        field.font = UIFont.systemFont(ofSize: 15)
        field.textColor = .black
        field.backgroundColor = .white
        field.borderStyle = .roundedRect
        field.clipsToBounds = true
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        field.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Set Status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.masksToBounds = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    
    private func setupView() {
        addSubview(profileImageView)
        addSubview(actionButton)
        addSubview(title)
        addSubview(subTitle)
        addSubview(textField)
        
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            
            title.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            
            subTitle.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            subTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 15),
            
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            textField.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 15),
            textField.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            
            actionButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16),
            actionButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            actionButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }
    
    @objc func buttonPressed() {
        subTitle.text = statusText
        print(subTitle.text ?? "")
    }
}
