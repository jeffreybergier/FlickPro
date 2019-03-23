//
//  ViewController.swift
//  JaTrain
//
//  Created by Jeffrey Bergier on 2019/03/23.
//  Copyright © 2019 Jeffrey Bergier. All rights reserved.
//

import SpriteKit
import UIKit

class GameViewController: UIViewController {

    @IBOutlet private weak var gameView: SKView!
    private let gameScene: SKScene! = SKScene(size: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.gameScene.backgroundColor = .yellow
        self.gameView.presentScene(self.gameScene)
    }


}

