//
//  ViewController.swift
//  WorksManagementApp
//
//  Created by 大原一倫 on 2018/12/25.
//  Copyright © 2018 oharakazumasa. All rights reserved.
//

//"""
//{ "20181201":
//    [["subject": "a","homeWork": "c", "date": "d"],
//    ["subject": "a","homeWork": "c", "date": "d"],
//    ["subject": "a","homeWork": "c", "date": "d"]]
//
//"20181203":
//    [[], [], []]
// "sectionNames": ["20181201", ]
//}
//"""

import UIKit
import RealmSwift


class Data: Object {
    @objc dynamic var subject = ""
    @objc dynamic var homeWork = ""
    @objc dynamic var date = ""
}

class ViewController: UIViewController {

    
    @IBOutlet var subjectTextField: UITextField!
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var homeWorkField: UITextField!
    
    var realm :Realm!
    var taskDictonary: [Dictionary<String, [String: String]>] = []
    var parentArray:[[String: String]] = []
    var normalArray:[Dictionary<String, String>] = []
    var datePicker: UIDatePicker = UIDatePicker()
    var timeInt: Int = 0
    var colorNumber: Int = 0
    
    let saveData = UserDefaults.standard
    let colorSaveData = UserDefaults.standard
    
    
    
    
    
    @IBAction func selectadd(){
        
        if subjectTextField.text == "" {
            
            let alart = UIAlertController(title: "エラー", message: "教科を入力してください", preferredStyle: .alert)
            alart.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alart, animated: true, completion: nil)
            
        }else if dateTextField.text == "" {
            
            let alart = UIAlertController(title: "エラー", message: "期限を入力してください", preferredStyle: .alert)
            alart.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alart, animated: true, completion: nil)
            
        }else if homeWorkField.text == ""{
            
            let alart = UIAlertController(title: "エラー", message: "宿題を入力してください", preferredStyle: .alert)
            alart.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alart, animated: true, completion: nil)
            
                }else{
            let recordData = Data()
            recordData.subject = String(subjectTextField.text!)
            recordData.homeWork = String(homeWorkField.text!)
            recordData.date = String(dateTextField.text!)

            try! realm.write {
                realm.add(recordData)
            }
            
//            let taskData = ["dateTextField.text!": ["subject": subjectTextField.text!,"homeWork": homeWorkField.text!, "date": dateTextField.text!]]
//            let newData = ["subject": subjectTextField.text!,"homeWork": homeWorkField.text!, "date": dateTextField.text!]
//            parentArray.append(newData)
//            saveData.set(parentArray, forKey: dateTextField.text!)
//
//                    taskDictonary.append(taskData)
//                    saveData.set(taskDictonary, forKey: "taskData")
            
            subjectTextField.text = ""
            homeWorkField.text = ""
            dateTextField.text = ""
            
            
                    let alart = UIAlertController(title: "完了", message: "保存が完了しました", preferredStyle: .alert)
                    alart.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alart, animated: true, completion: nil)
                }
            }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.timeZone = NSTimeZone.local
        datePicker.locale = Locale.current
        dateTextField.inputView = datePicker
        
        realm = try! Realm()
        
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        
        toolBar.setItems([spacelItem, doneItem], animated: true)
        
        dateTextField.inputView = datePicker
        dateTextField.inputAccessoryView = toolBar
        
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
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    @objc func done(){
        dateTextField.endEditing(true)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        dateTextField.text = "\(formatter.string(from: datePicker.date))"
    }


}

