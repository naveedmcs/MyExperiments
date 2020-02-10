import UIKit

var str = "Hello, playground"

var page = 0


//Todo:- common class
struct Pagination : Codable{
    
    var next : Int?
    var page : Int?
    var pages : Int?
    var perPage : Int?
    var previous : Int?
    var total : Int?
    
    enum CodingKeys:String, CodingKey {
        case next,page, pages, perPage, previous, total
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        next = try values.decode(Int.self, forKey: .next)
        page = try values.decode(Int.self, forKey: .page)
        perPage = try values.decode(Int.self, forKey: .perPage)
        pages = try values.decode(Int.self, forKey: .pages)
        previous = try values.decode(Int.self, forKey: .previous)
        total = try values.decode(Int.self, forKey: .total)
    }
    
}


struct PagingHandler<Element> {
    
    private var items: [Element] = []
    var pagination: Pagination?
    
    
    init() {
        items.removeAll()
    }
    
    
    mutating func updateRecords (pagination: Pagination?, items: [Element], completion: (([Element]) -> Void)){
        self.pagination = pagination
        if pagination?.page ?? 0 <= 1 {
            self.items = items
            completion(self.items)
        }
        else {
            self.items.append(contentsOf: items )
            completion(self.items)
        }
    }
    
    func isFetchMore() -> Bool {
        guard let pagination =  self.pagination else {
            return false
        }
        
        if pagination.page! < pagination.pages! {
            return true
        }
        else{
            return false
        }
     
}
    
    
}


var numberList = [1,2,3,4,5]

var items: [Int] = []

var pagination = PagingHandler<Int>()




pagination.updateRecords(pagination: nil, items: numberList) { (list) in
    items = list
    
}



pagination.isFetchMore()
