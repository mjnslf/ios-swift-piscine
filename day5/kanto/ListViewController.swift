//
//  ListViewController.swift
//  kanto
//
//  Created by Мадина Кадырова on 8/18/22.
//

import UIKit

class ListViewController: UITableViewController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 20
        tableView.rowHeight = UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "locationCell")
        cell?.textLabel?.text = locationData[indexPath.row].title
        //cell?.detailTextLabel?.text = locationData[indexPath.row].title
        return cell!
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let res = self.tabBarController?.viewControllers?.first as! MapViewController
        res.showPin(pinNum: indexPath.row)
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
