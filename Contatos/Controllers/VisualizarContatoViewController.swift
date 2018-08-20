//
//  VisualizarContatoViewController.swift
//  Contatos
//
//  Created by Ada 2018 on 17/08/2018.
//  Copyright © 2018 Academy. All rights reserved.
//

import UIKit

class VisualizarContatoViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var telefone: UILabel!

    var contatoRecebido: Contato?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let contato = contatoRecebido else {
            return
        }
        nome.text = contato.nome
        telefone.text = contato.telefone
        img.image = UIImage.init(data: contato.foto as! Data)
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    



}
