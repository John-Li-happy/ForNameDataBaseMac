//
//  Person.swift
//  ForNameDataBaseMac
//
//  Created by Zhaoyang Li on 3/13/21.
//

import Foundation

struct Person {
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    static func getSampleData() -> [Person] {
        let person1 = Person(name: "first guy", age: 10)
        let person2 = Person(name: "second guy", age: 20)
        
        return [person1, person2]
    }
    
}
