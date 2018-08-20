//
//  Contato+CoreDataProperties.swift
//  Contatos
//
//  Created by Ada 2018 on 20/08/2018.
//  Copyright © 2018 Academy. All rights reserved.
//
//

import Foundation
import CoreData


extension Contato {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contato> {
        return NSFetchRequest<Contato>(entityName: "Contato")
    }

    @NSManaged public var foto: NSData?
    @NSManaged public var nome: String?
    @NSManaged public var telefone: String?
    @NSManaged public var usuario: Usuario?

}
