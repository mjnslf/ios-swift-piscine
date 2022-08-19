//
//  ViewController.swift
//  d05
//
//  Created by Мадина Кадырова on 8/18/22.
//

import UIKit

class TabViewController: UITabBarController {

    convenience init () {
        self.init()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 0
        
        // Do any additional setup after loading the view.
    }
    
    func showPin(data: String) {
        print(data)
    }


}

