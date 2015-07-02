//
//  SwiftyJSCore.swift
//  Pods
//
//  Created by Kostiantyn Koval on 02/07/15.
//
//

import Foundation
import JavaScriptCore

public class SwiftyJSContext {
  public let context: JSContext
  
  public init (context: JSContext) {
    self.context = context
  }
  
  public convenience init() {
    self.init(context: JSContext())
  }
  
}

//MARK: - Subscript

public extension SwiftyJSContext {

  public subscript (key: String!) ->  JSValue! {
    return context.objectForKeyedSubscript(key)
  }
  
  public subscript(# key: String!) -> AnyObject! {
    get {
      return context.objectForKeyedSubscript(key)
    }
    set {
      context.setObject(newValue, forKeyedSubscript: key)
    }
  }
  
}

public extension SwiftyJSContext {
  
  func evaluateScript(script: String!) -> JSValue! {
    return context.evaluateScript(script)
  }
  
}
