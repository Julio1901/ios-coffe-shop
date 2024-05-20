//
//  Extensions.swift
//  CoffeShopTests
//
//  Created by Julio Cesar Pereira on 14/05/24.
//

import XCTest

class ExtensionsTests: XCTestCase {

    func testUILabelSetText() {
        let label = UILabel()
        label.setText(key: "welcome_screen_title")
        XCTAssertEqual(label.text, "Fall in Love with\nCoffee in Blissful\nDelight!")
    }

    func testUIButtonSetTextForState() {
        let button = UIButton()
        button.setText(key: "TestKey", for: .normal)
        XCTAssertEqual(button.title(for: .normal), NSLocalizedString("TestKey", comment: ""))
    }

}
