//
//  MainViewController
//  Responder
//
//  Created by Jeff Chimney on 2018-12-12.
//  Copyright © 2018 Jeff Chimney. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var btnResponding: UIButton!
    @IBOutlet weak var btnNotResponding: UIButton!
    @IBOutlet weak var btnCallToHall: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var lblStatus: UILabel!
    
    @IBOutlet weak var btnRespondLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var btnRespondRightConstraint: NSLayoutConstraint!
    @IBOutlet weak var btnNotRespondingLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var btnNotRespondingRightConstraint: NSLayoutConstraint!
    @IBOutlet weak var btnCallToHallLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var btnCallToHallRightConstraint: NSLayoutConstraint!
    @IBOutlet weak var btnCancelRightConstraint: NSLayoutConstraint!
    @IBOutlet weak var btnCancelLeftConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnResponding.layer.cornerRadius = 12
        btnResponding.layer.borderWidth = 1
        btnResponding.layer.borderColor = UIColor.orange.cgColor
        
        btnNotResponding.layer.cornerRadius = 12
        btnNotResponding.layer.borderWidth = 1
        btnNotResponding.layer.borderColor = UIColor.orange.cgColor
        
        btnCallToHall.layer.cornerRadius = 12
        btnCallToHall.layer.borderWidth = 1
        btnCallToHall.layer.borderColor = UIColor.orange.cgColor
        
        btnCancel.layer.cornerRadius = 12
        btnCancel.layer.borderWidth = 1
        btnCancel.layer.borderColor = UIColor.orange.cgColor
        
        btnResponding.setBackgroundColor(for: .normal)
        btnNotResponding.setBackgroundColor(for: .normal)
        btnCallToHall.setBackgroundColor(for: .normal)
        btnCancel.setBackgroundColor(for: .highlighted)
    }

    @IBAction func btnRespondPressed(_ sender: Any) {
        btnResponding.toggleBackgroundColor()
        animateButtonsOffScreen()
        lblStatus.text = "Responding"
    }
    
    @IBAction func btnNotRespondingPressed(_ sender: Any) {
        btnNotResponding.toggleBackgroundColor()
        animateButtonsOffScreen()
        lblStatus.text = "Not Responding"
    }
    
    @IBAction func btnCallToHallPressed(_ sender: Any) {
        btnCallToHall.toggleBackgroundColor()
        UIView.animate(withDuration: 1) {
            self.btnCallToHall.setBackgroundColor(for: .normal)
        }
        lblStatus.text = "Call to Hall Sent"
    }
    
    @IBAction func btnCancelPressed(_ sender: Any) {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        btnResponding.setBackgroundColor(for: .normal)
        btnNotResponding.setBackgroundColor(for: .normal)
        btnCallToHall.setBackgroundColor(for: .normal)
        btnCancel.setBackgroundColor(for: .highlighted)
        animateButtonsOnScreen()
        lblStatus.text = "Action Cancelled"
    }
    
    func animateButtonsOffScreen() {
            self.btnNotRespondingLeftConstraint.constant = -200
            self.btnNotRespondingRightConstraint.constant = self.view.frame.width
            UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)

            self.btnRespondLeftConstraint.constant = -200
            self.btnRespondRightConstraint.constant = self.view.frame.width
            UIView.animate(withDuration: 0.75, delay: 0.15, usingSpringWithDamping: 5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        
            self.btnCallToHallLeftConstraint.constant = -200
            self.btnCallToHallRightConstraint.constant = self.view.frame.width
            UIView.animate(withDuration: 0.75, delay: 0.3, usingSpringWithDamping: 5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
                self.view.layoutIfNeeded()
            })
//        }
        
        self.btnCancelLeftConstraint.constant = 16
        self.btnCancelRightConstraint.constant = 16
        UIView.animate(withDuration: 0.75, delay: 0.3, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    func animateButtonsOnScreen() {
        self.btnCancelLeftConstraint.constant = 500
        self.btnCancelRightConstraint.constant = -500
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        })
        
        self.btnNotRespondingLeftConstraint.constant = 16
        self.btnNotRespondingRightConstraint.constant = 16
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        })
        
        self.btnRespondLeftConstraint.constant = 16
        self.btnRespondRightConstraint.constant = 16
        UIView.animate(withDuration: 0.5, delay: 0.25, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        })
        
        self.btnCallToHallLeftConstraint.constant = 16
        self.btnCallToHallRightConstraint.constant = 16
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        })
    }
}

