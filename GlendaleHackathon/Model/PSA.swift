//
//  PSA.swift
//  GlendaleHackathon
//
//  Created by Craig Scott on 9/21/18.
//  Copyright © 2018 Craig Scott. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PSA{
    
    private(set) var announcementPSA : String?
    
    func getPSA(completed: @escaping DownloadComplete){
        Alamofire.request(PSA_API_URL).responseJSON { (response) in
            
            let result = response.result
            let json = JSON(result.value)
            
            self.announcementPSA = json["psa"].stringValue
            completed()
        }
    }
    
    
    
}
