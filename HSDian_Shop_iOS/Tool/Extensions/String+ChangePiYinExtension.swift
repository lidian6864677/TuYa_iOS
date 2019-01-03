//
//  String+ChangePiYinExtension.swift
//  HSDian_Shop_iOS
//
//  Created by Dian on 2018/5/26.
//  Copyright © 2018年 Dian. All rights reserved.
//

import Foundation
import UIKit

extension String {
    // MARK: 汉字 -> 拼音
    func chineseToPinyin() -> String {
        
        let stringRef = NSMutableString(string: self) as CFMutableString
        // 转换为带音标的拼音
        CFStringTransform(stringRef,nil, kCFStringTransformToLatin, false)
        // 去掉音标
        CFStringTransform(stringRef, nil, kCFStringTransformStripCombiningMarks, false)
        let pinyin = stringRef as String
        
        return pinyin
    }
    
    // MARK: 判断是否含有中文
    func isIncludeChineseIn() -> Bool {
        
        for (_, value) in self.characters.enumerated() {
            
            if ("\u{4E00}" <= value  && value <= "\u{9FA5}") {
                return true
            }
        }
        
        return false
    }
    
    // MARK: 获取第一个字符
//    substring(to:)' is deprecated: Please use String slicing subscript with a 'partial range upto' operator.
    func first() -> String {
        let index = self.index(self.startIndex, offsetBy: 1)
//        return self.substring(to: index)
        let subStr = self.prefix(upTo: index)
        return String(subStr)
    }
    
}
