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

    private let gameView = GameView(data: FakeData.hiraganaBasicGrid)

    override func loadView() {
        self.view = self.gameView
    }

}

