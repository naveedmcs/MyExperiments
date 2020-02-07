import UIKit
import PlaygroundSupport

var str = "Hello, playground"

struct Person: Codable {
    let name: String
    let age: Int
    
    func getString() -> String {
        return "Name: \(name), Age: \(age)"
    }
}

struct Restaurant {
    enum Meal: String {
    case breakfast, lunch, dinner, supper
    }

    let name: String
    let location: (latitude: Double, longitude: Double)
    let meals: Set<Meal>
}

//Create A Person Struct
let person = Person(name: "Yuri", age: 20)
print("Original Person Struct: " + person.getString() + "\n")

//Prints - Original Person Struct: Name: Yuri, Age: 20

//Imagine, that you have to send this instance on a server in a JSON representation, if you have your instance firstly you have to convert it in Data type and then you may create a JSON:

//Create JSON
var json: Any?
let encodedData = try? JSONEncoder().encode(person)

if let data = encodedData {
    json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
    if let json = json {
      print("Person JSON:\n" + String(describing: json) + "\n")
      //Prints: Person JSON: { age = 20; name = Yuri; }
    }
}


//if you received a person as a JSON and you need to convert it to a struct instance firstly you have to convert it in Data and then you may convert it in a struct :


//Convert JSON back to Data
var jsonData: Data?
var decodedPerson: Person?

if let json = json {
    jsonData = try? JSONSerialization.data(withJSONObject: json)
  
    //Convert JSON Data back to Person Struct
    if let data = jsonData {
      decodedPerson = try? JSONDecoder().decode(Person.self, from: data)
      
      //Print Person Struct
      if let decodedPerson = decodedPerson {
        print("Decoded Person Struct: " + decodedPerson.getString())
        //Prints: Decoded Person Struct: Name: Yuri, Age: 20
      }
    }
}

//Nested Types
//What is amazing in Swift 4 that decoding and encoding of nested types have no difference and completely the same as the sample above. Using the Person structure above let’s create a new struct Family with the struct Person as a nested type that also conforms to a Codable protocol:

//Nested Type Abbreviated Example
struct Family: Codable {
    let familyName: String
    var familyMembers: [Person]
    
    init(familyName: String, familyMembers: [Person] = [Person]()) {
        self.familyName = familyName
        self.familyMembers = familyMembers
    }
    
    mutating func addFamilyMember(relative person: Person) {
        familyMembers.append(person)
    }
}

let mother = Person(name: "Arlene", age: 35)
let father = Person(name: "Calvin", age: 36)

var family = Family(familyName: "Hinton")
family.addFamilyMember(relative: mother)
family.addFamilyMember(relative: father)

print("\n\n***Encoding and Decoding complex types***\n")
print("Family Struct")
for person in family.familyMembers {
    print("Family Member: " + person.getString())
}

//As with the sample above if we want to represent our Family as a JSON we have to convert it to Data and then to JSON:

//Encode Family Struct as Data
let familyData = try? JSONEncoder().encode(family)

//Create JSON
var familyJson: Any?
if let data = familyData {
    familyJson = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
}

//Print JSON Object
if let json = familyJson {
    print("\nFamily JSON:\n" + String(describing: json) + "\n")
}



//And if we want to convert our Family JSON back to struct we have to convert it in a Data and then back in a struct :

//Convert JSON back to Data
if let json = familyJson {
    jsonData = try? JSONSerialization.data(withJSONObject: json)
}

//Convert JSON Data back to Person Struct
var decodedFamily: Family?
if let data = jsonData {
    decodedFamily = try? JSONDecoder().decode(Family.self, from: data)
}

//Print Family Struct
print("\nDecoded Family Struct:")
if let decodedFamily = decodedFamily {
    for person in decodedFamily.familyMembers {
        print("Family Member: " + person.getString())
    }
}

/*
 Prints:
 
 Decoded Family Struct:
 Family Member: Name: Arlene, Age: 35
 Family Member: Name: Calvin, Age: 36
*/
