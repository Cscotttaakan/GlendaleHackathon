//
//  GlendaleMainViewController.swift
//  GlendaleHackathon
//
//  Created by Craig Scott on 9/21/18.
//  Copyright © 2018 Craig Scott. All rights reserved.
//

import UIKit

class GlendaleMainViewController: UIViewController {
    @IBOutlet weak var PSALabel: UILabel!
    private var psa : PSA!
    private var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        scheduledTimerWithTimeInterval()
        psa = PSA()
        

        // Do any additional setup after loading the view.
    }
    
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: Selector(("updatePSA")), userInfo: nil, repeats: true)
    }
    
    @objc func updatePSA(){
        psa.getPSA {
            self.updateUI()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func updateUI(){
        
        DispatchQueue.main.async {
            if let label = self.psa.announcementPSA{
                self.PSALabel.text = "PSA : \(label)"
            }
        }
        
    }

}
