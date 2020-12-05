//
//  UsersView.swift
//  DigiproTest
//
//  Created by Alejandro Robles on 05/12/20.
//

import UIKit
import CoreData

class UsersController: UITableViewController {
    
    var dataForm: [Form]?

    //MARK: - Life cycle
    override func viewDidAppear(_ animated: Bool) {
        fetchForm()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Usuarios"
    }

    // MARK: - TableView
    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataForm?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
        if (indexPath.row == 0){
            cell.textLabel?.text = "Nombre:"
            cell.detailTextLabel?.text = "\(dataForm?[indexPath.section].name ?? "")"
            
        }
        else if(indexPath.row == 1){
            cell.textLabel?.text = "Apellido Paterno:"
            cell.detailTextLabel?.text = "\(dataForm?[indexPath.section].lastName ?? "")"
        }
        else if (indexPath.row == 2){
            cell.textLabel?.text = "Apellido Materno:"
            cell.detailTextLabel?.text = "\(dataForm?[indexPath.section].maternalSurname ?? "")"
        }
        else if (indexPath.row == 3){
            cell.textLabel?.text = "Correo electrónico:"
            cell.detailTextLabel?.text = "\(dataForm?[indexPath.section].email ?? "")"
        }
        else if (indexPath.row == 4){
            cell.textLabel?.text = "Teléfono:"
            cell.detailTextLabel?.text = "\(dataForm?[indexPath.section].phone ?? "")"
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }

    //MARK: - Functions
    func fetchForm(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            dataForm = try context.fetch(Form.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch{
            print(error.localizedDescription)
        }
    }
}
