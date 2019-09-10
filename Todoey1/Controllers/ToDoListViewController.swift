//
//  ViewController.swift
//  Todoey1
//
//  Created by MooMyeong on 27/08/2019.
//  Copyright © 2019 Pymco. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    var itemArray = [Item]()
    let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    var isChecked: Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        loadItems()
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
     
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
         itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        saveItems()
        tableView.reloadData()
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
           self.saveItems()
            
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create a new Item"
           textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    func saveItems() {
        
        let encoder = PropertyListEncoder()
        do {
            
            let data = try encoder.encode(self.itemArray)
            try data.write(to: self.filePath!)
        } catch {
            print("Error encoding item array, \(error)")
        }
    }
    func loadItems() {
        do {
            let data = try? Data(contentsOf: filePath!)
            let decoder = PropertyListDecoder()
            itemArray = try decoder.decode([Item].self, from: data!)
        }  catch {
                print("Error decoding item array, \(error)")
            }
          
        }
       

    
}


