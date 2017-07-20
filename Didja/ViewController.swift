//
//  ViewController.swift
//  Didja
//
//  Created by Clark Barry on 6/22/17.
//  Copyright © 2017 learning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        button.setTitle("Red", for: .normal)
        button.addTarget(self, action: #selector(ViewController.didPressButton(_:)), for: .touchUpInside)
        
        button.sizeToFit()
        let buttonCenterXConstraint = NSLayoutConstraint.init(item: button, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: view, attribute: .centerXWithinMargins, multiplier: 1.0, constant: 0)
        let buttonCenterYConstraint = NSLayoutConstraint.init(item: button, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: view, attribute: .centerYWithinMargins, multiplier: 1.0, constant: 0)
        view.addSubview(button)
        
        tableButton.setTitle("Table", for: .normal)
        tableButton.addTarget(self, action: #selector(ViewController.didPressTableButton(_:)), for: .touchUpInside)
        
        let tableButtonCenterX = NSLayoutConstraint.init(item: tableButton, attribute: .centerX, relatedBy: .equal, toItem: button, attribute: .centerX, multiplier: 1.0, constant: 0)
        let tableButtonTop = NSLayoutConstraint.init(item: tableButton, attribute: .top, relatedBy: .equal, toItem: button, attribute: .bottom, multiplier: 1.0, constant: 40)
        view.addSubview(tableButton)
        
        view.addConstraints([buttonCenterXConstraint, buttonCenterYConstraint, tableButtonCenterX, tableButtonTop])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func didPressButton(_ sender: Any) {
        view.backgroundColor = UIColor.red
    }
    
    @objc func didPressTableButton(_ sender: Any) {
        
    }
    
    
    private lazy var button: UIButton = {
        let button = UIButton.init(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var tableButton: UIButton = {
        let button = UIButton.init(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

}

