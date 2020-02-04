//
//  Style.swift
//  Notepad
//
//  Created by Rudd Fawcett on 10/14/16.
//  Copyright © 2016 Rudd Fawcett. All rights reserved.
//

import Foundation

public struct Style {
    var regex: NSRegularExpression!
    var attributes: [NSAttributedString.Key: Any] = [:]

    init(element: Element, attributes: [NSAttributedString.Key: Any]) {
        self.regex = element.toRegex()
        self.attributes = attributes
    }

    init(regex: NSRegularExpression, attributes: [NSAttributedString.Key: Any]) {
        self.regex = regex
        self.attributes = attributes
    }

    init() {
        self.regex = Element.unknown.toRegex()
    }
}
