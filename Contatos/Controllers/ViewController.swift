//
//  ViewController.swift
//  Contatos
//
//  Created by Ada 2018 on 14/08/2018.
//  Copyright © 2018 Academy. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var users = [Usuario]()
    var selected: Usuario?

    override func viewDidLoad() {

        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib.init(nibName: "UserCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "UserCell")
        update()
    }

    func update(){
        users.removeAll()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuario")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [Usuario] {
                //users.append(User(nome: data.value(forKey: "nome") as! String, img: data.value(forKey: "foto") as! Data, senha: data.value(forKey: "senha") as! String))
                users.append(data)
            }

        } catch {
            print("Failed")
        }
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ContatosViewController {
            let us = segue.destination as! ContatosViewController
            us.usuario = selected
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        update()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell

        cell.nome.text = users[indexPath.row].nome
        cell.img.image = UIImage.init(data: users[indexPath.row].foto as! Data)


        return cell

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = users[indexPath.row]
        performSegue(withIdentifier: "contatos", sender: nil)

    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            let context = DataManager.getContext()
            let usuario = users[indexPath.row]
            context.delete(usuario)

            self.users.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)

            do {
                try context.save()
            }catch {
                print("Deu merda")
            }
        }
    }
}
