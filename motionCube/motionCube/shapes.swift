//
//  shapes.swift
//  motionCube
//
//  Created by Мадина Кадырова on 8/20/22.
//

import Foundation
import UIKit

enum shapes {
    case circle
    case square

    static let allFigures = [circle, square]
}

class Shape: UIView {
    let color: UIColor = UIColor(
        red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1.0)
    
   let figure = shapes.allFigures[Int(arc4random_uniform(UInt32(shapes.allFigures.count)))]
    static var figureSize: CGSize = CGSize(width: 100.0, height: 100.0)

    required init?(coder: NSCoder) {
        fatalError("init() wasn't implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        layer.cornerRadius = figure == shapes.circle ? CGFloat(max(Shape.figureSize.width, Shape.figureSize.width) / 2) : 0
        backgroundColor = color
    }
}
