//
//  ViewController.swift
//  day07
//
//  Created by Мадина Кадырова on 8/21/22.
//

import UIKit
import RecastAI


class ViewController: UIViewController {

    var req : RecastAIClient?
    let url = "c80f802ac6dd241654df237385b351b5"
    
    @IBAction func tapButton(_ sender: UIButton) {
                    find_city(request: requestField.text!)
    }
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var requestField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        requestField.text = "city"
        self.req = RecastAIClient(token : url, language: "en")
    }
    
    
    func find_city(request: String){
            req?.textRequest(request, successHandler: { (response) in
                if let loc = response.all(entity: "location") {
                    let city = (loc[0]["formatted"] )
                    self.answer.text = "\(city!)"
                } else {
                    self.answer.text = "Doesn't exist"
                }
            }, failureHandle: { (error) in
                self.answer.text = "Error"
            })
        }

}

//extension ViewController: UISearchBarDelegate {
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        let urlStr = "http://api.weatherstack.com/current?access_key=c39abe5b70a7534b80dbf470fff1c8cb&query=\(searchBar.text)"
//
//        let url = URL (string: urlStr)
//
//        let task = URLSession.shared.dataTask(with: url!
//        ) { (data, response, error) in
//
//        }
//    }
//}
