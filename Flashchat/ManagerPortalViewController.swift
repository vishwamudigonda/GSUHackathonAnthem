//
//  ManagerPortalViewController.swift
//  Flash Chat
//
//  Created by Vishwa Dutt Mudigonda on 3/25/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit
import Firebase

class ManagerPortalViewController: UIViewController {

    @IBOutlet weak var bargraph: UIImageView!
    @IBOutlet weak var piegraph: UIImageView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bargraph.isUserInteractionEnabled = true
        piegraph.isUserInteractionEnabled = true
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.pinchGesture))
        bargraph.addGestureRecognizer(pinchGesture)
        piegraph.addGestureRecognizer(pinchGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func pinchGesture(sender:UIPinchGestureRecognizer) {
        sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
        sender.scale = 1.0
    }

}
