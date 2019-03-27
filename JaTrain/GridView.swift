//
//  GridView.swift
//  JaTrain
//
//  Created by Jeffrey Bergier on 2019/03/23.
//  Copyright © 2019 Jeffrey Bergier. All rights reserved.
//

import UIKit

typealias Data = [[Character]]

class GridView: UIView {

    let data: Data
    var parentStackView: UIStackView!

    var allViews: [UIView] {
        return self.parentStackView.arrangedSubviews.flatMap({ ($0 as! UIStackView).arrangedSubviews })
    }

    init(data: Data) {
        self.data = data
        super.init(frame: .zero)
        self.createStackView()
        self.backgroundColor = .red
    }

    required init?(coder aDecoder: NSCoder) { fatalError("") }

    private func createStackView(with views: [UIView] = []) {
        self.parentStackView = UIStackView(arrangedSubviews: views)
        self.parentStackView.axis = .vertical
        self.parentStackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.parentStackView)
        self.addConstraints([
            self.leadingAnchor.constraint(equalTo: self.parentStackView.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: self.parentStackView.trailingAnchor),
            self.topAnchor.constraint(equalTo: self.parentStackView.topAnchor),
            self.bottomAnchor.constraint(equalTo: self.parentStackView.bottomAnchor)
            ])
    }

    func view(at indexPath: IndexPath) -> UIView {
        let row = self.parentStackView.arrangedSubviews[indexPath.section] as! UIStackView
        let view = row.arrangedSubviews[indexPath.row]
        return view
    }

    override func didMoveToWindow() {
        super.didMoveToWindow()

        guard self.window != nil else {
            self.parentStackView.removeFromSuperview()
            self.createStackView()
            return
        }

        let rows = self.data.map() { row -> UIStackView in
            let views = row.map() { char -> UILabel in
                let label = UILabel(frame: .zero)
                label.text = String(char)
                label.textAlignment = .center
                label.addConstraints([
                    label.widthAnchor.constraint(equalToConstant: 40),
                    label.heightAnchor.constraint(equalToConstant: 40)
                    ])
                return label
            }
            let stackView = UIStackView(arrangedSubviews: views)
            stackView.axis = .horizontal
            return stackView
        }
        self.createStackView(with: rows)
    }

}
