//
//  ContactDetailsViewController.swift
//  TryCoreData
//
//  Created by Alcides Junior on 02/11/18.
//  Copyright © 2018 Alcides Junior. All rights reserved.
//

import UIKit
import CoreData
class ContactDetailsViewController: UIViewController {

    var detailContact = Contacts()
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.rowHeight = 80
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.title = "Details"
    }

}
extension ContactDetailsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactDetailsCell") as? ContactDetailsTableViewCell
        if indexPath.item == 0 {
            cell?.labelTop.text = "Nome"
            cell?.labelDescript.text = detailContact.nome
        }else if indexPath.item == 1{
            cell?.labelTop.text = "Telefone"
            cell?.labelDescript.text = detailContact.telefone
        }else{
            cell?.labelTop.text = "E-mail"
            cell?.labelDescript.text = detailContact.email
        }
        return cell!
    }
    
    
}
