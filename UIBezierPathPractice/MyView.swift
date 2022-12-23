//
//  MyView.swift
//  UIBezierPathPractice
//
//  Created by Jaewon Yun on 2022/12/22.
//

import UIKit

final class MyView: UIView {
    
    let trianglePath: UIBezierPath = {
        let path: UIBezierPath = .init()
        
        path.move(to: .init(x: 50, y: 50))
        path.addLine(to: .init(x: 50, y: 250))
        path.addLine(to: .init(x: 250, y: 250))
        path.close()
        
        return path
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .systemGray3
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        trianglePath.lineWidth = 10
        trianglePath.lineJoinStyle = .round
        
        UIColor.black.set()
        trianglePath.stroke()
        
        UIColor.systemBrown.set()
        trianglePath.fill()
    }
}
