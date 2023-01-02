//
//  MainViewController.swift
//  UIBezierPathPractice
//
//  Created by Jaewon Yun on 2022/12/22.
//

import UIKit

final class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        let myView: MyView = .init(frame: .init(origin: .init(x: self.view.bounds.width / 2 - 150, y: 50), size: .init(width: 300, height: 300)))
        self.view.addSubview(myView)
        
        let graphView: GraphView = .init(
            frame: .init(origin: .init(x: self.view.bounds.width / 2 - 150, y: 400), size: .init(width: 300, height: 300)),
            values: [0.1, 0.2, 0.3, 1]
        )
        self.view.addSubview(graphView)
    }
}
