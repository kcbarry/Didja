//
//  WelcomeViewController.swift
//  Didja
//
//  Created by Nikhil Bhatia-lin on 6/28/17.
//  Copyright © 2017 learning. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "BoardBackground"))
        self.title = "Welcome to Didja"
        
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.addTarget(self, action: #selector(WelcomeViewController.didPressSignIn(_:)), for: .touchUpInside)
        
        signInButton.sizeToFit()
        let signInButtonCenterXConstraint = NSLayoutConstraint.init(item: signInButton, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: view, attribute: .centerXWithinMargins, multiplier: 1.0, constant: 0)
        let signInButtonCenterYConstraint = NSLayoutConstraint.init(item: signInButton, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: view, attribute: .centerYWithinMargins, multiplier: 1.0, constant: -40)
        view.addSubview(signInButton)
        
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.addTarget(self, action: #selector(WelcomeViewController.didPressSignUp(_:)), for: .touchUpInside)
        
        signUpButton.sizeToFit()
        let signUpButtonCenterX = NSLayoutConstraint.init(item: signUpButton, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: view, attribute: .centerXWithinMargins, multiplier: 1.0, constant: 0)
        let signUpButtonTop = NSLayoutConstraint.init(item: signUpButton, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: view, attribute: .centerYWithinMargins, multiplier: 1.0, constant: 40)
        view.addSubview(signUpButton)
        
        view.addConstraints([signInButtonCenterXConstraint, signInButtonCenterYConstraint, signUpButtonCenterX, signUpButtonTop])
        // Do any additional setup after loading the view.
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
    
    // MARK: - Object Functions
    
    @objc func didPressSignIn(_ sender: Any) {
        let signInViewController = SignInViewController.init(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(signInViewController, animated: true)
    }
    
    @objc func didPressSignUp(_ sender: Any) {
        let signUpViewController = SignUpViewController.init(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    // MARK: - Private Variables
    
    private lazy var signInButton: UIButton = {
        let signInButton = UIButton.init(type: .system)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        return signInButton
    }()
    
    private lazy var signUpButton: UIButton = {
        let signUpButton = UIButton.init(type: .system)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        return signUpButton
    }()

}
