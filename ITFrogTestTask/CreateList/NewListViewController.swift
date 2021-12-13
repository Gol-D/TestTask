//
//  NewListViewController.swift
//  ITFrogTestTask
//
//  Created by Daniel Golovin on 26.11.2021.
//

import UIKit
import CoreData

class NewListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var checkTableView: UITableView!
    @IBOutlet weak var colorsPalette: UICollectionView!
    @IBOutlet weak var shortNameOutlet: UITextField!
    @IBOutlet weak var longNameOutlet: UITextField!
    
    let colorArray = [0x574d68, 0xfA38560, 0xC6A15B, 0xF2E86D, 0xD3DFB8, 0xE0607E, 0x9381FF, 0xB8B8FF, 0x70B6D7, 0xA0B964, 0x6347FF, 0x28CC98]
    
    var list = ["Париж":"III век до н. э.", "Вена":"1147 год", "Берлин":"1237 год", "Варшава":"1321 год", "Милан":"1899 год"]
    
    var listSettings = List()
    
    
    var shortName: String = ""
    var longName: String = ""
    var colors: UIColor?
    var listArray: [String:String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkTableView.delegate = self
        checkTableView.dataSource = self
        colorsPalette.delegate = self
        colorsPalette.dataSource = self
        colorsPalette.layer.cornerRadius = 25
        checkTableView.allowsMultipleSelection = true
        checkTableView.allowsMultipleSelectionDuringEditing = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<List> = List.fetchRequest()
        
        do {
            
        } catch let error {
            error.localizedDescription
        }
        
    }

    func uiColorFromHex(rgbValue: Int) -> UIColor {
        
        let red =   CGFloat((rgbValue & 0xFF0000) >> 16) / 0xFF
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 0xFF
        let blue =  CGFloat(rgbValue & 0x0000FF) / 0xFF
        let alpha = CGFloat(1.0)
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckCell", for: indexPath) as! CheckTableViewCell
        let citys = Array(list.keys)
        let age = Array(list.values)
        cell.textLabel?.text = citys[indexPath.row]
        cell.detailTextLabel?.text = age[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorsCell", for: indexPath) as! ColorsPaletteCollectionViewCell
        cell.backgroundColor = uiColorFromHex(rgbValue: colorArray[indexPath.row])
        cell.layer.cornerRadius = cell.frame.width / 2
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.layer.borderWidth = 5
            cell.layer.borderColor = CGColor(gray: 0.2, alpha: 1.0)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.layer.borderWidth = 0
        }
    }
    
    @IBAction func saveButton(_ sender: Any) {
    }
    @IBAction func shortNameTextField(_ sender: Any) {
    }
    @IBAction func longNameTextField(_ sender: Any) {
    }
}
