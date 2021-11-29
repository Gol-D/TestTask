//
//  ListViewController.swift
//  ITFrogTestTask
//
//  Created by Daniel Golovin on 23.11.2021.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var selectListBotton: UIButton!
    @IBOutlet weak var shortNameLabel: UILabel!
    
    var list:[String:String] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        tableViewOutlet.layer.cornerRadius = 5
        
        selectListBotton.clipsToBounds = true
        selectListBotton.layer.cornerRadius = 0.5 * selectListBotton.bounds.size.width
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableViewCell
        let citys = Array(list.keys)
        let years = Array(list.values)
        cell.detailTextLabel?.text = years[indexPath.row]
        cell.textLabel?.text = citys[indexPath.row]
        return cell
    }


}

