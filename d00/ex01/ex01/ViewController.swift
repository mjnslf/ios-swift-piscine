//
//  ViewController.swift
//  ex01
//
//  Created by Мадина Кадырова on 8/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hello_text: UILabel!
    
    @IBAction func press_button(_ sender: UIButton) {
        hello_text.text = "Hello, world!"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

