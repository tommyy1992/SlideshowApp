//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 金子智広 on 12/15/17.
//  Copyright © 2017 tomohiro.kaneko. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultImageView: UIImageView!
  
    var image1 = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultImageView.image = UIImage(named: image1)
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

}
