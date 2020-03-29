//
//  ViewController.swift
//  Todoey
//
//  Created by Darren Rambaud on 03/28/2020.
//  Copyright (c) 2020 Darren Rambaud. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    var items = ["get lemons", "buy eggs"]

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
    
    // MARK - Table View Delegate Methods
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = cell.accessoryType == .none ? .checkmark : .none
        }
        tableView.deselectRow(at: indexPath, animated: true) // Not performing the fade out effect?
    }
    
    // MARK - Add New Items
    
    @IBAction func addItemPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // once the user clicks button, send request to api
            if let item = textField.text {
                self.items.append(item)
                self.tableView.reloadData()
            }
        }
        
        alert.addTextField { (alertText) in
            alertText.placeholder = "Create new item"
            textField = alertText
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

