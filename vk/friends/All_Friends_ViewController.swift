//
//  All_Friends_ViewController.swift
//  vk
//
//  Created by Grisha Pospelov on 06.06.2021.
//

import UIKit

extension Array where Element:Equatable {
    func removeDuplicates() -> [Element] {
        var result = [Element]()

        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }

        return result
    }
}

class All_Friends_ViewController: UITableViewController {
    
    var users = UserDataStorage.users
    private var firstLetters = [String]()
    private var sortedFriends = [[User]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        firstLetters = getFirstLetters(users)
        sortedFriends = sortFriends(users, letters: firstLetters)
    }
    
    private func sortFriends(_ users: [User], letters: [String]) -> [[User]] {
        var sortedFriends = [[User]]()
        
        letters.forEach { letter in
            let letterFriend = users.filter { String($0.lastname.prefix(1)) == letter }.sorted(by: {$0.lastname < $1.lastname})
            sortedFriends.append(letterFriend)
        }
        
        return sortedFriends
    }
    
    private func getFirstLetters(_ users: [User]) -> [String] {
        let userNames = users.map { $0.lastname }
        let firstLetters = userNames.map { String($0.prefix(1)) }.sorted()
        return firstLetters.removeDuplicates()
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sortedFriends.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedFriends[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "All_Friedns_TableViewCell") as? All_Friedns_TableViewCell
        else {
            return UITableViewCell()
        }
        
        let user = sortedFriends[indexPath.section][indexPath.row]
        
        cell.configure(user: user)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return firstLetters[section]
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let MorePhoto_CollectionViewController = segue.destination as? MorePhoto_CollectionViewController,
              let indexRow = tableView.indexPathForSelectedRow?.row
        else {
            return
        }
        
        let indexSection = tableView.indexPathForSelectedRow!.section
        
        MorePhoto_CollectionViewController.userId = sortedFriends[indexSection][indexRow].id
    }
    

}

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        firstLetters = getFirstLetters(users)
//        sortedFriends = sortFriends(users, letters: firstLetters)
//    }
//
//    private func sortFriends(_ users: [User], letters: [String]) -> [[User]] {
//        var sortedFriends = [[User]]()
////          sortedFriends
//        letters.forEach { letter in
//            let letterFriend = users.filter { String($0.lastname.prefix(1)) == letter }.sorted(by: {$0.lastname < $1.lastname})
//            sortedFriends.append(letterFriend)
//        }
//
//        return sortedFriends
//    }
//
//    private func getFirstLetters(_ users: [User]) -> [String] {
//        let userNames = users.map { $0.lastname }
//        let firstLetters = userNames.map { String($0.prefix(1)) }.sorted()
//        return firstLetters.removeDuplicates()
//    }
//
//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return sortedFriends.count
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return sortedFriends[section].count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        guard
//            let cell = tableView.dequeueReusableCell(withIdentifier: "All_Friedns_TableViewCell") as? All_Friedns_TableViewCell
//        else {
//            return UITableViewCell()
//        }
//
//        let user = sortedFriends[indexPath.section][indexPath.row]
//
//        cell.configure(user: user)
//
//        return cell
//    }
//
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return firstLetters[section]
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        guard let MorePhoto_CollectionViewController = segue.destination as? MorePhoto_CollectionViewController,
//              let indexRow = tableView.indexPathForSelectedRow?.row
//        else {
//            return
//        }
//
//        let indexSection = tableView.indexPathForSelectedRow!.section
//
//        MorePhoto_CollectionViewController.userID = sortedFriends[indexSection][indexRow].id
//    }
//
//}
//
//
//
//
//
//
//
//
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
 
//
//    var friends = FriendsStorage.shared.friends1
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if segue.identifier == "showFriendSegue",
//               let destinationController = segue.destination as? MorePhoto_ViewController,
//               let indexSelectedCell = tableView.indexPathForSelectedRow {
//                let friend = friends[indexSelectedCell.row]
//                destinationController.morephoto = friend.morephoto
//            }
//        }
//    }
//
//
//
//
//extension All_Friends_ViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        friends.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: All_Friedns_TableViewCell.identifier, for: indexPath) as! All_Friedns_TableViewCell
//
//        cell.configure(friends[indexPath.row])
//
//        return cell
//    }
//}
//
//
