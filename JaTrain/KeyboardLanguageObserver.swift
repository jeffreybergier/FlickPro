//
//  KeyboardLanguageObserver.swift
//  JaTrain
//
//  Created by Jeffrey Bergier on 2019/03/24.
//  Copyright © 2019 Jeffrey Bergier. All rights reserved.
//

import UIKit

public protocol KeyboardLanguageObservable {
    var textInputMode: UITextInputMode? { get }
}

extension UIResponder: KeyboardLanguageObservable { }

open class KeyboardLanguageObserver {

    private let observed: KeyboardLanguageObservable
    open var languageChanged: ((Locale) -> Void)?
    open var currentLanguage: Locale? {
        guard let identifier = self.observed.textInputMode?.primaryLanguage else { return nil }
        return Locale(identifier: identifier)
    }

    public init(to observe: KeyboardLanguageObservable) {
        self.observed = observe

        let nc = NotificationCenter.default
        self.token = nc.addObserver(forName: NSNotification.Name("AppleKeyboardsSettingsChangedNotification"),
                                    object: nil,
                                    queue: nil)
        { [unowned self] aNotification in
            guard let locale = self.currentLanguage else { return }
            self.languageChanged?(locale)
        }
    }

    private var token: NSObjectProtocol!

    deinit {
        NotificationCenter.default.removeObserver(self.token)
    }

}
