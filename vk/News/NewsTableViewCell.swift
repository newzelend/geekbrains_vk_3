//
//  NewsTableViewCell.swift
//  vk
//
//  Created by Grisha Pospelov on 22.06.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var pubDate: UILabel!
    @IBOutlet var newsText: UILabel!
    @IBOutlet var newsImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
   
    }
    
   
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

   
    }
    
 
    
    func configure(news: News) {
        
        userImage.image = UIImage(named: UserDataStorage.users.filter{ $0.id == news.userId}[0].imageName ?? "defaultAvatar")
        userName.text = String(UserDataStorage.users.filter{ $0.id == news.userId}[0].name + " " + UserDataStorage.users.filter{ $0.id == news.userId}[0].lastname)
        pubDate.text = news.date
        newsText.text = news.text
        newsImage.image = UIImage(named: news.imageName ?? "defaultNewsImage")

    }

}
