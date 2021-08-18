//
//  All_Groups_TableViewCell.swift
//  vk
//
//  Created by Grisha Pospelov on 07.06.2021.
//
import UIKit

final class All_Groups_TableViewCell: UITableViewCell {
    static let identifier = "All_Groups_TableViewCell"
    @IBOutlet var name: UILabel!
    @IBOutlet var logo: UIImageView!
    @IBOutlet var UIView: UIView!
    
 
    
    func configure(_ group: Groups_Model) {
        logo.image = UIImage(systemName: group.image ?? "defaultAvatar")
        name.text = group.name
}

    
}

