import UIKit


//Key Path Expressions as Functions
//SE-0249 introduced a marvelous shortcut that allows us to use keypaths in a handful of specific circumstances.

struct User {
    let name: String
    let age: Int
    let bestFriend: String?
    var canVote: Bool {
        age >= 18
    }
}

let eric = User(name: "Eric Effiong", age: 18, bestFriend: "Otis Milburn")
let maeve = User(name: "Maeve Wiley", age: 19, bestFriend: nil)
let otis = User(name: "Otis Milburn", age: 17, bestFriend: "Eric Effiong")
let users = [eric, maeve, otis]

let userNames = users.map({$0.name})
print(userNames)
let voters = users.filter({$0.canVote})
print(voters)

let bestFriends = users.compactMap({$0.bestFriend})


//SE-0253 introduced introduces statically callable values to Swift, which is a fancy way of saying that you can now call a value directly if its type implements a method named callAsFunction(). You don’t need to conform to any special protocol to make this behavior work; you just need to add that method to your type.

struct Dice: Decodable {
    var lowerBound: Int
    var upperBound: Int
    var name: String?

    func callAsFunction() -> Int {
        (lowerBound...upperBound).randomElement()!
    }
    
    func greeting() -> String {
        return "Hello! \(name ?? "UKnown")"
    }
}

var d6 = Dice(lowerBound: 1, upperBound: 6)
d6.name = "Alex"
print(d6.callAsFunction())
print(d6.greeting())
