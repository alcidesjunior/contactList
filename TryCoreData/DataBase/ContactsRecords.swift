//
//  ContactsRecords.swift
//  TryCoreData
//
//  Created by Alcides Junior on 03/11/18.
//  Copyright © 2018 Alcides Junior. All rights reserved.
//

import UIKit
import CoreData

class ContactsRecords: NSObject {
    var context: NSManagedObjectContext?
    override init() {
        self.context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    func addContact(ForNome nome:String, telefone: String, email:String){
        if let contactInserted = NSEntityDescription.insertNewObject(forEntityName: "Contacts", into: self.context!) as? Contacts{
                contactInserted.idContact = String(NSDate().timeIntervalSince1970)
                contactInserted.nome = nome
                contactInserted.telefone = telefone
                contactInserted.email = email
            
                try? context!.save()
            }
    }
    
    func allContacts()->[Contacts]{
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Contacts")
        do{
            let contactsData = try context!.fetch(request) as! [Contacts]
            return contactsData
        }catch{
            fatalError("Error \(error)")
        }
    }
    
    func update(ForIdContact idContact: String , FormNome nome: String, ForTelefone telefone: String, ForEmail email: String){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Contacts")
        request.predicate = NSPredicate(format: "idContact = %@", idContact)
        do{
            let contactFetch = try context?.fetch(request)
            let currentContact = contactFetch![0] as? NSManagedObject
            
            currentContact!.setValuesForKeys(["nome": nome, "telefone": telefone, "email": email])
            try? context?.save()
        }catch{
            print(error)
        }
    }
    func delete(ForIdContact idContact: String){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Contacts")
        request.predicate = NSPredicate(format: "idContact = %@", idContact)
        do{
            let contactFetch = try context?.fetch(request)
            let currentContact = contactFetch![0] as? NSManagedObject
            context?.delete(currentContact!)
            try? context?.save()
        }catch{
            print(error)
        }
    }
    
}
