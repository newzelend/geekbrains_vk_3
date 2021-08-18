//
//  AllGroups_ViewController.swift
//  vk
//
//  Created by Grisha Pospelov on 10.06.2021.
//

import UIKit



final class AllGroups_ViewController: UIViewController {
 
    @IBOutlet weak var tabelView: UITableView!
    
    var groups = groupsStorage.shared.allgroups
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabelView.dataSource = self
        tabelView.delegate = self
    }
}

extension AllGroups_ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: All_Groups_TableViewCell.identifier, for: indexPath) as! All_Groups_TableViewCell

        cell.configure(groups[indexPath.row])

        return cell
    }
}

