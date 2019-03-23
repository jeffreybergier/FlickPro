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

    let gameView = GameView(data: FakeData.hiraganaBasicGrid)

    override func viewDidLoad() {
        super.viewDidLoad()

        self.gameView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.gameView)
        self.view.addConstraints([
            self.view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.gameView.leadingAnchor),
            self.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.gameView.topAnchor),
            self.view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: self.gameView.trailingAnchor),
            self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: self.gameView.bottomAnchor),
            ])
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

}

