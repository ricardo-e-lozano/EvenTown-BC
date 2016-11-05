//
//  AccountCell.swift
//  NetOps Status
//
//  Created by Ricardo Lozano on 11/4/16.
//  Copyright © 2016 Social Reality Inc. All rights reserved.
//

import UIKit

class AccountCell: BaseCell {
    
    let profileImageSize = CGFloat(200)
    
    
    let profileImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.loadImageUsingUrlString(urlString: "https://scontent.felp1-1.fna.fbcdn.net/v/t1.0-9/14947714_10154770552714684_4752187345928028670_n.jpg?oh=3716248d87482097e380a478e98c91fa&oe=58D1B94E")
//        imageView.loadImageUsingUrlString(urlString: "https://scontent.felp1-1.fna.fbcdn.net/t31.0-8/14883500_10154755553699684_8529061120782653789_o.jpg")
        imageView.image = UIImage(named: "slide_menu")
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    let profileNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ricardo Lozano"
        label.textColor = .darkGray
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(profileImageView)
        profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: profileImageSize).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: profileImageSize).isActive = true
        
        addSubview(profileNameLabel)
        profileNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileNameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16).isActive = true
        
        
        
        
    }
}
