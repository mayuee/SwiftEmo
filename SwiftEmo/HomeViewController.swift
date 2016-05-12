//
//  HomeViewController.swift
//  SwiftEmo
//
//  Created by cs on 16/5/11.
//  Copyright © 2016年 mzb. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var panGesture:UIPanGestureRecognizer{
        get{
            if nil ==  self.truePanGesture{
                self.truePanGesture = UIPanGestureRecognizer();
            }
            return self.truePanGesture;
        }
    };
    var truePanGesture:UIPanGestureRecognizer!;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.backgroundColor = UIColor.cyanColor();
        self.view.addGestureRecognizer(self.panGesture);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
