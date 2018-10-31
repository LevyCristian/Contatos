//
//  DataManager.swift
//  Contatos
//
//  Created by Ada 2018 on 17/08/2018.
//  Copyright © 2018 Academy. All rights reserved.
//

import CoreData
import UIKit

class DataManager {

     class func getContext () -> NSManagedObjectContext {
        let appDelegate = (UIApplication.shared).delegate as! AppDelegate
        return  appDelegate.persistentContainer.viewContext
    }
     class func executeThe(query: NSPredicate, forEntityName entity: String ) -> [NSManagedObject]{
        let context = self.getContext()
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        request.predicate = query
        //request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            return result as! [NSManagedObject]
            
        } catch {
            print("Failed query")
        }
        return []
        
}

}
