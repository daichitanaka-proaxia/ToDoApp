//
//  ToDo.swift
//  ToDoApp
//
//  Created by H5266 on 2021/01/02.
//

import Foundation

internal class ToDoData: ObservableObject {
    @Published var items:[ToDo] = []
    
    internal func add(item:ToDo){
        self.items.append(item)
    }
    
    internal func remove(offsets: IndexSet){
        self.items.remove(atOffsets: offsets)
    }
    
    internal func update(todo:ToDo,title:String){
        guard let index = self.items.firstIndex(of: todo) else { return }
        self.items[index].title = title
    }
    
}

internal  struct ToDo:Identifiable,Equatable {
    var id:UUID = UUID()
    var title:String = ""
}

extension ToDo {
    public static func ==(lhs:ToDo, rhs:ToDo) -> Bool {
        return lhs.id == rhs.id
    }
}

