//
//  CriarUserViewController.swift
//  Contatos
//
//  Created by Ada 2018 on 17/08/2018.
//  Copyright © 2018 Academy. All rights reserved.
//

import UIKit
import CoreData

class CriarUserViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var senha: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func done(_ sender: Any) {
        save()
        dismiss(animated: true, completion: nil)
    }

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    func save() {
        let context = DataManager.getContext()
        let newUser = Usuario(context: context)
        newUser.nome = nome.text
        newUser.foto = UIImagePNGRepresentation(#imageLiteral(resourceName: "img")) as! NSData
        newUser.senha = senha.text

//
//        let entity = NSEntityDescription.entity(forEntityName: "Usuario", in: context)
//
//        let newUser = NSManagedObject(entity: entity!, insertInto: context)
//
//
//        newUser.setValue(UIImagePNGRepresentation(#imageLiteral(resourceName: "img")), forKey: "foto")
//        newUser.setValue(nome.text, forKey: "nome")
//        newUser.setValue(senha.text, forKey: "senha")

        do {
            try context.save()
        } catch {
            print("Deu merda")
        }
    }


}
