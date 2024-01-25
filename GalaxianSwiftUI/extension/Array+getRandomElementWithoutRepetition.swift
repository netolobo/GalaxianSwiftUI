//
//  Array+get.swift
//  GalaxianSwiftUI
//
//  Created by Neto Lobo on 24/01/24.
//

import Foundation

extension Array {
    func getRamdomElementWihoutRepetition() -> Element? {
        var shuffledItem = self.shuffled()
        return shuffledItem.popLast()
    }
}
