//
//  EventView.swift
//  EvenTown BC
//
//  Created by Ricardo Lozano on 11/4/16.
//  Copyright © 2016 Social Reality Inc. All rights reserved.
//

import UIKit

class EventView: BaseCell {
        
    let eventImage: CustomImageView = {
        let imageView = CustomImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.loadImageUsingUrlString(urlString: "http://www.appcoda.com/wp-content/uploads/2016/09/beginner-book-300.jpg")
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let eventDescriptionView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(eventImage)
        eventImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        eventImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        eventImage.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        eventImage.heightAnchor.constraint(equalToConstant: frame.width * 9 / 16).isActive = true
        
    }

    


}
