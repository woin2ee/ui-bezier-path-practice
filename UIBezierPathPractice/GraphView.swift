//
//  GraphView.swift
//  UIBezierPathPractice
//
//  Created by Jaewon Yun on 2022/12/23.
//

import UIKit

class GraphView: UIView {
    
    var values: [Double] = [] {
        didSet { self.setNeedsDisplay() }
    }
    var drawingValues: [Double] {
        guard let maxValue = values.max() else { return [] }
        return values.map { maxValue - $0 }
    }
    
    var lineWidth: CGFloat = 3.0 {
        didSet { self.setNeedsDisplay() }
    }
    
    convenience init(frame: CGRect, values: [Double]) {
        self.init(frame: frame)
        self.values = values
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .systemGray4
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let maxValue = drawingValues.max() else { return }
        
        let spacing: CGFloat = 30.0
        let drawingBounds = self.bounds.inset(by: .init(top: spacing, left: spacing, bottom: spacing, right: spacing))
        
        let widthSnippet = drawingBounds.width / CGFloat(drawingValues.count - 1)
        let heightSnippet = drawingBounds.height / CGFloat(maxValue)
        
        let nextPoint = { (index: Int, value: Double) -> CGPoint in
            return .init(
                x: drawingBounds.origin.x + widthSnippet * CGFloat(index),
                y: drawingBounds.origin.y + heightSnippet * CGFloat(value)
            )
        }
        
        let path: UIBezierPath = .init()
        
        drawingValues.enumerated().forEach { (index, value) in
            if index == 0 {
                path.move(to: nextPoint(index, value))
            } else {
                path.addLine(to: nextPoint(index, value))
            }
        }
        
        UIColor.systemRed.set()
        path.lineWidth = lineWidth
        path.lineCapStyle = .round
        path.lineJoinStyle = .round
        path.stroke()
    }
}
