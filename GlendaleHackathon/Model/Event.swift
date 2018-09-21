//
//  Events.swift
//  GlendaleHackathon
//
//  Created by Craig Scott on 9/21/18.
//  Copyright © 2018 Craig Scott. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Event {
    
    private(set) var eventDate : String?
    private(set) var eventName : String?
    private(set) var eventTime : String?
    
    init( eventDict : [String : Any]){
        if let date = eventDict["date"] as? String {
            eventDate = date
            
        }
        if let name = eventDict["name"] as? String {
            eventName = name
            
        }
        if let time = eventDict["time"] as? String {
            eventTime = time
            
        }
        
        
    }
    
    
}
