//
//  All_Friedns_TableViewCell.swift
//  vk
//
//  Created by Grisha Pospelov on 07.06.2021.
//

import UIKit

class All_Friedns_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var gerbImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    

    @IBAction func tapFunction(sender: UITapGestureRecognizer) {
        All_Friedns_TableViewCell.animate(withDuration: 0.75,
                                    delay: 0,
                                    usingSpringWithDamping: 1,
                                    initialSpringVelocity: 1,
                                    options: [.allowUserInteraction],
                                    animations: {
                                        self.gerbImageView.bounds = self.gerbImageView.bounds.insetBy(dx: 30, dy: 30)
                                    },
                                    completion: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let tap = UITapGestureRecognizer(target: self, action: #selector(All_Friedns_TableViewCell.tapFunction))
        gerbImageView.isUserInteractionEnabled = true
        gerbImageView.addGestureRecognizer(tap)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(user: User) {
        gerbImageView.image = UIImage(named: user.imageName ?? "defaultAvatar")
        nameLabel.text = user.name + " " + user.lastname
    }
}
