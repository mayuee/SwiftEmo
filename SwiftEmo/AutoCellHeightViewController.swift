//
//  AutoCellHeightViewController.swift
//  SwiftEmo
//
//  Created by cs on 16/5/11.
//  Copyright © 2016年 mzb. All rights reserved.
//

import UIKit

class AutoCellHeightViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableData:UITableView!;
    var arrayData = Array<String>();
    var prototypeCell:AutoLayoutCell!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "我的资料";
        self.view.backgroundColor = UIColor.lightGrayColor();
        
        
        // 循环生成 label 文字内容
        for i in 1...10 {
            var text = ""
            for _ in 1...i {
                text += "Auto Layout"
            }
            arrayData.append(text)
        }
        
        initSubView();
    }
    
    func initSubView(){
        tableData = UITableView(frame: self.view.bounds, style: UITableViewStyle.Grouped);
        tableData.dataSource = self;
        tableData.delegate = self;
        
        let nib = UINib(nibName: "AutoLayoutCell", bundle: nil)
        self.tableData.registerNib(nib, forCellReuseIdentifier: AutoHeightCellIdentifier)
        
        self.view.addSubview(tableData);
        
        // 初始化 prototypeCell 以便复用
        prototypeCell = tableData.dequeueReusableCellWithIdentifier(AutoHeightCellIdentifier) as! AutoLayoutCell!;
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count;
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let cell = prototypeCell;
        cell.title = arrayData[indexPath.row];
        
        var height = cell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height + 1;
        if height < 66 {
            height = 66;
        }
        return height;
    }
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return 60;
//    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10;
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:AutoLayoutCell = tableView.dequeueReusableCellWithIdentifier(AutoHeightCellIdentifier, forIndexPath: indexPath) as! AutoLayoutCell;
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator;
        
        cell.title = arrayData[indexPath.row];
        
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
        
        if (0 == indexPath.section) {
            self.title = "我的资料";
        }else if(1 == indexPath.section){
            self.title = arrayData[indexPath.row];
        }else{
            let custonCell:AutoLayoutCell = tableView.cellForRowAtIndexPath(indexPath) as! AutoLayoutCell;
            self.title = custonCell.title;
        }
    }

}
