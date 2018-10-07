//
//  ViewController.swift
//  Simple Table
//
//  Created by Josh Elliott on 10/7/18.
//  Copyright © 2018 JoshElliott. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let dwarves = ["Sleepy", "Sneezy", "Bashful", "Happy",
                           "Doc", "Grumpy", "Dopey", "Thorin",
                           "Dorin", "Nori", "Ori", "Balin", "Dwalin",
                           "Fili", "Kili", "Oin", "Gloin", "Bifur",
                           "Bofur", "Bombur"]
    
    let simpleTableIdentifier = "SimpleTableIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK: -
    // MARK: Table View Data Source Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dwarves.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier)
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: simpleTableIdentifier)
        }
        
        let image = UIImage(named: "star")
        cell?.imageView?.image = image
        let highlightedImage = UIImage(named: "star2")
        cell?.imageView?.highlightedImage = highlightedImage
        
        if indexPath.row < 7 {
            cell?.detailTextLabel?.text = "Mr Disney"
        } else {
            cell?.detailTextLabel?.text = "Mr Tolkien"
        }
        
        cell?.textLabel?.text = dwarves[indexPath.row]
        cell?.textLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 120 : 70
    }
    
    // MARK: -
    // MARK: Table View Delegate Methods
    
    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return indexPath.row % 4
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath.row == 0 ? nil : indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowValue = dwarves[indexPath.row]
        let message = "You selected \(rowValue)"
        
        let controller = UIAlertController(title: "Row Selected",
                                           message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes I Did",
                                   style: .default, handler: nil)
        controller.addAction(action)
        present(controller, animated: true, completion: nil)
    }

}

