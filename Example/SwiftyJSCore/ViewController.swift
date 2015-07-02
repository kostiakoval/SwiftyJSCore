//
//  ViewController.swift
//  SwiftyJSCore
//
//  Created by Konstantin Koval on 07/02/2015.
//  Copyright (c) 07/02/2015 Konstantin Koval. All rights reserved.
//

import UIKit
import JavaScriptCore
import SwiftyJSCore

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    playWithJS()
    
    println()
    playWithSwiftyJS()
  }
  
  func playWithJS() {
    let context = JSContext()
    addJS(context)
    
    let c = context.objectForKeyedSubscript("c")
    
    println(c)
    
    //Functions
    let add = context.evaluateScript("add()")
    println(add)
  }
  
  func playWithSwiftyJS() {
    
    let sContext = SwiftyJSContext()
    let context = sContext.context
    addJS(context)
    
    let c = sContext["c"]
    println(c)
    sContext[key: "c"] = 123
    
    //Functions
    let add = context.evaluateScript("add()")
    println(add)
    
  }
  
  //Ad
  func addJS(context: JSContext) {
    
    context.evaluateScript("var a = 6 \n" +
      "var b = 10 \n" +
      "var c = b + b")
    context.evaluateScript("var add = function() { return a + b} ")
  }
  
  //Print
  
  func printRes(context: JSContext) {
    
    
  }
  
}

