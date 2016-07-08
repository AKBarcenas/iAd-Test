//
//  ViewController.swift
//  iAd Test
//
//  Created by Alex on 6/23/16.
//  Copyright © 2016 Alex Barcenas. All rights reserved.
//

import iAd
import UIKit

class ViewController: UIViewController, ADBannerViewDelegate {
    // The banner for ads.
    var bannerView: ADBannerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        bannerView = ADBannerView(adType: .Banner)
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        bannerView.delegate = self
        bannerView.hidden = true
        view.addSubview(bannerView)
        
        let viewsDictionary = ["bannerView": bannerView]
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[bannerView]|", options: [], metrics: nil, views: viewsDictionary))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[bannerView]|", options: [], metrics: nil, views: viewsDictionary))
        
        for i in 1 ... 100 {
            print("Got number \(i)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        bannerView.hidden = false
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        bannerView.hidden = true
    }


}

