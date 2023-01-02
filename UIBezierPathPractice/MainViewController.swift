//
//  MainViewController.swift
//  UIBezierPathPractice
//
//  Created by Jaewon Yun on 2022/12/22.
//

import UIKit

final class MainViewController: UIViewController {
    
    lazy var graphView: GraphView = .init(
        frame: .init(origin: .init(x: self.view.bounds.width / 2 - 150, y: 400), size: .init(width: 300, height: 300)),
        values: [0.1, 0.2, 0.3, 1]
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        let myView: MyView = .init(frame: .init(origin: .init(x: self.view.bounds.width / 2 - 150, y: 50), size: .init(width: 300, height: 300)))
        self.view.addSubview(myView)
        
        self.view.addSubview(graphView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        sleep(2)
//
//        graphView.lineWidth = 10.0
        
//        sleep(2)
//
//        graphView.values = [2, 1, 4, 3, 6, 5]
        
        sleep(2)
        
        graphView.lineColor = .systemRed
    }
}
