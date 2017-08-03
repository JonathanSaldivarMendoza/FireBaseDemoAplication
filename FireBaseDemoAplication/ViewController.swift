//
//  ViewController.swift
//  FireBaseDemoAplication
//
//  Created by Jonathan Saldivar on 02/08/17.
//  Copyright © 2017 JonathanSaldivar. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var ref: DatabaseReference?
    var handle: DatabaseHandle?
    var dataSource: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        handle = ref?.child("list").observe(.childAdded, with: { (snapshot) in
            if let item = snapshot.value as? String {
                self.dataSource.append(item)
                self.tableView.reloadData()
            }
        })
        
        
    }


    // Saving item into a database
    
    @IBAction func sendButtomPress(_ sender: Any) {
        
        ref?.child("list").childByAutoId().setValue(textField.text)
        
        if textField.text != nil{
            
            textField.text = ""
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selecciono \(indexPath.row)")
    }

}

