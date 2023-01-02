//
//  GraphView.swift
//  UIBezierPathPractice
//
//  Created by Jaewon Yun on 2022/12/23.
//

import Then
import UIKit

final class GraphView: UIView {
    
    let rawValues: [Int] = [0, 1, 2, 3, 4, 5]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .systemGray4
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let maxValue = rawValues.max() else { return }
        
        let spacing: CGFloat = 30.0
        let drawingBounds = self.bounds.inset(by: .init(top: spacing, left: spacing, bottom: spacing, right: spacing))
        
        let widthSnippet = drawingBounds.width / CGFloat(rawValues.count - 1)
        let heightSnippet = drawingBounds.height / CGFloat(maxValue)
        
        let nextPoint = { (index: Int, rawValue: Int) -> CGPoint in
            return .init(
                x: drawingBounds.origin.x + widthSnippet * CGFloat(index),
                y: drawingBounds.origin.y + heightSnippet * CGFloat(rawValue)
            )
        }
        
        let path: UIBezierPath = .init()
        
        rawValues.enumerated().forEach { (index, rawValue) in
            if index == 0 {
                path.move(to: nextPoint(index, rawValue))
            } else {
                path.addLine(to: nextPoint(index, rawValue))
            }
        }
        
        UIColor.systemRed.set()
        path.stroke()
    }
}
