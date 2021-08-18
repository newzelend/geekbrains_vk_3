//
//  CarouselView.swift
//  vk
//
//  Created by Grisha Pospelov on 27.06.2021.
//

import UIKit

class CarouselView: UIImageView {

    private var leftView: UIImageView = {
        let leftView = UIImageView()
        leftView.translatesAutoresizingMaskIntoConstraints = false
        return leftView
    }()

    private var visibleView: UIImageView = {
        let visibleView = UIImageView()
        visibleView.translatesAutoresizingMaskIntoConstraints = false
        return visibleView
    }()

    private var rightView: UIImageView = {
        let rightView = UIImageView()
        rightView.translatesAutoresizingMaskIntoConstraints = false
        return rightView
    }()

    private var panGesture: UIPanGestureRecognizer?

    var imageNames: [String]?
    var visibleIndex: Int?
    
    private var beginCenterXVisibleView: CGFloat = 0
    private var beginCenterXRightView: CGFloat = 0
    private var beginCenterXLeftView: CGFloat = 0
    
    private var scaleIndex: CGFloat = 0.5

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setViews()
        setGesture()
        setImages()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setImages()
        beginCenterXVisibleView = visibleView.center.x
        beginCenterXRightView = rightView.center.x
        beginCenterXLeftView = leftView.center.x
        
        rightView.transform = CGAffineTransform(scaleX: scaleIndex, y: scaleIndex)
        leftView.transform = CGAffineTransform(scaleX: scaleIndex, y: scaleIndex)

        
    }

    private func setViews() {

        addSubview(leftView)
        addSubview(rightView)
        addSubview(visibleView)

        NSLayoutConstraint.activate([
            visibleView.widthAnchor.constraint(equalTo: self.widthAnchor),
            visibleView.heightAnchor.constraint(equalTo: self.widthAnchor),
            visibleView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            visibleView.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            leftView.widthAnchor.constraint(equalTo: self.widthAnchor),
            leftView.heightAnchor.constraint(equalTo: self.widthAnchor),
            leftView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            leftView.trailingAnchor.constraint(equalTo: visibleView.leadingAnchor, constant: -16),

            rightView.widthAnchor.constraint(equalTo: self.widthAnchor),
            rightView.heightAnchor.constraint(equalTo: self.widthAnchor),
            rightView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            rightView.leadingAnchor.constraint(equalTo: visibleView.trailingAnchor, constant: 16),
        ])
    }

    private func setGesture() {
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
        guard let gesture = panGesture else {
            print("panGesture is not initialized!")
            return
        }
        visibleView.addGestureRecognizer(gesture)
    }
    
    private func setImages() {
        
        guard visibleIndex != nil else {
            visibleIndex = 0
            return
        }
        
        if imageNames != nil {
            if imageNames!.count > visibleIndex! && visibleIndex! >= 0 {
                if imageNames!.isEmpty == false {
                    visibleView.image = UIImage(named: imageNames?[visibleIndex!] ?? "defaultAvatar")
                    leftView.image = UIImage(named: imageNames?[earlyIndex()] ?? "defaultAvatar")
                    rightView.image = UIImage(named: imageNames?[nextIndex()] ?? "defaultAvatar")
                }
            }
        } else {
            return
        }
    }
    
    @IBAction private func handlePan(recognizer: UIPanGestureRecognizer) {
        
        let translation = recognizer.translation(in: self.visibleView)
        
        visibleView.center.x = visibleView.center.x + translation.x
        leftView.center.x = leftView.center.x + translation.x
        rightView.center.x = rightView.center.x + translation.x
        
        self.rightView.transform = CGAffineTransform(scaleX: scaleIndex, y: scaleIndex)
        self.leftView.transform = CGAffineTransform(scaleX: scaleIndex, y: scaleIndex)

        
        recognizer.setTranslation(.zero, in: self.visibleView)

        if recognizer.state == .ended {
            let offset = beginCenterXVisibleView - visibleView.center.x
            if offset > 75 {
                startAnimate(.left)
            } else if offset < -75 {
                startAnimate(.right)
            } else {
                startAnimate(.revert)
            }
        }
    }

    private func nextIndex() -> Int {
        let lastIndex = imageNames!.count - 1
        if lastIndex == visibleIndex {
            return 0
        } else {
            return visibleIndex! + 1
        }
    }

    private func earlyIndex() -> Int {
        let lastIndex = imageNames!.count - 1
        if visibleIndex == 0 {
            return lastIndex
        } else {
            return visibleIndex! - 1
        }
    }

    private func startAnimate(_ direction: DirectionAnimation) {
        
        visibleView.isUserInteractionEnabled = false
        
        UIView.animate(withDuration: 0.25) {
            switch direction {
            case .revert:
                self.visibleView.center.x = self.beginCenterXVisibleView
                self.leftView.center.x = self.beginCenterXLeftView
                self.rightView.center.x = self.beginCenterXRightView
                self.leftView.transform = CGAffineTransform(scaleX: self.scaleIndex, y: self.scaleIndex)
                self.rightView.transform = CGAffineTransform(scaleX: self.scaleIndex, y: self.scaleIndex)
            case .left:
                self.visibleView.center.x = self.beginCenterXLeftView
                self.rightView.center.x = self.beginCenterXVisibleView
                self.rightView.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.visibleIndex = self.nextIndex()
            case .right:
                self.visibleView.center.x = self.beginCenterXRightView
                self.leftView.center.x = self.beginCenterXVisibleView
                self.leftView.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.visibleIndex = self.earlyIndex()
            }
        } completion: { _ in
            self.visibleView.isUserInteractionEnabled = true
            self.visibleView.center.x = self.beginCenterXVisibleView
            self.leftView.center.x = self.beginCenterXLeftView
            self.rightView.center.x = self.beginCenterXRightView
            self.setImages()
        }

    }

    enum DirectionAnimation {
        case left
        case right
        case revert
    }
}
