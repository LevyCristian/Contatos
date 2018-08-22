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

}
