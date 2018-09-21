//
//  EventsViewController.swift
//  GlendaleHackathon
//
//  Created by Craig Scott on 9/21/18.
//  Copyright © 2018 Craig Scott. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class EventsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var eventsArray : [Event] = [Event]()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        downloadEvents {
            print("Data Downloaded")
        }
        callDelegate()
        
        tableView.rowHeight = UITableView.automaticDimension
        // Similarly, you can set for header & footer
        tableView.sectionFooterHeight = UITableView.automaticDimension
        
        // Do any additional setup after loading the view.
    }
    
    func callDelegate(){
        tableView.delegate = self
        tableView.dataSource = self
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func downloadEvents(completed: @escaping DownloadComplete ){
        Alamofire.request(EVENTS_API_URL).responseJSON { (response) in
            let result = response.result
            
            if let eventsDictionary = response.value as? [String : Any] {
                if let list = eventsDictionary["events"] as? [[String : Any]] {
                    for item in list {
                        let event = Event(eventDict: item)
                        self.eventsArray.append(event)
                    }
                    self.tableView.reloadData()
                }
            }
            
            /* let result = response.result
            
            if let dictionary = result.value as? [String : Any] {
                if let list = dictionary[JSONConstants.forecastList] as? [[String : Any]] {
                    for item in list {
                        let forecast = ForecastWeather(weatherDict: item)
                        self.forecastArray.append(forecast)
                    }
                    self.tableView.reloadData()
                }
            }
            completed()
 */
        }
    }

}

extension EventsViewController : UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventsCell") as! EventsCell
        cell.configureCell(event: eventsArray[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsArray.count
    }
    
    
    
}

