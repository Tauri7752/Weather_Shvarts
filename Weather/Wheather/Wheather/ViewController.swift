//
//  ViewController.swift
//  WheatherAppOpenkov-c31
//
//  Created by Student on 24.11.2021.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var cityTableView: UITableView!
    var cityArray: [String] = []
    var tempArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityArray.count
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: <#T##IndexPath#>) as! CityTableViewCell
        cell.cityNameLabel.text = cityArray[indexPath.row]
        cell.cityTempLabel.text = tempArray[indexPath.row]
        return cell
    }
    func getWeather(city: String) {
        let url = //Тут должна быть ссылка (но я не знаю,где её взять)
    AF.request(url, method: .get). validate().responeJSON { respone in
            switch respone.result {
            case .success(let value):
                let json = JSON(value
                print ("JSON: \(json)")
                self.cityArray.append(json["location"]["name"].stringValue)
                self.tempArray.append(json["current"]["temp_c"].stringValue)
                self.cityTableView.reloadData()
            case.failure(let error):
                print (error)
                }
}
                }
