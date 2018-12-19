//
//  RespondingViewController
//  Responder
//
//  Created by Jeff Chimney on 2018-12-12.
//  Copyright © 2018 Jeff Chimney. All rights reserved.
//

import UIKit

class RespondingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var myInfo: Responder!
    var responders: [Responder] = []
    
    @IBOutlet weak var respondersTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myInfo = Responder(name: "Jeff Chimney", distance: "15 Kms", time: "15m")
        
        let responder1 = Responder(name: "Nick Fournier", distance: "10 kms", time: "23m")
        let responder2 = Responder(name: "Bryce Paterson", distance: "2 kms", time: "5m")
        let responder3 = Responder(name: "Andy King", distance: "3 kms", time: "3m")
        let responder4 = Responder(name: "Jason Strombolombp", distance: "1 km", time: "57s")
        let responder5 = Responder(name: "Todd Strilchiuk", distance: "45 kms", time: "1h")
        
        responders.append(responder1)
        responders.append(responder2)
        responders.append(responder3)
        responders.append(responder4)
        responders.append(responder5)
        
        respondersTableView.delegate = self
        respondersTableView.dataSource = self
        
        let nib = UINib.init(nibName: "ResponderCellView", bundle: nil)
        self.respondersTableView.register(nib, forCellReuseIdentifier: "responderCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return responders.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "My Status"
        } else {
            return "Responders"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "responderCell", for: indexPath) as! ResponderCell
        
        if indexPath.section == 0 {
            cell.lblName.text = myInfo.name
            cell.lblDistance.text = myInfo.distance
            cell.lblTime.text = myInfo.time
        } else {
            cell.lblName.text = responders[indexPath.row].name
            cell.lblDistance.text = responders[indexPath.row].distance
            cell.lblTime.text = responders[indexPath.row].time
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

