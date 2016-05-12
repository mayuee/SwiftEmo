//
//  StringExt.swift
//  SwiftEmo
//
//  Created by cs on 16/5/9.
//  Copyright © 2016年 mzb. All rights reserved.
//

import Foundation

extension String{
    //去除STRING首尾的空格，以及指定字符串
    /*
     
     处理原理是：针对一个字符串，每次按一个字节跳过给定的字符串，并返回新得到的字符串，反复迭代，直到原字符串中已经找不到给定的字符串。这样，包含在中间的字符是不去除的。
     将得到的新字符串反转，同样在处理一遍。这样头尾部的排除字符串集都可以了。然后再将结果反转，得到原来顺序的字符串，即我们需要的结果.
     单纯去除其中所有的某个字符集，有原生方法，不再次考虑
     */
    
    func escapeSpaceTillCahractor()->String{
        return self.stringEscapeHeadTail(["\r", " ", "\n"])
    }
    func escapeHeadStr(str:String)->(String, Bool){
        var result = self as NSString
        var findAtleastOne = false
        while( true ){
            let range = result.rangeOfString(str)
            if range.location == 0 && range.length == 1 {
                result = result.substringFromIndex(range.length)
                findAtleastOne = true
            }else{
                break
            }
        }
        return (result as String, findAtleastOne)
    }
    func escapeSpaceTillCahractor(strs:[String])->String{
        var result = self
        while( true ){
            var findAtleastOne = false
            for str in strs {
                var found:Bool = false
                (result, found) = result.escapeHeadStr(str)
                if found {
                    findAtleastOne = true
                    break  //for循环
                }
            }
            if findAtleastOne == false {
                break
            }
        }
        return result as String
    }
    func reverse()->String{
        var inReverse = ""
        for letter in self.characters {
            print(letter)
            inReverse = "\(letter)" + inReverse
        }
        return inReverse
    }
    
    func escapeHeadTailSpace()->String{
        return self.escapeSpaceTillCahractor().reverse().escapeSpaceTillCahractor().reverse()
    }
    
    func stringEscapeHeadTail(strs:[String])->String{
        return self.escapeSpaceTillCahractor(strs).reverse().escapeSpaceTillCahractor(strs).reverse()
    }
    
    
}
