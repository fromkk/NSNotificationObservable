//
//  NSNotificationObservable.swift
//  NSNotificationObservable
//
//  Created by Suguru Kishimoto on 8/1/16.
//  Copyright © 2016 Suguru Kishimoto. All rights reserved.
//

import Foundation

protocol NSNotificationObservable: RawRepresentable {
    var rawValue: String { get }
}

extension NSNotificationObservable {
    func addObserver(observer: AnyObject, selector: Selector, object: AnyObject? = nil) {
        NSNotificationCenter.defaultCenter().addObserver(observer, selector: selector, name: self.rawValue, object: object)
    }
    
    func addObserver(object: AnyObject? = nil, queue: NSOperationQueue? = nil, usingBlock block: NSNotification -> Void) -> NSObjectProtocol {
        return NSNotificationCenter.defaultCenter().addObserverForName(self.rawValue, object: object, queue: queue, usingBlock: block)
    }
    
    
    func post(object: AnyObject? = nil, userInfo: [NSObject: AnyObject]? = nil) {
        NSNotificationCenter.defaultCenter().postNotificationName(self.rawValue, object: object, userInfo: userInfo)
    }
    
    func removeObserver(observer: AnyObject, object: AnyObject? = nil) {
        NSNotificationCenter.defaultCenter().removeObserver(observer, name: self.rawValue, object: object)
    }
}
