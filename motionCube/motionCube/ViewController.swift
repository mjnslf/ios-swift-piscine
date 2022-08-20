//
//  ViewController.swift
//  motionCube
//
//  Created by Мадина Кадырова on 8/20/22.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collish: UICollisionBehavior!
    var bouncingBehavior  : UIDynamicItemBehavior!
    var motionManager = CMMotionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        initAnimator()
        
        //animator = UIDynamicAnimator(referenceView: view)
        setupMotion()
        // Do any additional setup after loading the view.
        //let tap = UITapGestureRecognizer(target: self, action: )
    }
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
            let loc = sender.location(in: view)
            let frame = CGRect(
                x: loc.x - Shape.figureSize.width / 2,
                y: loc.y - Shape.figureSize.height / 2,
                width: Shape.figureSize.width,
                height: Shape.figureSize.height)
            let el = Shape(frame: frame)
            el.isUserInteractionEnabled = true
            el.clipsToBounds = true
            view.addSubview(el)
        
        el.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(movementHandler(recognizer:))))
        //el.addGestureRecognizer(UIPinchGestureRecognizer(target: self, action: #selector(zoomHandler(recognizer:))))
        el.addGestureRecognizer(UIRotationGestureRecognizer(target: self, action: #selector(rotationHandler(recognizer:))))
        addAnimatorAndBehaviors(item: el)
        }

    private func initAnimator() {
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior()
        
        animator.addBehavior(gravity)
        collish = UICollisionBehavior()
        collish.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collish)
        bouncingBehavior = UIDynamicItemBehavior()
        bouncingBehavior.elasticity = 0.05
        animator.addBehavior(bouncingBehavior)
    }
    private func addAnimatorAndBehaviors(item: Shape) {
        gravity.addItem(item)
        collish.addItem(item)
        bouncingBehavior.addItem(item)
    }


    @objc private func movementHandler(recognizer: UIPanGestureRecognizer) {
        guard let figure = recognizer.view else { return }
        switch recognizer.state {
            case .began:
                gravity.removeItem(figure)
            case .changed:
                figure.center = recognizer.location(in: figure.superview)
                animator.updateItem(usingCurrentState: figure)
            case .ended:
                gravity.addItem(figure)
            default:
                break
        }
    }
}


extension ViewController {
//    @objc private func zoomHandler(recognizer: UIPinchGestureRecognizer) {
//        guard let figure = recognizer.view else { return }
//        switch recognizer.state {
//            case .began:
//                animationsOff(toggle: true, target: figure)
//            case .changed:
//
//                recognizer.scale = 1
//            case .ended:
//                animationsOff(toggle: false, target: figure)
//            default:
//                break
//        }
//    }
    
    @objc private func rotationHandler(recognizer: UIRotationGestureRecognizer) {
        guard let figure = recognizer.view else { return }
        switch recognizer.state {
        case .began:
            animationsOff(toggle: true, target: figure)
        case .changed:
            figure.transform = figure.transform.rotated(by: recognizer.rotation)
            animator.updateItem(usingCurrentState: figure)
            recognizer.rotation = 0
        case .ended:
            animationsOff(toggle: false, target: figure)
        default:
            break
        }
    }
}

extension ViewController {
    private func setupMotion() {
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.1
            motionManager.startAccelerometerUpdates(to: OperationQueue.main) { (data, error) in
                self.gravity.gravityDirection = CGVector(dx: (data?.acceleration.x)!, dy: -1 * (data?.acceleration.y)!)
            }
        }
    }
    
    private func animationsOff(toggle: Bool, target: UIView) {
        toggle ? gravity.removeItem(target) : gravity.addItem(target)
        toggle ? collish.removeItem(target) : collish.addItem(target)
        toggle ? bouncingBehavior.removeItem(target) : bouncingBehavior.addItem(target)
    }
}
