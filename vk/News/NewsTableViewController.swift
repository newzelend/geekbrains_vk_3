//
//  NewsTableViewController.swift
//  vk
//
//  Created by Grisha Pospelov on 22.06.2021.
//

import UIKit

class NewsTableViewController: UITableViewController {

    var a: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return NewsDataStorage.news.count
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as? NewsTableViewCell
        else {
            return UITableViewCell()
        }
        
        cell.configure(news: NewsDataStorage.news[indexPath.row])

        return cell
    }

}

