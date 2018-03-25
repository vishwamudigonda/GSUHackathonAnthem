//
//  PollBooth Controller.swift
//  test
//
//  Created by Michael Shepherd on 3/24/18.
//
//

import UIKit
import Firebase

class PollBooth_Controller: UIViewController {
    @IBOutlet weak var Thanks: UILabel!
    @IBOutlet weak var Participate_message: UILabel!

    @IBOutlet weak var Participate_2: UILabel!
    @IBOutlet weak var Dog_Day: UIButton!
    @IBOutlet weak var Donuts: UIButton!
    @IBOutlet weak var Casual_Friday: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        // Do any additional setup after loading the view.
    }

    @IBAction func Casual_Friday(_ sender: Any) {
        
        if FIRAuth.auth()?.currentUser?.uid == nil{
            print("This man needs to logout")
        }
            
            //if a user is logged in do this!
        else{
            var m = 0
            FIRDatabase.database().reference().child("PollTable").child("PollIdea1").observeSingleEvent(of: .value, with: { (snapshot) in
                if let dictionary = snapshot.value as? [String: Any]{
                 m = dictionary["Count"] as! Int
                }
            }, withCancel: nil)
            
            let values = ["Count": m+1]
            FIRDatabase.database().reference().child("PollTable").child("PollIdea1").updateChildValues(values, withCompletionBlock: { (err, ref) in
                if err != nil{
                    print(err)
                    return
                }
            })
        }
        
    }
    @IBAction func Donut(_ sender: Any) {
        if FIRAuth.auth()?.currentUser?.uid == nil{
            print("This man needs to logout")
        }
            
            //if a user is logged in do this!
        else{
            var m = 0
            FIRDatabase.database().reference().child("PollTable").child("PollIdea2").observeSingleEvent(of: .value, with: { (snapshot) in
                if let dictionary = snapshot.value as? [String: Any]{
                    m = dictionary["Count"] as! Int
                }
            }, withCancel: nil)
            
            let values = ["Count": m+1]
            FIRDatabase.database().reference().child("PollTable").child("PollIdea2").updateChildValues(values, withCompletionBlock: { (err, ref) in
                if err != nil{
                    print(err)
                    return
                }
            })
        }
    }
    @IBAction func Dog_Day(_ sender: Any) {
        if FIRAuth.auth()?.currentUser?.uid == nil{
            print("This man needs to logout")
        }
            
            //if a user is logged in do this!
        else{
            var m = 0
            FIRDatabase.database().reference().child("PollTable").child("PollIdea3").observeSingleEvent(of: .value, with: { (snapshot) in
                if let dictionary = snapshot.value as? [String: Any]{
                    m = dictionary["Count"] as! Int
                }
            }, withCancel: nil)
            
            let values = ["Count": m+1]
            FIRDatabase.database().reference().child("PollTable").child("PollIdea3").updateChildValues(values, withCompletionBlock: { (err, ref) in
                if err != nil{
                    print(err)
                    return
                }
            })
        }
    }

}
