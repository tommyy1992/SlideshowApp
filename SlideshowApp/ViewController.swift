//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 金子智広 on 12/14/17.
//  Copyright © 2017 tomohiro.kaneko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startStop: UIButton!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var forward: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var timer: Timer?
    var dispImageNo = 0
    let imageNameArray = [
        "_RGB0027.jpg",
        "_RGB0056.jpg",
        "_RGB0160.jpg",
        "_RGB0718.jpg",
        "_RGB0414.jpg",
        "_RGB0413.jpg",]
    
    func displayImage() {
    if dispImageNo < 0 {
    dispImageNo = 5
    }
    if dispImageNo > 5 {
    dispImageNo = 0
    }
        let imagebox = imageNameArray[dispImageNo]
        let image = UIImage(named: imagebox)
        imageView.image = image
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let imagebox = imageNameArray[dispImageNo]
        let image = UIImage(named: imagebox)
        imageView.image = image
        startStop.setTitle("再生",for: [])

    }

    func onTimer(timer: Timer) {
        print("onTimer")
        
        dispImageNo += 1
        displayImage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController: ResultViewController = segue.destination as! ResultViewController
        resultViewController.image1 = imageNameArray[dispImageNo]
        self.timer?.invalidate()
        self.timer = nil
        forward.isEnabled = true
        back.isEnabled = true
        startStop.setTitle("再生",for: [])
    }
    
    @IBAction func backSlide(_ sender: UIImageView) {
        if self.timer == nil {
        dispImageNo -= 1
        displayImage()
        }
    }

    @IBAction func startSlide(_ sender: UIImageView) {
        if self.timer == nil {
        self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onTimer), userInfo: nil, repeats: true)
            forward.isEnabled = false
            back.isEnabled = false
            startStop.setTitle("停止",for: [])
        } else {
            self.timer?.invalidate()
            self.timer = nil
            forward.isEnabled = true
            back.isEnabled = true
            startStop.setTitle("再生",for: [])
        }
    }

    @IBAction func fowardSlide(_ sender: UIImageView) {
        if self.timer == nil {
        dispImageNo += 1
        displayImage()
               }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) { func prepare(for segue: UIStoryboardSegue, sender: Any?) { 
         }
    }
}
