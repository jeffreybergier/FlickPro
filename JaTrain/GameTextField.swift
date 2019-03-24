//
//  GameTextField.swift
//  JaTrain
//
//  Created by Jeffrey Bergier on 2019/03/23.
//  Copyright © 2019 Jeffrey Bergier. All rights reserved.
//

import UIKit

class GameTextField: UITextField {

    var characterReceived: ((Character) -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }

    private func commonInit() {
        self.delegate = self
        self.borderStyle = UITextField.BorderStyle.roundedRect
    }
}

extension GameTextField: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool
    {
        self.characterReceived?(Character(string))
        return true
    }

}
