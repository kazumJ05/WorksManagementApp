//
//  configrationViewController.swift
//  WorksManagementApp
//
//  Created by 大原一倫 on 2018/12/26.
//  Copyright © 2018 oharakazumasa. All rights reserved.
//

import UIKit

class configrationViewController: UIViewController {
    
    let colorSaveData = UserDefaults.standard
    
    var colorNumber: Int = 0
    
    
    
    @IBAction func select0(){
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        colorNumber = 0
        colorSaveData.set(colorNumber, forKey: "COLOR")
    }
    
    @IBAction func select1(){
        self.view.backgroundColor = #colorLiteral(red: 0.7931890626, green: 1, blue: 0.5290435264, alpha: 1)
        colorNumber = 1
        colorSaveData.set(colorNumber, forKey: "COLOR")
    }
    
    @IBAction func select2(){
        self.view.backgroundColor = #colorLiteral(red: 0.7074827594, green: 0.9915311623, blue: 1, alpha: 1)
        colorNumber = 2
        colorSaveData.set(colorNumber, forKey: "COLOR")
    }
    
    @IBAction func select3(){
        self.view.backgroundColor = #colorLiteral(red: 1, green: 0.7012115478, blue: 0.9455770609, alpha: 1)
        colorNumber = 3
        colorSaveData.set(colorNumber, forKey: "COLOR")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if colorSaveData.object(forKey: "COLOR") != nil{
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
