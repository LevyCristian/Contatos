//
//  ContatosViewController.swift
//  Contatos
//
//  Created by Ada 2018 on 17/08/2018.
//  Copyright © 2018 Academy. All rights reserved.
//

import UIKit
import CoreData

class ContatosViewController: UIViewController {

    var usuario: Usuario?
    var contato: Contato?
    var wasEdit: Int = -1

    var contaosArray = [Contato]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib.init(nibName: "ContatoCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "ContatoCell")
        contaosArray = getContatos()
    }

    func getContatos() -> [Contato] {
        guard let user = usuario, let contatos = user.contatos else { return []}
        return Array(contatos) as! [Contato]
    }

    override func viewWillAppear(_ animated: Bool) {
        wasEdit = -1
        contaosArray = getContatos()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is UINavigationController{
            let dest = segue.destination as! UINavigationController

            if dest.topViewController is AdicionarContatoViewController {
                let us = dest.topViewController as! AdicionarContatoViewController
                if wasEdit != -1{
                    us.contato = contaosArray[wasEdit]
                    
                }else{
                    us.usuario = sender as! Usuario
                }

                
            }
        }else {
            if segue.destination is VisualizarContatoViewController {
                let dest = segue.destination as! VisualizarContatoViewController
                dest.contatoRecebido = contato
            }
        }
    }
    
    @IBAction func addContato(_ sender: Any) {
        performSegue(withIdentifier: "addContato", sender: usuario)

    }

}

extension ContatosViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contaosArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContatoCell", for: indexPath) as! ContatoCell

        cell.nome.text = contaosArray[indexPath.row].nome
        cell.img.image = UIImage.init(data: contaosArray[indexPath.row].foto as! Data)
        cell.telefone.text = contaosArray[indexPath.row].telefone

        return cell

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        contato = contaosArray[indexPath.row]
        performSegue(withIdentifier: "vizualizarContato", sender: nil)
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete{
//            let context = DataManager.getContext()
//            let contato = self.contaosArray[indexPath.row]
//            context.delete(contato)
//
//            self.contaosArray.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//
//            do {
//                try context.save()
//            }catch {
//                print("Deu merda")
//            }
//        }
//
//    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { (rowAction, indexPath) in
            self.wasEdit = indexPath.row
            print(self.wasEdit)
            self.performSegue(withIdentifier: "addContato", sender: self.usuario)

        }
        editAction.backgroundColor = .blue

        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (rowAction, indexPath) in

            let context = DataManager.getContext()
            let contato = self.contaosArray[indexPath.row]
            context.delete(contato)

            self.contaosArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)

            do {
                try context.save()
            }catch {
                print("Deu merda")
            }
        }

        return [editAction, deleteAction]
    }
}
