//
//  ViewController.swift
//  Todoey
//
//  Created by Darren Rambaud on 03/28/2020.
//  Copyright (c) 2020 Darren Rambaud. All rights reserved.
//

import UIKit
//import K

class TodoListViewController: UITableViewController {
    
    let items = ["get lemons", "buy eggs"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK - Table View Data Source Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let c = tableView.dequeueReusableCell(withIdentifier: K.Identifiers.TODO_ITEM_CELL_IDENTIFIER, for: indexPath)
        if let g = c.textLabel {
            g.text = items[indexPath.row]
        }
        return c
    }
    
}

