//
//  ViewController.swift
//  DE_WaterWaveEffect
//
//  Created by go.yaro on 10/14/16.
//  Copyright © 2016 DDDrop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let wwev = WaterWaveEffectView(origin: CGPoint(x: 0, y: 0), size: 200)
        wwev.center = view.center
        view.addSubview(wwev)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

