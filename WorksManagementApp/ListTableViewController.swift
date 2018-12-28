//
//  ListTableViewController.swift
//  WorksManagementApp
//
//  Created by 大原一倫 on 2018/12/25.
//  Copyright © 2018 oharakazumasa. All rights reserved.
//

import UIKit
import RealmSwift

class ListTableViewController: UITableViewController {
    
    class Data: Object {
        @objc dynamic var subject = ""
        @objc dynamic var homeWork = ""
        @objc dynamic var date = ""
    }
    
    let saveData = UserDefaults.standard
    let colorSaveData = UserDefaults.standard
    let nowDate = Date()


    
    var taskDictonary: [Dictionary<String, [String: [String]]>] = []
    var keyArrays: [String] = []
    var allData: [Data] = []
    var afterData: [String] = []
    var colorNumber: Int = 0
    var parentArray:[[String: String]] = []
    var realm: Realm!
    
    @IBOutlet var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        table.allowsSelectionDuringEditing = true
        
        allData = Array(realm.objects(Data.self))
        let gettingData = allData.map{($0.date)}
        let orderedSet = NSOrderedSet(array: gettingData)
        afterData = orderedSet.array as! [String]
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        table.rowHeight = 70
        navigationItem.leftBarButtonItem = editButtonItem
    
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        if colorSaveData.object(forKey: "COLOR") != nil {
            colorNumber = colorSaveData.object(forKey: "COLOR") as! Int
        }

        
        switch colorNumber {
        case 0:
            self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            
        case 1:
            self.view.backgroundColor = #colorLiteral(red: 0.7931890626, green: 1, blue: 0.5290435264, alpha: 1)
            
        case 2:
            self.view.backgroundColor = #colorLiteral(red: 0.7074827594, green: 0.9915311623, blue: 1, alpha: 1)
            
        case 3:
            self.view.backgroundColor = #colorLiteral(red: 1, green: 0.7012115478, blue: 0.9455770609, alpha: 1)
            
        default:
            break
        }
        
        print(parentArray)
        tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return afterData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return taskDictonary.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) ->  String?{
        
        return (afterData as! String)
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        var AllData = Array(realm.objects(Data.self))
        
        cell.subjectLabel.text = AllData[indexPath.row].subject
        cell.dateLabel.text = AllData[indexPath.row].homeWork

        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let nowDate = Date()
        let addedDate = formatter.date(from: AllData[indexPath.row].date)

        
        if (nowDate.compare(addedDate!) == .orderedAscending) {
            cell.dateLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }else if (nowDate.compare(addedDate!) == .orderedSame) {
            cell.dateLabel.textColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        }else if (nowDate.compare(addedDate!) == .orderedDescending) {
            cell.dateLabel.textColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        }
        return cell
    }
    
//    削除＆移動
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.isEditing = editing
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool{
        return true
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle{
        return .delete
    }
    
    override func tableView(_ tableVIew: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool{
        return false
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourseIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            
            var AllData = Array(realm.objects(Data.self))
    
            let deleteData = AllData.remove(at: indexPath.row)
            
                try! realm.write() {
                    
                    realm.delete(deleteData)
                }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
