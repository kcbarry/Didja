//
//  TableViewController.swift
//  Didja
//
//  Created by Clark Barry on 6/22/17.
//  Copyright © 2017 learning. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let bounds = view.bounds
        tableView.frame = bounds
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        let text = "This is the cell for row " + String(indexPath.row)
        cell.textLabel?.text = text
        return cell
    }
    
    // MARK: - UITableViewDelegate 
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }
    
    
    private let cellIdentifier = "SomeString"
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
}
