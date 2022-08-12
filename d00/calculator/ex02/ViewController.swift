//
//  ViewController.swift
//  calc
//
//  Created by Мадина Кадырова on 8/10/22.
//

import UIKit

class ViewController: UIViewController {

    var numOfscreen:Int = 0;
    var firstDigit:Int = 0;
    var sign:Bool = false;
    var operation:Int = 0;
    
    @IBOutlet weak var result: UILabel!
    @IBAction func numbers(_ sender: UIButton) {
        if sign == true {
            result.text = String(sender.tag)
            sign = false
        } else if result.text == "0" {
            result.text = String(sender.tag)
        } else if (result.text)?.count == 10 {
            result.text = "error..too maany"
        } else {
            result.text = result.text! + String(sender.tag)
        }
        numOfscreen = Int(result.text!)!
    }
    
    
    @IBAction func operations(_ sender: UIButton) {
        if result.text != ""  && sender.tag > 12 && sender.tag < 17 {
            firstDigit = Int(result.text!)!
            
            if sender.tag == 13 { // Division
                result.text = "/";
            }
            else if sender.tag == 14 { // multiply
                result.text = "*";
            }
            else if sender.tag == 15 { // minus
                result.text = "-";
            }
            else if sender.tag == 16 { // plus
                result.text = "+";
            }
            operation = sender.tag
            sign = true;
        }
        else if sender.tag == 17 { //equal
            if operation == 13 {
                if numOfscreen != 0 {
                result.text = String(firstDigit / numOfscreen)
                } else {
                    result.text = "error"
                    firstDigit = 0
                    operation = 0
                    numOfscreen = 0
                }
            }
            else if operation == 14 {
                result.text = String(firstDigit * numOfscreen)
            }
            else if operation == 15 {
                result.text = String(firstDigit - numOfscreen)
            }
            else if operation == 16 {
                result.text = String(firstDigit + numOfscreen)
            }
        }
        else if sender.tag == 10 {
            result.text = "0"
            firstDigit = 0
            operation = 0
            numOfscreen = 0
        }
        else if sender.tag == 11 {
            if result.text != "0" {
                result.text = String(Int(result.text!)! * (-1))
            } else {
                result.text = "error"
                firstDigit = 0
                operation = 0
                numOfscreen = 0
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

