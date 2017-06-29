//
//  SignInViewController.swift
//  Didja
//
//  Created by Nikhil Bhatia-lin on 6/28/17.
//  Copyright © 2017 learning. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "BoardBackground"))
        self.title = "Sign In"
        self.view.addSubview(usernameTextField)
        self.view.addSubview(passwordTextField)
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
        
        var usernameTextFieldFrame = CGRect.zero
        usernameTextFieldFrame.origin.x = textFieldOriginX
        usernameTextFieldFrame.origin.y = availableBounds.minY
        usernameTextFieldFrame.size.width = textFieldWidth
        usernameTextFieldFrame.size.height = textFieldHeight
        self.usernameTextField.frame = usernameTextFieldFrame
        
        let textFieldVerticalOffset = usernameTextFieldFrame.height + verticalPadding
        availableBounds.origin.y += textFieldVerticalOffset
        availableBounds.size.height -= textFieldVerticalOffset
        
        var passwordTextFieldFrame = CGRect.zero
        passwordTextFieldFrame.origin.x = textFieldOriginX
        passwordTextFieldFrame.origin.y = availableBounds.minY
        passwordTextFieldFrame.size.width = textFieldWidth
        passwordTextFieldFrame.size.height = textFieldHeight
        self.passwordTextField.frame = passwordTextFieldFrame
        
        let passwordFieldVerticalOffset = passwordTextFieldFrame.height + verticalPadding
        availableBounds.origin.y += passwordFieldVerticalOffset
        availableBounds.size.height -= passwordFieldVerticalOffset
        
        //TODO: Make a sign in button
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Private Variables
    
    private let verticalInset: CGFloat = 30
    private let verticalPadding: CGFloat = 10
    private let maxTextFieldWidth: CGFloat = 360
    
    private let textFieldHeight: CGFloat = 44
    
    private lazy var usernameTextField: UITextField = {
        let usernameTextField = UITextField.init(frame: CGRect.zero)
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.placeholder = "Username"
//        usernameTextField.layer.borderColor = UIColor.red.cgColor
//        usernameTextField.layer.borderWidth = 1
        return usernameTextField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField.init(frame: CGRect.zero)
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()
}
