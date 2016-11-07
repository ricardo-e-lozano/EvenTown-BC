//
//  EventViewController.swift
//  EvenTown BC
//
//  Created by Ricardo Lozano on 11/4/16.
//  Copyright © 2016 Social Reality Inc. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {

    let eventImage: CustomImageView = {
        let imageView = CustomImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.loadImageUsingUrlString(urlString: "http://www.appcoda.com/wp-content/uploads/2016/09/beginner-book-300.jpg")
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(eventImage)
//        eventImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        eventImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        eventImage.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
//        eventImage.heightAnchor.constraint(equalToConstant: frame.width * 9 / 16).isActive = true

    
    
    
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
