//
//  ViewController.swift
//  TryCoreData
//
//  Created by Alcides Junior on 31/10/18.
//  Copyright © 2018 Alcides Junior. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.rowHeight = 80
        }
    }
    var contacts = [Contacts]()
    var contact = Contacts()
    var contactsRecords: ContactsRecords = ContactsRecords()
    var editForm = false
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        populateTableView()
    }
    private func populateTableView(){
        contacts = (contactsRecords.allContacts())
        tableView.reloadData()
    }
    @IBAction func btnAddContact(_ sender: Any) {
        let modalViewController = FormContactViewController()
        modalViewController.modalPresentationStyle = .overCurrentContext
        performSegue(withIdentifier: "SegueFormContact", sender: sender)
    }
    
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell") as? TableViewCell
        cell?.labelNome.text = contacts[indexPath.item].nome
        cell?.labelTelefone.text = contacts[indexPath.item].telefone
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        contact = contacts[indexPath.item]
        performSegue(withIdentifier: "segueContactDetails", sender: self)
        
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let edit = UITableViewRowAction(style: .normal, title: "Edit") { (action, IndexPath) in
            guard let formController = self.storyboard?.instantiateViewController(withIdentifier: "StoryBoardFormContact") as? FormContactViewController else {return}
            formController.isEdited = true
            formController.editContact = self.contacts[indexPath.item]
            self.present(formController, animated: true, completion: nil)
        }
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, IndexPath) in
            self.contactsRecords.delete(ForIdContact: self.contacts[indexPath.item].idContact!)
            self.contacts.remove(at: indexPath.item)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        return [delete, edit]
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="segueContactDetails" {
            let detailsViewController = segue.destination as! ContactDetailsViewController
            detailsViewController.detailContact = contact
        }
    }
}

