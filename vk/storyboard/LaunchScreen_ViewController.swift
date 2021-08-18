//
//  LaunchScreen_ViewController.swift
//  vk
//
//  Created by Grisha Pospelov on 25.06.2021.
//

import UIKit

class LaunchScreen_ViewController: UIViewController {
    @IBOutlet var testView: UIView!
    @IBOutlet var testView_2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewOnTapped))
        testView_2.addGestureRecognizer(tap)
        testView_2.isUserInteractionEnabled = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        layerAnimation()
    }

    func animationTest() {

//        UIView.animate(withDuration: 2) {
//            let transform = CGAffineTransform(rotationAngle: .pi / 4)
//            self.testView.transform = transform
//        }
        UIView.animate(
            withDuration: 2,
            delay: 0,
            options: [.repeat, .autoreverse, .curveLinear]) {

            let rotate = CGAffineTransform(rotationAngle: .pi)
            let scale = CGAffineTransform(scaleX: 0.5, y: 2)
            let tranlation = CGAffineTransform(translationX: 10, y: 10)

            let rotateScale = rotate.concatenating(scale)
            let transform = rotateScale.concatenating(tranlation)

            self.testView_2.transform = transform
        }
    }

    func transitionAnimate() {
        // анимация для изменения свойств view
//        UIView.transition(
//            with: testView,
//            duration: 2,
//            options: [.repeat, .autoreverse, .curveLinear]) {
//            self.testView.backgroundColor = .black
//        } completion: { _ in
//            print("completion")
//        }

        UIView.transition(
            from: testView_2,
            to: testView,
            duration: 2,
            options: [.transitionFlipFromLeft, .repeat],
            completion: nil)
    }

    func layerAnimation() {
//        let animation = CABasicAnimation(keyPath: "position.y")
//        animation.fromValue = orangeView.layer.position.y + 100
//        animation.toValue = orangeView.layer.position.y - 100
//        animation.duration = 2
//        animation.beginTime = CACurrentMediaTime() + 2
//        animation.fillMode = .both
//        animation.isRemovedOnCompletion = false
//        orangeView.layer.add(animation, forKey: nil)

//        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
//        animation.beginTime = CACurrentMediaTime() + 2
//        animation.fromValue = 0.5
//        animation.toValue = 0
//        animation.duration = 2
//        animation.fillMode = .forwards
//        animation.isRemovedOnCompletion = false
//        orangeView.layer.add(animation, forKey: nil)

        let animation = CASpringAnimation(keyPath: "position.x")
        animation.fromValue = 100
        animation.toValue = 200
        animation.stiffness = 200
        animation.mass = 0.5
        animation.duration = 2
        testView_2.layer.add(animation, forKey: nil)
    }

    func apringAnimation() {
        UIView.animate(
            withDuration: 2,
            delay: 1,
            usingSpringWithDamping: 0.3,
            initialSpringVelocity: 0,
            options: [.curveLinear]) {

            let transform = CGAffineTransform(scaleX: 3, y: 3)
            self.testView_2.transform = transform
        }
    }

    @objc func viewOnTapped() {
        apringAnimation()
    }
}

