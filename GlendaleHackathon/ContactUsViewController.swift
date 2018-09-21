//
//  ContactUsViewController.swift
//  GlendaleHackathon
//
//  Created by Craig Scott on 9/21/18.
//  Copyright © 2018 Craig Scott. All rights reserved.
//

import UIKit
import MessageUI

class ContactUsViewController: UIViewController, MFMailComposeViewControllerDelegate, UITextFieldDelegate, UITextViewDelegate {

    
    @IBOutlet weak var questionTextField: UITextField!
    
    @IBAction func sendEmail(_ sender: UIButton) {
    
        let mailComposeViewController = configureMailComposer()
        if MFMailComposeViewController.canSendMail(){
            self.present(mailComposeViewController, animated: true, completion: nil)
        }else{
            print("Can't send email")
        }
    
    }
    
    func configureMailComposer() -> MFMailComposeViewController{
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        mailComposeVC.setToRecipients(["support@glendalecityhall"])
        mailComposeVC.setSubject("Feedback")
        mailComposeVC.setMessageBody(self.questionTextField.text!, isHTML: false)
        return mailComposeVC
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionTextField.delegate = self
        questionTextField.backgroundColor = UIColor.white
        questionTextField.textAlignment = .left
        questionTextField.contentVerticalAlignment = .top

        // Do any additional setup after loading the view.
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
