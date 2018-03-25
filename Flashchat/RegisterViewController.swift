//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {

      guard  let name = self.nameTextField.text,
        let email = self.emailTextfield.text,
        let password = self.passwordTextfield.text,
        let repeatpassword = self.repeatPasswordTextField.text
        else{
            print("Form is not valid")
            return
        }
        
        guard password == repeatpassword
            else{
                print("Passwords do not match")
                return
        }
        
        //TODO: Set up a new user on our Firbase database
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                print(error!)
            }
            else {

                let ref = FIRDatabase.database().reference()
                let employeeReference = ref.child("Employees").child((user?.uid)!)
                let values = ["name": name, "email": email, "moodCount": 0] as [String: Any]
                
                employeeReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
                    if err != nil{
                        print(err)
                        return
                    }
                    print("Saved user successfully into firebase db")
                })
                
                
                print("Registeration Successful")
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        })
        

        
        
    } 
    
    
}
