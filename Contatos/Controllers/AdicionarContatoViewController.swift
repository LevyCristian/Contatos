//
//  AdicionarContatoViewController.swift
//  Contatos
//
//  Created by Ada 2018 on 17/08/2018.
//  Copyright © 2018 Academy. All rights reserved.
//

import UIKit
import CoreData

class AdicionarContatoViewController: UIViewController {

    var usuario: Usuario?

    var contato: Contato?
    
    @IBOutlet weak var img: UIImageView!

    @IBOutlet weak var nome: UITextField!

    @IBOutlet weak var telefone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if contato != nil{
            img.image = UIImage(data: contato?.foto as! Data)
            nome.text = contato?.nome
            telefone.text = contato?.telefone
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func done(_ sender: Any) {
        save()
        dismiss(animated: true, completion: nil)

    }
    func save() {

        let context = DataManager.getContext()
        if self.contato == nil{

            let contato = Contato(context: context)
            contato.nome = nome.text
            contato.foto = UIImagePNGRepresentation(#imageLiteral(resourceName: "img")) as! NSData
            contato.telefone = telefone.text

            usuario?.addToContatos(contato)
        }else{
            self.contato?.nome = nome.text
            self.contato?.foto = UIImagePNGRepresentation(#imageLiteral(resourceName: "img")) as! NSData
            self.contato?.telefone = telefone.text
        }

        do {
            try context.save()
        } catch {
            print("Deu merda")
        }
    }
   

}
