//
//  CustomNavigationController.swift
//  WorksManagementApp
//
//  Created by 大原一倫 on 2018/12/26.
//  Copyright © 2018 oharakazumasa. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    override init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?) {
        super.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
    }
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrnil: Bundle?){
//        super.init(nibName: nibNameOrNil, bundle: nibNameOrNil)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
