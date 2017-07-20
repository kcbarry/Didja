//
//  SignInViewController.swift
//  Didja
//
//  Created by Nikhil Bhatia-lin on 6/28/17.
//  Copyright © 2017 learning. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

struct userInfo
{
    var firstName = "First"
    var lastName = "Last"
    var email = "email@website.com"
    var phone = "5109265186"
    var username = "myusername"
    var password = "mypassword"
}
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "BoardBackground"))
        self.title = "Sign In"
        self.view.addSubview(emailTextField)
        self.view.addSubview(passwordTextField)
        
        signInButton.addTarget(self, action: #selector(SignInViewController.didPressSignIn(_:)), for: .touchUpInside)
        
        signInButton.sizeToFit()
        let signInButtonCenterXConstraint = NSLayoutConstraint.init(item: signInButton, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: view, attribute: .centerXWithinMargins, multiplier: 1.0, constant: 0)
        let signInButtonCenterYConstraint = NSLayoutConstraint.init(item: signInButton, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: view, attribute: .centerYWithinMargins, multiplier: 1.0, constant: -110)
        view.addSubview(signInButton)
        
        signUpInstead.addTarget(self, action: #selector(SignInViewController.didPressSignUpInstead(_:)), for: .touchUpInside)
        
        signUpInstead.sizeToFit()
        let signUpInsteadCenterXConstraint = NSLayoutConstraint.init(item: signUpInstead, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: view, attribute: .centerXWithinMargins, multiplier: 1.0, constant: 0)
        let signUpInsteadCenterYConstraint = NSLayoutConstraint.init(item: signUpInstead, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: view, attribute: .centerYWithinMargins, multiplier: 1.0, constant: -50)
        view.addSubview(signUpInstead)
        
        
        view.addConstraints([signInButtonCenterXConstraint, signInButtonCenterYConstraint, signUpInsteadCenterXConstraint, signUpInsteadCenterYConstraint])
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let bounds = view.bounds
        var availableBounds = bounds
        
        let layoutMargins = self.view.layoutMargins
        let topLayoutGuideInset = self.topLayoutGuide.length
        
        let verticalOffset = topLayoutGuideInset + self.verticalInset
        availableBounds.origin.x += layoutMargins.left
        availableBounds.origin.y += verticalOffset
        
        availableBounds.size.width -= (layoutMargins.left + layoutMargins.right)
        availableBounds.size.height -= verticalOffset
        
        let textFieldWidth = min(availableBounds.width, self.maxTextFieldWidth)
        let textFieldOriginX = availableBounds.midX - (textFieldWidth/2.0)
        
        var emailTextFieldFrame = CGRect.zero
        emailTextFieldFrame.origin.x = textFieldOriginX
        emailTextFieldFrame.origin.y = availableBounds.minY
        emailTextFieldFrame.size.width = textFieldWidth
        emailTextFieldFrame.size.height = textFieldHeight
        self.emailTextField.frame = emailTextFieldFrame
        
        let emailFieldVerticalOffset = emailTextFieldFrame.height + verticalPadding
        availableBounds.origin.y += emailFieldVerticalOffset
        availableBounds.size.height -= emailFieldVerticalOffset
        
        var passwordTextFieldFrame = CGRect.zero
        passwordTextFieldFrame.origin.x = textFieldOriginX
        passwordTextFieldFrame.origin.y = availableBounds.minY
        passwordTextFieldFrame.size.width = textFieldWidth
        passwordTextFieldFrame.size.height = textFieldHeight
        self.passwordTextField.frame = passwordTextFieldFrame
        
        let passwordFieldVerticalOffset = passwordTextFieldFrame.height + verticalPadding
        availableBounds.origin.y += passwordFieldVerticalOffset
        availableBounds.size.height -= passwordFieldVerticalOffset
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
        User.authenticateUserWith(email: emailTextField.text ?? "", password: passwordTextField.text ?? "", completionHandler: { (user, error) in
            if let authenicatedUser = user {
                let houseViewController = HouseViewController.init(user: authenicatedUser)
                self.navigationController?.pushViewController(houseViewController, animated: true)
            }
            else if let authError = error {
                // TODO: show an error dialog
            }
        })
        
    }
    
    @objc func didPressSignUpInstead(_ sender: Any) {
        let signUpViewController = SignUpViewController.init(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    // MARK: - Private Variables
    
    private let verticalInset: CGFloat = 30
    private let verticalPadding: CGFloat = 10
    private let maxTextFieldWidth: CGFloat = 360
    
    private let textFieldHeight: CGFloat = 44
    
    private lazy var emailTextField: UITextField = {
        let emailTextField = UITextField.init(frame: CGRect.zero)
        emailTextField.borderStyle = .roundedRect
        emailTextField.placeholder = "Email"
//        usernameTextField.layer.borderColor = UIColor.red.cgColor
//        usernameTextField.layer.borderWidth = 1
        return emailTextField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField.init(frame: CGRect.zero)
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()
    
    private lazy var signInButton: UIButton = {
        let signInButton = UIButton.init(type: .system)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Sign In", for: .normal)
        return signInButton
    }()
    
    private lazy var signUpInstead: UIButton = {
        let signUpInstead = UIButton.init(type: .system)
        signUpInstead.translatesAutoresizingMaskIntoConstraints = false
        signUpInstead.setTitle("Sign Up Instead", for: .normal)
        return signUpInstead
    }()
}
