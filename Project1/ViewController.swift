//
//  ViewController.swift
//  Project1
//
//  Created by Anthony Beckford on 10/10/22.
//
// A viewcontroller is just one screen of information


import UIKit
// This is apple main class class called ViewController
class ViewController: UITableViewController {
    var pictures = [String]()
    
    
    
    
    
    
// override is a method inside ViewContoller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // declares a constant called fm which assigns the value FileManager.default which is a built in system that lets us work with the file system
        let fm = FileManager.default
        
        // declares a  constant called path which assigns the value called Bundle.resourcePath. A bundle is a directory containing our compiled program and all the assets
        let path = Bundle.main.resourcePath!
        
        
        // declares a constant called items which assigns the value called fm.contentsOfDirectory
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        
        // This code loops through the items in the directory
        for item in items {
            // checks if it has the prefix of "nssl"
            if item.hasPrefix("nssl") {
                pictures.append(item)
                
            }
        }
        
        print(pictures)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }

}

