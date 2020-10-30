//
//  ViewController.swift
//  CustomButton
//
//  Created by Justyna Kowalkowska on 30/10/2020.
//

import UIKit

class ViewController: UIViewController {

    private let myButton: MyCustomButton = {
        let button = MyCustomButton(frame: CGRect(x: 0, y: 0, width: 200, height: 60))
        button.backgroundColor = .systemBlue
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myButton)
        myButton.center = view.center
        
        let viewModel = MyCustomButtonViewModel(
            title: "Title",
            subtitle: "Subtitle",
            imageName: "alarm"
        )
        
        myButton.configure(with: viewModel)
        
    }


}

