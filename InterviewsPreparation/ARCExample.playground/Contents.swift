import UIKit

var str = "Hello, playground"

class module {
   let name: String
   init(name: String) { self.name = name }
   weak var sub: submodule?
   deinit { print("\(name) Is The Main Module") }
}

class submodule {
   let number: Int
   init(number: Int) { self.number = number }
   weak var topic: module?

   deinit { print("Sub Module with its topic number is \(number)") }
}

var toc: module?
var list: submodule?
toc = module(name: "ARC")
list = submodule(number: 4)
toc!.sub = list
list!.topic = toc

toc = nil
list = nil
