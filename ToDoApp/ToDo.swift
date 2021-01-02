//
//  ToDo.swift
//  ToDoApp
//
//  Created by H5266 on 2021/01/02.
//

import Foundation

internal class ToDoData: ObservableObject {
    @Published var items:[String] = []
    
    internal func add(item:String){
        self.items.append(item)
    }
    
    internal func remove(offsets: IndexSet){
        self.items.remove(atOffsets: offsets)
    }
}
