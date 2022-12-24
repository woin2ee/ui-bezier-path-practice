//
//  GraphView.swift
//  UIBezierPathPractice
//
//  Created by Jaewon Yun on 2022/12/23.
//

import UIKit

final class GraphView: UIView {
    
    let rawValues: [Int] = [5, 2, 3, 1, 4]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .systemGray4
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let minValue = rawValues.min(),
              let maxValue = rawValues.max(),
              let firstValue = rawValues.first
        else {
            return
        }
        
        let drawingBounds = self.bounds.inset(by: .init(top: 20, left: 20, bottom: 20, right: 20))
        
        let widthSnippet = drawingBounds.width / CGFloat(rawValues.count)
        let heightSnippet = drawingBounds.height / CGFloat(maxValue - minValue)
        
        let path: UIBezierPath = .init()
        
        rawValues.enumerated().forEach { (index, point) in
            if index == 0 {
                path.move(to: .init(x: widthSnippet, y: heightSnippet * CGFloat(firstValue)))
            } else {
                path.addLine(to: .init(x: widthSnippet * CGFloat(index + 1), y: heightSnippet * CGFloat(point)))
            }
        }
        
        UIColor.systemRed.set()
        path.stroke()
    }
}
