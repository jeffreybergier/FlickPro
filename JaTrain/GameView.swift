//
//  GameView.swift
//  JaTrain
//
//  Created by Jeffrey Bergier on 2019/03/23.
//  Copyright © 2019 Jeffrey Bergier. All rights reserved.
//

import UIKit

class GameView: UIView {

    let gridView: GridView

    init(data: Data) {
        self.gridView = GridView(data: data)
        super.init(frame: .zero)
        self.backgroundColor = .yellow
        self.commonInit()
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    private func commonInit() {
        self.gridView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.gridView)
        self.addConstraints([
            self.gridView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.gridView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
    }

}
