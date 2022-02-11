//
//  ViewController.swift
//  TextField Update
//
//  Created by 박상우 on 2022/02/11.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    let disposeBag = DisposeBag()
    var viewModel: ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViewModel()
    }
    
    private func configureViewModel() {
        let input = ViewModel.Input(text: textField.rx.text.orEmpty.asObservable())
        
        guard let text = self.resultLabel.text else { return }
        
        viewModel = ViewModel(input: input, dependecy: text)
        
        viewModel?.output.result
            .bind(to: resultLabel.rx.text)
            .disposed(by: disposeBag)
    }


}

