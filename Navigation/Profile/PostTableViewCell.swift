//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Maxim P on 13/06/2024.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        contentView.addSubview(authorLabel)
        contentView.addSubview(postImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(likesLabel)
        contentView.addSubview(viewsLabel)
        
        NSLayoutConstraint.activate([
            
                authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                
                postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8),
                postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                postImageView.heightAnchor.constraint(equalToConstant: 200),  // Adjust the height as needed
                
                descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 8),
                descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                
                likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
                likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                
                viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
                viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func configure(with post: Post) {
        authorLabel.text = post.author
        postImageView.image = UIImage(named: post.image)
        descriptionLabel.text = post.description
        likesLabel.text = "Likes: \(post.likes)"
        viewsLabel.text = "Views: \(post.views)"
    }
}
