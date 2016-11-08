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
//        imageView.loadImageUsingUrlString(urlString: "https://scontent.felp1-1.fna.fbcdn.net/v/t1.0-9/14947714_10154770552714684_4752187345928028670_n.jpg?oh=3716248d87482097e380a478e98c91fa&oe=58D1B94E")
        imageView.loadImageUsingUrlString(urlString: "https://scontent.felp1-1.fna.fbcdn.net/v/t1.0-9/14947696_10154201117614296_1889975763265240050_n.jpg?oh=402bebf64de120546b0f98a8617bdc5a&oe=58CBE070")
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false

        
        
        setupEventView()

//        view.addSubview(eventImage)
//        view.addConstraintsWithFormat(format: "H:|[v0]|", views: eventImage)
//        view.addConstraintsWithFormat(format: "V:[v0(200)]", views: eventImage)

//        eventImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        eventImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        eventImage.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
//        eventImage.heightAnchor.constraint(equalToConstant: frame.width * 9 / 16).isActive = true

    
    
    
    
    
    }
    
    let eventView: EventsCell = {
        let view = EventsCell()
        
        return view
    }()
    
    func setupEventView() {
        
//        view.addSubview(eventView)
//        let width = view.frame.width
        let heigth = view.frame.width * 9 / 16
        view.addSubview(eventImage)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: eventImage)
        view.addConstraintsWithFormat(format: "V:[v0(\(heigth))]", views: eventImage)

        
    }
    
    func setEventImage(imageUrl: String)
    {
        eventImage.loadImageUsingUrlString(urlString: imageUrl)
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
    
    
    
    func showEventViewer() {
        
        print("Show view controller")
                
        
        self.navigationItem.title = "Cumpleaños de Alex"
        self.view.backgroundColor = .darkGray
        
        self.navigationController?.pushViewController(self, animated: true)
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationController?.pushViewController(self, animated: true)

  
        
//        if let keyWindow = UIApplication.shared.keyWindow {
//            let view = UIView(frame: keyWindow.frame)
//            view.backgroundColor = .white
//            
//            view.frame = CGRect(x: keyWindow.frame.width - 10, y: keyWindow.frame.height - 10, width: 10, height: 10)
//            
//            let videoPlayerFrame = CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: keyWindow.frame.width * 9 / 16)
//            let videoPlayerView = VideoPlayerView(frame: videoPlayerFrame)
//            view.addSubview(videoPlayerView)
//            
//            keyWindow.addSubview(view)
//            
//            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//                view.frame = keyWindow.frame
//            }, completion: {(completedAnimation) in
//                // after animation
//                UIApplication.shared.setStatusBarHidden(true, with: .fade)
//            })
//            
//        }
        
    }


}
