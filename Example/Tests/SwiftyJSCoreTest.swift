//
//  SwiftyJSCoreTest.swift
//  SwiftyJSCore
//
//  Created by Kostiantyn Koval on 02/07/15.
//  Copyright (c) 2015 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import SwiftyJSCore
import JavaScriptCore

class SwiftyJSCoreTest: QuickSpec {
  override func spec() {

    var sContext: SwiftyJSContext!
    
    describe("subscript") {
      beforeEach {
        sContext = SwiftyJSContext()
        let context = sContext.context
        context.evaluateScript("var a = 10")
      }
      
      afterEach {
        sContext = nil
      }

      it("returns context") {
        expect(sContext.context).to(beAKindOf(JSContext))
      }
      
      it("returs JSValue") {
        let a = sContext["a"]
        expect(a).to(beAKindOf(JSValue))
      }
      
      it("returs correct value") {
        let a = sContext["a"]
        expect(a.toInt32()) == 10
      }
    }
  }
}
