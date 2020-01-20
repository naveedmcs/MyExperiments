import UIKit
import PlaygroundSupport



 //MARK:- struct example
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}



var stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)
print(stack.items)
stack.pop()
print(stack.items)

 //MARK:-  extending ganaric
extension Stack {
    var topItem : Element? {
        return items.isEmpty ? nil: items.last
    }
}
print(stack.topItem!)


 //MARK:-  converting this method to ganarics
//-----------------------
func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings) {
    print("The index of llama is \(foundIndex)")
}
// Prints "The index of llama is 2"

//This function doesn’t compile as written above. The problem lies with the equality check, “if value == valueToFind”.
//Any type that is Equatable can be used safely with the findIndex(of:in:) function, because it’s guaranteed to support the equal to operator.

func findIndex<T: Equatable>(of valueToFind:T, in array: [T] )-> Int? {
    for (index, value ) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}



extension Array where Element: Equatable {
    func findIndex(of valueToFind:Element)-> Int? {
        for (index, value ) in self.enumerated() {
            if value == valueToFind {
                return index
            }
        }
        
        return nil
    }

}

if let index = strings.findIndex(of: "dog"){
  print(strings[index])
}


