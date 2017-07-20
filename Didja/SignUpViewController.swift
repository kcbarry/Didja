//
//  SignUpViewController.swift
//  Didja
//
//  Created by Nikhil Bhatia-lin on 6/28/17.
//  Copyright © 2017 learning. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "BoardBackground"))
        self.title = "Sign Up"
        self.view.addSubview(firstNameTextField)
        self.view.addSubview(lastNameTextField)
        self.view.addSubview(emailTextField)
        self.view.addSubview(phoneTextField)
        self.view.addSubview(usernameTextField)
        self.view.addSubview(passwordTextField)
        
        signUpButton.addTarget(self, action: #selector(SignUpViewController.didPressSignUp(_:)), for: .touchUpInside)
        
        signUpButton.sizeToFit()
        let signUpButtonCenterXConstraint = NSLayoutConstraint.init(item: signUpButton, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: view, attribute: .centerXWithinMargins, multiplier: 1.0, constant: 0)
        let signUpButtonCenterYConstraint = NSLayoutConstraint.init(item: signUpButton, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: view, attribute: .centerYWithinMargins, multiplier: 1.0, constant: 180)
        view.addSubview(signUpButton)

        view.addConstraints([signUpButtonCenterXConstraint, signUpButtonCenterYConstraint])
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
        
        var firstNameTextFieldFrame = CGRect.zero
        firstNameTextFieldFrame.origin.x = textFieldOriginX
        firstNameTextFieldFrame.origin.y = availableBounds.minY
        firstNameTextFieldFrame.size.width = textFieldWidth
        firstNameTextFieldFrame.size.height = textFieldHeight
        self.firstNameTextField.frame = firstNameTextFieldFrame
        
        let textFieldVerticalOffset = firstNameTextFieldFrame.height + verticalPadding
        availableBounds.origin.y += textFieldVerticalOffset
        availableBounds.size.height -= textFieldVerticalOffset
        
        var lastNameTextFieldFrame = CGRect.zero
        lastNameTextFieldFrame.origin.x = textFieldOriginX
        lastNameTextFieldFrame.origin.y = availableBounds.minY
        lastNameTextFieldFrame.size.width = textFieldWidth
        lastNameTextFieldFrame.size.height = textFieldHeight
        self.lastNameTextField.frame = lastNameTextFieldFrame
        
        let lastNameVerticalOffset = lastNameTextFieldFrame.height + verticalPadding
        availableBounds.origin.y += lastNameVerticalOffset
        availableBounds.size.height -= lastNameVerticalOffset
        
        var emailTextFieldFrame = CGRect.zero
        emailTextFieldFrame.origin.x = textFieldOriginX
        emailTextFieldFrame.origin.y = availableBounds.minY
        emailTextFieldFrame.size.width = textFieldWidth
        emailTextFieldFrame.size.height = textFieldHeight
        self.emailTextField.frame = emailTextFieldFrame
        
        let emailVerticalOffset = emailTextFieldFrame.height + verticalPadding
        availableBounds.origin.y += emailVerticalOffset
        availableBounds.size.height -= emailVerticalOffset
    
        var phoneTextFieldFrame = CGRect.zero
        phoneTextFieldFrame.origin.x = textFieldOriginX
        phoneTextFieldFrame.origin.y = availableBounds.minY
        phoneTextFieldFrame.size.width = textFieldWidth
        phoneTextFieldFrame.size.height = textFieldHeight
        self.phoneTextField.frame = phoneTextFieldFrame
        
        let phoneVerticalOffset = phoneTextFieldFrame.height + verticalPadding
        availableBounds.origin.y += phoneVerticalOffset
        availableBounds.size.height -= phoneVerticalOffset
        
        var usernameTextFieldFrame = CGRect.zero
        usernameTextFieldFrame.origin.x = textFieldOriginX
        usernameTextFieldFrame.origin.y = availableBounds.minY
        usernameTextFieldFrame.size.width = textFieldWidth
        usernameTextFieldFrame.size.height = textFieldHeight
        self.usernameTextField.frame = usernameTextFieldFrame
        
        let usernameVerticalOffset = usernameTextFieldFrame.height + verticalPadding
        availableBounds.origin.y += usernameVerticalOffset
        availableBounds.size.height -= usernameVerticalOffset
        
        var passwordTextFieldFrame = CGRect.zero
        passwordTextFieldFrame.origin.x = textFieldOriginX
        passwordTextFieldFrame.origin.y = availableBounds.minY
        passwordTextFieldFrame.size.width = textFieldWidth
        passwordTextFieldFrame.size.height = textFieldHeight
        self.passwordTextField.frame = passwordTextFieldFrame
        
        let passwordVerticalOffset = passwordTextFieldFrame.height + verticalPadding
        availableBounds.origin.y += passwordVerticalOffset
        availableBounds.size.height -= passwordVerticalOffset
        
    }
    
    // MARK: - Object Functions
    
    @objc func didPressSignUp(_ sender: Any) {
        if let email = emailTextField.text,
            let password = passwordTextField.text,
            let phoneNumberString = phoneTextField.text,
            let firstName = firstNameTextField.text,
            let lastName = lastNameTextField.text
        {
            let displayName = firstName + " " + lastName
            User.createUserWith(email: email, displayName: displayName, password: password, phone: phoneNumberString, completionHandler: { (user, error) in
                if let createdUser = user {
                    let houseViewController = HouseViewController.init(user: createdUser)
                    self.navigationController?.pushViewController(houseViewController, animated: true)
                }
                else {
                    //TODO: display error
                }
            })
        }
        else {
            // Complain to the user that we dont have things
        }
    }
    
    // MARK: - Private Variables
    private let verticalInset: CGFloat = 30
    private let verticalPadding: CGFloat = 10
    
    private let maxTextFieldWidth: CGFloat = 360
    private let textFieldHeight: CGFloat = 44
    
    private lazy var firstNameTextField: UITextField = {
        let firstNameTextField = UITextField.init(frame: CGRect.zero)
        firstNameTextField.borderStyle = .roundedRect
        firstNameTextField.placeholder = "First Name"
        return firstNameTextField
    }()
    
    private lazy var lastNameTextField: UITextField = {
        let lastNameTextField = UITextField.init(frame: CGRect.zero)
        lastNameTextField.borderStyle = .roundedRect
        lastNameTextField.placeholder = "Last Name"
        return lastNameTextField
    }()
    
    private lazy var emailTextField: UITextField = {
        let emailTextField = UITextField.init(frame: CGRect.zero)
        emailTextField.borderStyle = .roundedRect
        emailTextField.placeholder = "Email"
        return emailTextField
    }()
    
    private lazy var phoneTextField: UITextField = {
        let phoneTextField = UITextField.init(frame: CGRect.zero)
        phoneTextField.borderStyle = .roundedRect
        phoneTextField.placeholder = "Phone"
        return phoneTextField
    }()
    
    private lazy var usernameTextField: UITextField = {
        let usernameTextField = UITextField.init(frame: CGRect.zero)
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.placeholder = "Username"
        return usernameTextField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField.init(frame: CGRect.zero)
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()
    
    private lazy var signUpButton: UIButton = {
        let signUpButton = UIButton.init(type: .system)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Sign Up", for: .normal)
        return signUpButton
    }()

}
