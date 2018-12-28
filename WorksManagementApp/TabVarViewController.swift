//
//  TabVarViewController.swift
//  WorksManagementApp
//
//  Created by 大原一倫 on 2018/12/27.
//  Copyright © 2018 oharakazumasa. All rights reserved.
//

import UIKit

class TabVarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.4117647059, green: 0.4117647059, blue: 0.4117647059, alpha: 1)
        UITabBar.appearance().tintColor = #colorLiteral(red: 1, green: 0.9124162946, blue: 0.2001674107, alpha: 1)
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
