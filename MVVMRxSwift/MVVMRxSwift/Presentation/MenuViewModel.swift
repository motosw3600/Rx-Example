//
//  MenuViewModel.swift
//  MVVMRxSwift
//
//  Created by 박상우 on 2022/03/07.
//

import Foundation

final class MenuViewModel {
    private let menu: Menu
    
    var displayText: String {
        return menu.name + "-" + "\(menu.price)"
    }
    
    init(menu: Menu) {
        self.menu = menu
    }
}
