//
//  FormContactViewController.swift
//  TryCoreData
//
//  Created by Alcides Junior on 31/10/18.
//  Copyright © 2018 Alcides Junior. All rights reserved.
//

import UIKit
import CoreData

class FormContactViewController: UIViewController {

    @IBOutlet weak var inputNome: UITextField!
    @IBOutlet weak var inputTelefone: UITextField!
    @IBOutlet weak var inputEmail: UITextField!
    var contactsRecords: ContactsRecords = ContactsRecords()
    //usado apenas quando for editavel
    var isEdited: Bool = false
    var editContact: Contacts?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        view.isOpaque = false
        if self.isEdited{
            setForm()
        }
        
    }
    private func setForm(){
        self.inputEmail.text = editContact?.email
        self.inputTelefone.text = editContact?.telefone
        self.inputNome.text = editContact?.nome
    }
    @IBAction func actionClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func actionSave(_ sender: Any) {
        if self.isEdited{
            contactsRecords.update(ForIdContact: (editContact?.idContact)!, FormNome: self.inputNome.text!, ForTelefone: self.inputTelefone.text!, ForEmail: self.inputEmail.text!)
            self.dismiss(animated: true, completion: nil)
        }else{
            contactsRecords.addContact(ForNome: self.inputNome.text!, telefone: self.inputTelefone.text!, email: self.inputEmail.text!)
            self.inputNome.text = ""
            self.inputTelefone.text = ""
            self.inputEmail.text = ""
        }
    }

}
