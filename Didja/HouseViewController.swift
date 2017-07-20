//
//  HouseViewController.swift
//  Didja
//
//  Created by Nikhil Bhatia-lin on 7/14/17.
//  Copyright © 2017 learning. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    init (user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var user: User
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "BoardBackground"))
        self.title = "House List"
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
    
    
    private let cellIdentifier = "houseCell"
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
}
