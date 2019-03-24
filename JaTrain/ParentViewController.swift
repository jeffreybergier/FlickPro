//
//  ParentViewController.swift
//  JaTrain
//
//  Created by Jeffrey Bergier on 2019/03/24.
//  Copyright © 2019 Jeffrey Bergier. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController {

    private let gameViewController = GameViewController()
    private var bottomConstraint: NSLayoutConstraint!
    private let keyboardAnimator = KeyboardAnimator()

    override func loadView() {
        let parent = UIView()
        let child = self.gameViewController.view!
        child.translatesAutoresizingMaskIntoConstraints = false
        parent.addSubview(child)
        self.bottomConstraint = parent.bottomAnchor.constraint(equalTo: child.bottomAnchor)
        parent.addConstraints([
            parent.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: child.leadingAnchor),
            parent.safeAreaLayoutGuide.topAnchor.constraint(equalTo: child.topAnchor),
            parent.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: child.trailingAnchor),
            self.bottomConstraint
            ])
        self.view = parent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.keyboardAnimator.animateAlongsideKeyboardChanges = (alongSide: { [unowned self] change in
            self.bottomConstraint.constant = change.newHeight
            self.view.layoutIfNeeded()
        }, afterCompletion: nil)
    }

}
