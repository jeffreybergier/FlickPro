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

    var currentIndexPath = IndexPath(row: 0, section: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.iterate()
    }

    func iterate() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let oldIndex = self.currentIndexPath
            let newIndex: IndexPath
            if oldIndex.row >= 4 && oldIndex.section >= 6 {
                newIndex = IndexPath(row: 0, section: 0)
            } else if oldIndex.row >= 4 {
                newIndex = IndexPath(row: 0, section: oldIndex.section + 1)
            } else {
                newIndex = IndexPath(row: oldIndex.row + 1, section: oldIndex.section)
            }
            self.currentIndexPath = newIndex
            self.gameView.focusItem(at: newIndex)
            self.iterate()
        }
    }

}

