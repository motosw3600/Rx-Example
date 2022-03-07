//
//  LocalFileManager.swift
//  MVVMRxSwift
//
//  Created by 박상우 on 2022/03/07.
//

import Foundation

enum LocalFileManager {
    static func readJsonFile(_ name: String) -> String? {
        if let filepath = Bundle.main.path(forResource: name, ofType: "json") {
            let contents = try? String(contentsOfFile: filepath)
            return contents
        }
        return nil
    }
}
