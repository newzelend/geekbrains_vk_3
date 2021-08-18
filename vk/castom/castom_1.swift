//
//  castom_1.swift
//  vk
//
//  Created by Grisha Pospelov on 14.06.2021.
import UIKit

 @IBDesignable class castom_1: UIView {

@IBInspectable var radius: CGFloat = 1 {
   didSet {
setNeedsDisplay()
}
}

override init(frame: CGRect) {
super.init(frame: frame)
}

    required init?(coder: NSCoder) {
super.init (coder: coder)
layer.borderWidth = 1
layer .borderColor = UIColor.black.cgColor
layer.cornerRadius = 20
//layer.masksToBounds = true
layer.shadowColor=UIColor.systemBlue.cgColor
layer.shadowOffset = CGSize(width: 10, height: 10)
layer.shadowRadius = 40
layer.shadowOpacity = 70
}
    
override func awakeFromNib(){
super.awakeFromNib()
}
override func layoutSubviews(){
super.layoutSubviews()
}

    
 }
