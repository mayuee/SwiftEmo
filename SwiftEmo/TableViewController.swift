//
//  TableViewController.swift
//  SwiftEmo
//
//  Created by cs on 16/5/10.
//  Copyright © 2016年 mzb. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableData:UITableView?;
    var arrayData = ["昵称", "账户", "性别", "联系地址", "邮箱", "简介"];
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "我的资料";
        self.view.backgroundColor = UIColor.lightGrayColor();
        
        initSubView();
    }

    func initSubView(){
        tableData = UITableView(frame: self.view.bounds, style: UITableViewStyle.Grouped);
        tableData!.dataSource = self;
        tableData!.delegate = self;
        tableData?.registerClass(CustomViewCell.self, forCellReuseIdentifier: customIdentifier);
        self.view.addSubview(tableData!);
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(0 == section){
            return 1;
        }else if(1 == section){
            return arrayData.count;
        }else{
            return 10;
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(0 == indexPath.section){
            return 60;
        }else if(1 == indexPath.section){
            return 44;
        }
        else{
            return 60;
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10;
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if (2 == indexPath.section) {
            let cell:CustomViewCell = tableView.dequeueReusableCellWithIdentifier(customIdentifier, forIndexPath: indexPath) as! CustomViewCell;
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator;
            
            cell.title = "行数" + indexPath.row.description
            
            return cell;
        }
        
        let identifier = "identifier";
        var cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(identifier);
        if (nil == cell) {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: identifier);
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator;
        }
        
        if(0 == indexPath.section){
            cell.textLabel?.text = "头像";
        }else{
            cell.textLabel?.text = arrayData[indexPath.row];
        }
        return cell!;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
        
        if (0 == indexPath.section) {
            self.title = "我的资料";
            
            let autoViewController:AutoCellHeightViewController = AutoCellHeightViewController();
            self.navigationController?.pushViewController(autoViewController, animated: true);
            
        }else if(1 == indexPath.section){
            self.title = arrayData[indexPath.row];
        }else{
            let custonCell:CustomViewCell = tableView.cellForRowAtIndexPath(indexPath) as! CustomViewCell;
            self.title = custonCell.title;
        }
    }

}
