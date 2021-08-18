//
//  All_Groups_ViewController.swift
//  vk
//
//  Created by Grisha Pospelov on 06.06.2021.
//

import UIKit


final class All_Groups_ViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    
    var groups = groupsStorage.shared.groups
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addgroups(_ segue: UIStoryboardSegue) {
            guard
                let sourceController = segue.source as?AllGroups_ViewController,
                let indexPressedCell = sourceController.tabelView.indexPathForSelectedRow
            else {
                return
            }

            let group = sourceController.groups[indexPressedCell.row]

            if !groups.contains(where: { $0.name == group.name}) {
                groups.append(group)
                tableView.reloadData()
            }
        
        }
    
}
extension All_Groups_ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: All_Groups_TableViewCell.identifier, for: indexPath) as! All_Groups_TableViewCell
        
        cell.configure(groups[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Если была нажата кнопка «Удалить»
        if editingStyle == .delete {
            // Удаляем город из массива
            groups.remove(at: indexPath.row)
            // И удаляем строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
}

