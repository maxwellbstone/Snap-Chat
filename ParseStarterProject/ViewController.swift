//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButton(sender: AnyObject) {
        if usernameField.text.isEmpty || passwordField.text.isEmpty {
            println("Please fill out username and password")
        }
        else {
            PFUser.logInWithUsernameInBackground(usernameField.text, password: passwordField.text, block: { (user, error) -> Void in
                if error == nil {
                    println("Logged in")
                    self.performSegueWithIdentifier("login", sender: self)
                }
                else {
                    println("error with login try again")
                }
            })
        }
    }
}

