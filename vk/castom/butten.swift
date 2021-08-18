//
//  butten.swift
//  vk
//
//  Created by Grisha Pospelov on 22.06.2021.
//

import UIKit
import Foundation

class ViewsCounter: UIButton {
    
    var counter = Int.random(in: 99...999)
    
    // MARK: - UIButton
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setNeedsDisplay()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setNeedsDisplay()
    }
    
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        configure()
    }
    
    // MARK: - Internal methods
    
    private func configure() {

        self.setTitle("просмотров \(counter)", for: .normal)
        self.backgroundColor = UIColor.clear
        self.setTitleColor(UIColor.gray, for: .normal)
        self.clipsToBounds = true
        self.layer.cornerRadius = 4.0
        
    }
}

