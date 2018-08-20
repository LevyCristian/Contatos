//
//  Usuario+CoreDataProperties.swift
//  Contatos
//
//  Created by Ada 2018 on 20/08/2018.
//  Copyright © 2018 Academy. All rights reserved.
//
//

import Foundation
import CoreData


extension Usuario {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Usuario> {
        return NSFetchRequest<Usuario>(entityName: "Usuario")
    }

    @NSManaged public var foto: NSData?
    @NSManaged public var nome: String?
    @NSManaged public var senha: String?
    @NSManaged public var contatos: NSSet?

}

// MARK: Generated accessors for contatos
extension Usuario {

    @objc(addContatosObject:)
    @NSManaged public func addToContatos(_ value: Contato)

    @objc(removeContatosObject:)
    @NSManaged public func removeFromContatos(_ value: Contato)

    @objc(addContatos:)
    @NSManaged public func addToContatos(_ values: NSSet)

    @objc(removeContatos:)
    @NSManaged public func removeFromContatos(_ values: NSSet)

}
