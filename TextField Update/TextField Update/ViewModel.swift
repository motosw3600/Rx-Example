//
//  ViewModel.swift
//  TextField Update
//
//  Created by 박상우 on 2022/02/11.
//

import Foundation
import RxSwift
import RxCocoa

protocol ViewModelIO {
    associatedtype Input
    associatedtype Output
    
    var input: Input { get }
    var output: Output { get }
}

class ViewModel: ViewModelIO {
    let input: Input
    let output: Output
    
    init(input: Input, dependecy: String) {
        self.input = input
        
        let rxResult = input.text.asObservable()
        
        self.output = Output(result: rxResult)
    }
    
}

extension ViewModel {
    struct Input {
        let text: Observable<String>
    }
    
    struct Output {
        let result: Observable<String>
    }
}
