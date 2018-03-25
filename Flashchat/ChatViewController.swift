//
//  ViewController.swift
//  Flash Chat
//
//  Created by Angela Yu on 29/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    // Declare instance variables here
    @IBOutlet weak var Hey: UILabel!
    @IBOutlet weak var EmployeeName: UILabel!
    @IBOutlet weak var MoodQuestion1: UILabel!
    @IBOutlet weak var MoodQuestion2: UILabel!
    @IBOutlet weak var Elaborate: UILabel!

    
    @IBOutlet weak var Mood_5: UIButton!
    @IBOutlet weak var Mood_4: UIButton!
    @IBOutlet weak var Mood_3: UIButton!
    @IBOutlet weak var Mood_2: UIButton!
    @IBOutlet weak var Mood_1: UIButton!
    
    @IBOutlet weak var emoji_5: UILabel!
    @IBOutlet weak var emoji_4: UILabel!
    @IBOutlet weak var emoji_3: UILabel!
    @IBOutlet weak var emoji_2: UILabel!
    @IBOutlet weak var emoji_1: UILabel!
    @IBOutlet weak var Comments: UITextField!
    
    @IBOutlet weak var Submit: UIButton!
    
    // We've pre-linked the IBOutlets
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var messageTextfield: UITextField!
    @IBOutlet var messageTableView: UITableView!
    
    var a = 0
    
    
    override func viewDidLoad() {
        if FIRAuth.auth()?.currentUser?.uid == nil{
            print("This guy needs to be logged out.")
        }
        else{
            let uid = FIRAuth.auth()?.currentUser?.uid
            let employeeReference = FIRDatabase.database().reference(fromURL: "https://anthem-e7bba.firebaseio.com/").child("Employees").child(uid!).child("name")
            employeeReference.observeSingleEvent(of: .value, with: { (snapshot) in
                let i = snapshot.value as? String
                self.EmployeeName.text = i!+","
                })
        }
        
        super.viewDidLoad()
        
        self.Mood_1.alpha = 0.0
        self.Mood_2.alpha = 0.0
        self.Mood_3.alpha = 0.0
        self.Mood_4.alpha = 0.0
        self.Mood_5.alpha = 0.0
        self.Submit.alpha = 0.0
        self.emoji_5.alpha = 0.0
        self.emoji_4.alpha = 0.0
        self.emoji_3.alpha = 0.0
        self.emoji_2.alpha = 0.0
        self.emoji_1.alpha = 0.0
        Comments.isHidden = true;
        Elaborate.isHidden = true;
        self.Hey.alpha = 0.0
        self.MoodQuestion1.alpha = 0.0
        self.MoodQuestion2.alpha = 0.0
        self.EmployeeName.alpha = 0.0
        UIView.animate(withDuration: 1.5, delay: 0.5, options: .curveEaseIn, animations: {
            self.MoodQuestion1.alpha = 1.0
            self.MoodQuestion2.alpha = 1.0
            self.Hey.alpha = 1.0
            self.EmployeeName.alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 1.5, delay: 2.0, options: .curveEaseIn, animations: {
            self.emoji_5.alpha = 1.0
            self.emoji_4.alpha = 1.0
            self.emoji_3.alpha = 1.0
            self.emoji_2.alpha = 1.0
            self.emoji_1.alpha = 1.0
            self.Mood_1.alpha = 0.1
            self.Mood_2.alpha = 0.1
            self.Mood_3.alpha = 0.1
            self.Mood_4.alpha = 0.1
            self.Mood_5.alpha = 0.1
        }, completion: nil)
    }

    func hide_Buttons(){            //Hides all buttons from view
        Mood_1.isHidden = true;
        Mood_2.isHidden = true;
        Mood_3.isHidden = true;
        Mood_4.isHidden = true;
        Mood_5.isHidden = true;
    }
    
    func hide_Labels(){//Hides all labels from view
        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
            self.Hey.alpha = 0.0
            self.MoodQuestion1.alpha = 0.0
            self.MoodQuestion2.alpha = 0.0
            self.EmployeeName.alpha = 0.0
            
        }, completion: nil)
    }
    @IBAction func Mood5(_ sender: Any) {
        a = 5
        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
            self.emoji_4.alpha = 0.0
            self.emoji_3.alpha = 0.0
            self.emoji_2.alpha = 0.0
            self.emoji_1.alpha = 0.0
        }, completion: nil)
        hide_Buttons();
        hide_Labels();
        Comments.isHidden = false
        Elaborate.isHidden = false
        self.Comments.alpha = 0.0;
        self.Elaborate.alpha = 0.0;
        UIView.animate(withDuration: 1.0, delay: 1.5, options: .curveEaseIn, animations: {
            self.Comments.alpha = 1.0
            self.Elaborate.alpha = 1.0
            self.Submit.alpha = 1.0
            
        }, completion: nil)
        UIView.animate(withDuration: 4.0, delay: 0.5, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.0, options: .curveLinear, animations: {
            
            self.emoji_5.center = CGPoint(x: 190, y:250 )  // Ending position of the Label
            
        }, completion: nil)
        
    }
    @IBAction func Mood4(_ sender: Any) {
        a = 4
        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
            self.emoji_5.alpha = 0.0
            self.emoji_3.alpha = 0.0
            self.emoji_2.alpha = 0.0
            self.emoji_1.alpha = 0.0
        }, completion: nil)
        hide_Buttons();
        hide_Labels();
        Comments.isHidden = false
        Elaborate.isHidden = false
        self.Comments.alpha = 0.0;
        self.Elaborate.alpha = 0.0;
        UIView.animate(withDuration: 1.0, delay: 1.5, options: .curveEaseIn, animations: {
            self.Comments.alpha = 1.0
            self.Elaborate.alpha = 1.0
            self.Submit.alpha = 1.0
        }, completion: nil)
        UIView.animate(withDuration: 4.0, delay: 0.5, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.0, options: .curveLinear, animations: {
            
            self.emoji_4.center = CGPoint(x: 190, y:250 )  // Ending position of the Label
            
        }, completion: nil)
    }
    
    @IBAction func Mood3(_ sender: Any) {
        a = 3
        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
            self.emoji_5.alpha = 0.0
            self.emoji_4.alpha = 0.0
            self.emoji_2.alpha = 0.0
            self.emoji_1.alpha = 0.0
        }, completion: nil)
        hide_Buttons();
        hide_Labels();
        Comments.isHidden = false
        Elaborate.isHidden = false
        self.Comments.alpha = 0.0;
        self.Elaborate.alpha = 0.0;
        UIView.animate(withDuration: 1.0, delay: 1.5, options: .curveEaseIn, animations: {
            self.Comments.alpha = 1.0
            self.Elaborate.alpha = 1.0
            self.Submit.alpha = 1.0
        }, completion: nil)
        UIView.animate(withDuration: 4.0, delay: 0.5, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.0, options: .curveLinear, animations: {
            
            self.emoji_3.center = CGPoint(x: 190, y:250 )  // Ending position of the Label
            
        }, completion: nil)
    }
    @IBAction func Mood2(_ sender: Any) {
        a = 2
        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
            self.emoji_5.alpha = 0.0
            self.emoji_4.alpha = 0.0
            self.emoji_3.alpha = 0.0
            self.emoji_1.alpha = 0.0
        }, completion: nil)
        hide_Buttons();
        hide_Labels();
        Comments.isHidden = false
        Elaborate.isHidden = false
        self.Comments.alpha = 0.0;
        self.Elaborate.alpha = 0.0;
        UIView.animate(withDuration: 1.0, delay: 1.5, options: .curveEaseIn, animations: {
            self.Comments.alpha = 1.0
            self.Elaborate.alpha = 1.0
            self.Submit.alpha = 1.0
            
        }, completion: nil)
        UIView.animate(withDuration: 4.0, delay: 0.5, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.0, options: .curveLinear, animations: {
            
            self.emoji_2.center = CGPoint(x: 190, y:250 )  // Ending position of the Label
            
        }, completion: nil)
    }
    @IBAction func Mood1(_ sender: Any) {
        a = 1
        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
            self.emoji_5.alpha = 0.0
            self.emoji_4.alpha = 0.0
            self.emoji_3.alpha = 0.0
            self.emoji_2.alpha = 0.0
        }, completion: nil)
        hide_Buttons();
        hide_Labels();
        Comments.isHidden = false
        Elaborate.isHidden = false
        self.Comments.alpha = 0.0;
        self.Elaborate.alpha = 0.0;
        UIView.animate(withDuration: 1.0, delay: 1.5, options: .curveEaseIn, animations: {
            self.Comments.alpha = 1.0
            self.Elaborate.alpha = 1.0
            self.Submit.alpha = 1.0
            
        }, completion: nil)
        UIView.animate(withDuration: 4.0, delay: 0.5, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.0, options: .curveLinear, animations: {
            
            self.emoji_1.center = CGPoint(x: 190, y:250 )  // Ending position of the Label
            
        }, completion: nil)
    }
   
    
    
    @IBAction func SubmitPressed(_ sender: Any) {
        if FIRAuth.auth()?.currentUser?.uid == nil{
            print("This guy needs to be logged out.")
        }
        else{
            var moodCount = 0
            let ref = FIRDatabase.database().reference(fromURL: "https://anthem-e7bba.firebaseio.com/")
            
            let uid = FIRAuth.auth()?.currentUser?.uid
            
            let employeeReference = ref.child("Employees").child(uid!)
            
            let moodReference = ref.child("QuestionSubmission").child(((uid)!)+(String(Int(NSDate().timeIntervalSince1970))))
            
            employeeReference.observeSingleEvent(of: .value, with: { (snapshot) in
                if let dictionary = snapshot.value as? [String: Any]{
                    moodCount = dictionary["moodCount"] as! Int
                    moodCount = moodCount + 1
                    var values = ["Answer" : 0, "Timestamp":[".sv" : "timestamp"],"Comments": self.Comments.text ?? " "] as [String : Any]
                    
                    if(self.a == 1){
                        values = ["Answer" : 1, "Timestamp":[".sv" : "timestamp"],"Comments": self.Comments.text ?? " "] as [String : Any]
                    }else if(self.a == 2){
                        values = ["Answer" : 2, "Timestamp":[".sv" : "timestamp"],"Comments": self.Comments.text ?? " "] as [String : Any]
                    }else if(self.a == 3){
                        values = ["Answer" : 3, "Timestamp":[".sv" : "timestamp"],"Comments": self.Comments.text ?? " "] as [String : Any]
                    }else if(self.a == 4){
                        values = ["Answer" : 4, "Timestamp":[".sv" : "timestamp"],"Comments": self.Comments.text ?? " "] as [String : Any]
                    }else if(self.a == 5){
                        values = ["Answer" : 5, "Timestamp":[".sv" : "timestamp"],"Comments": self.Comments.text ?? " "] as [String : Any]
                    }
                    moodReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
                        if err != nil{
                            print(err)
                            return
                        }
                    })
                    
                    employeeReference.updateChildValues(["moodCount": moodCount], withCompletionBlock: { (err, ref) in
                        if err != nil{
                            print(err)
                            return
                        }
                    })
                }

                print(moodCount)
            })
            if (moodCount > 2){
                self.performSegue(withIdentifier: "Submit", sender: nil)
            }
            
        }
        
    }
    @IBAction func sendPressed(_ sender: AnyObject) {
        
       
    }

    
    @IBAction func logOutPressed(_ sender: AnyObject) {

        do {
        try FIRAuth.auth()?.signOut()
        }
        catch {
            print("Error: there was a problem signing out")
        }
        
        guard (navigationController?.popViewController(animated: true)) != nil
            else {
                print("No View Controllers to pop off")
                return
        }
    }
    


}
