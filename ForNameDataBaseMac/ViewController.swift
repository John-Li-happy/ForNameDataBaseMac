//
//  ViewController.swift
//  ForNameDataBaseMac
//
//  Created by Zhaoyang Li on 3/13/21.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {

    @IBOutlet weak var nameTextField: NSTextField!
    
    @IBOutlet weak var ageTextField: NSTextField!
    
    @IBOutlet weak var tableView: NSTableView!
    
    var sampleData = Person.getSampleData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

    }

    override var representedObject: Any? {
        didSet {

        }
    }
    
    @IBAction func addButtonTapped(_ sender: NSButton) {
        let newName = nameTextField.stringValue
        let newAge = ageTextField.integerValue
        if newAge != 0, !newName.isEmpty {
            sampleData.append(Person(name: newName, age: newAge))
            tableView.reloadData()
        } else {
            print("error")
            let alert = NSAlert()
            alert.messageText = "there are something wrong with input"
            alert.addButton(withTitle: "Ok")
            alert.alertStyle = .warning
            alert.runModal()
        }
        nameTextField.stringValue = String()
        ageTextField.stringValue = String()
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return sampleData.count
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: "NameColume") {
            let cellID = NSUserInterfaceItemIdentifier("NameCell")
            guard let cellView = tableView.makeView(withIdentifier: cellID, owner: self) as? NSTableCellView else { return nil }
            cellView.textField?.stringValue = sampleData[row].name
            return cellView
        } else if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: "AgeColume") {
            let cellID = NSUserInterfaceItemIdentifier("AgeCell")
            guard let cellView = tableView.makeView(withIdentifier: cellID, owner: self) as? NSTableCellView else { return nil }
            cellView.textField?.stringValue = String(sampleData[row].age) 
            return cellView
        }
        
        return nil
    }

}

