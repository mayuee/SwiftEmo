//
//  CustomViewCell.swift
//  SwiftEmo
//
//  Created by cs on 16/5/10.
//  Copyright © 2016年 mzb. All rights reserved.
//

import UIKit

let customIdentifier:String = "customIdentifier";

class CustomViewCell: UITableViewCell {

    var imageHeader:UIImageView?;
    var labelTitle:UILabel?;
    var labelContent:UILabel?;
    
    
    var title:String{     //计算属性
        set{
            self.storeTitle = newValue;
            
            self.labelTitle?.text = self.storeTitle;
            
            let content = self.storeTitle! + "的详细信息";
//            self.labelContent?.text = self.storeTitle! + "的详细信息";
            
            let attributedText = NSAttributedString(string: content, attributes:  [NSStrikethroughStyleAttributeName: 1])
            self.labelContent?.attributedText = attributedText;
            self.labelContent?.sizeToFit();

        }
        get{
            return self.storeTitle!;
        }
    }
    var storeTitle:String?;      //存储属性
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.whiteColor()
        
        initSubView();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initSubView(){
        var left:CGFloat = 15;
        imageHeader = UIImageView(frame: CGRectMake(left, 10, 40, 40));
        imageHeader?.backgroundColor = UIColor.blueColor();
        self.contentView.addSubview(imageHeader!);
        
        
        left = (imageHeader?.frame.origin.x)! + (imageHeader?.frame.size.width)! + 10;
        
        labelTitle = UILabel(frame: CGRect(x: left, y: 10, width: 100, height: 20));
        labelTitle?.textColor = UIColor.darkGrayColor();
        labelTitle?.font = UIFont.systemFontOfSize(15);
        self.contentView.addSubview(labelTitle!);
        
        let top:CGFloat = (labelTitle?.frame.origin.y)! + (labelTitle?.frame.size.height)!;
        labelContent = UILabel(frame: CGRect(x: left, y: top, width: 200, height: 20));
        labelContent?.textColor = UIColor.darkGrayColor();
        labelContent?.font = UIFont.systemFontOfSize(15);
        self.contentView.addSubview(labelContent!);
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
