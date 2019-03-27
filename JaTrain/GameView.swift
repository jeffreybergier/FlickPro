//
//  GameView.swift
//  JaTrain
//
//  Created by Jeffrey Bergier on 2019/03/23.
//  Copyright © 2019 Jeffrey Bergier. All rights reserved.
//

import UIKit

class GameView: UIView {

    private let gridView: GridView
    private let textField: GameTextField = GameTextField(frame: .zero)
    private lazy var languageObserver: KeyboardLanguageObserver = KeyboardLanguageObserver(to: self.textField)

    init(data: Data) {
        self.gridView = GridView(data: data)
        super.init(frame: .zero)
        self.backgroundColor = .yellow
        self.commonInit()
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    private func commonInit() {
        self.gridView.translatesAutoresizingMaskIntoConstraints = false
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.gridView)
        self.addSubview(self.textField)
        self.addConstraints([
            self.textField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.textField.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.textField.heightAnchor.constraint(equalToConstant: 40),
            self.gridView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.gridView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
        
        self.languageObserver.languageChanged = { newLocale in
            print(newLocale)
        }
    }

    func focusItem(at indexPath: IndexPath,
                   animated: Bool = true,
                   completionHandler: ((Bool) -> Void)? = nil)
    {
        // get the transform of the new selected item
        let view = self.gridView.view(at: indexPath)
        // get all the other transforms
        let allViews = self.gridView.allViews
        // animate them into place
        let finalState = {
            allViews.forEach({ $0.transform = .identity })
            view.transform = CGAffineTransform(scaleX: 4, y: 4)
        }
        guard animated else {
            finalState()
            completionHandler?(false)
            return
        }
        UIView.animate(withDuration: 0.3,
                       animations: finalState,
                       completion: completionHandler)
    }

    override func didMoveToWindow() {
        super.didMoveToWindow()

        if self.window != nil {
            self.textField.becomeFirstResponder()
        } else {
            self.textField.resignFirstResponder()
        }
    }

}
