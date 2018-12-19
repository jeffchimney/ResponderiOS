//
//  SettingsViewController
//  Responder
//
//  Created by Jeff Chimney on 2018-12-12.
//  Copyright © 2018 Jeff Chimney. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var btnSubmit: UIButton!
    
    // 0 - 5 is firehall id, 6 - 7 is user id
    @IBOutlet var txtLoginFields: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnSubmit.layer.cornerRadius = 12
        btnSubmit.layer.borderWidth = 1
        btnSubmit.layer.borderColor = UIColor.orange.cgColor
        btnSubmit.setBackgroundColor(for: .normal)
        
        let loginString = UserDefaultsHelper.get(string: "loginString")
        var loginStringArray: [String] = []
        for character in loginString {
            loginStringArray.append(String(character))
        }
        for txtField in txtLoginFields {
            txtField.delegate = self
            if loginString != "" {
                txtField.text = loginStringArray[txtField.tag]
            }
        }
    }
    
    @IBAction func btnSubmitPressed(_ sender: Any) {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        var loginString = ""
        for textField in txtLoginFields {
            if textField.text != "" {
                loginString.append(contentsOf: textField.text!)
            } else {
                return
            }
        }
        
        UserDefaultsHelper.set(loginString: loginString)
        tabBarController?.selectedIndex = 0
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.text = string
        
        if textField.text != "" {
            if textField.tag < 7 {
                txtLoginFields[textField.tag + 1].becomeFirstResponder()
            } else if textField.tag == 7 {
                textField.resignFirstResponder()
            }
        } else if textField.tag > 0 && textField.text == "" {
            txtLoginFields[textField.tag - 1].becomeFirstResponder()
        }
        
        return false
    }

}

