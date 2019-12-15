//
//  ViewController.swift
//  CombinePlayground
//
//  Created by Wang Wei on 2019/06/18.
//  Copyright © 2019 OneV's Den. All rights reserved.
//

import UIKit
import Combine

class ViewController: UIViewController {

    var buttonClicked: PassthroughSubject<Void, Never>? = PassthroughSubject<Void, Never>()

    var timer: Timer.TimerPublisher!

    override func viewDidLoad() {
        super.viewDidLoad()

        timer = Timer.publish(every: 1, on: .main, in: .default)
        _ = timer.sink { d in
            print(d)
        }

        let c = timer.connect()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.timer = nil
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            c.cancel()
            
        }
    }
}

