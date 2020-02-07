import UIKit

var str = "Hello, playground"

class DataImporter {
    /*
    DataImporter is a class to import data from an external file.
    The class is assumed to take a nontrivial amount of time to initialize.
    */
    var filename = "data.txt"
    // the DataImporter class would provide data importing functionality here
    
    init() {
        print("Data Importer Construct called")
    }
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    // the DataManager class would provide data management functionality here
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
//manager.importer.filename
// the DataImporter instance for the importer property has not yet been created


// agr hm class a me hm lazy variable k sath class b ka instance create krty hen
//phr hm class a ke instance use krty hen .. lekin class a me jo lazy pra tha wo abhi call nae ho ga
// jb tk hm usko access na kr layn.

//Lazy initialization is a concept where initialization (construction) of variable content is delayed until its first usage. First access to such variable triggers initialization. Since content is not created until variable is used (needed) using lazy initialized variables can save resources.

//That is primary drive behind lazy initialization. You don't create something until you need it. That is also logic you will use when deciding whether something should be lazy var or not.

//If you are dealing with views (or anything else) that are always visible (needed) there is little point in using lazy initialization. On the other hand when you are dealing with instances that are not always needed - then using lazy var is justified.

//If your view is always visible in presented view controller, you will not accomplish much by making it lazy. If it is visible only under specific circumstances - for instance when user expands some collapsed panel - then making it lazy makes sense. It will make your view controller load faster and use less memory by default.

// alert
//As far as thread safety is concerned, lazy var are not thread safe in Swift.

//That means if two different threads try to access the same lazy var at the same time, before such variable has been initialized it is possible that one of the threads will access partially constructed instance.

//You can find more about thread safety in:

//Swift - is lazy var thread-safe?

//Make "lazy var" threadsafe


