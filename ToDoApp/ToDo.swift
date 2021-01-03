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
    
    internal func done(todo:ToDo){
        guard let index = self.items.firstIndex(of: todo) else { return }
        self.items[index].isDone = true
    }
    
}

internal  struct ToDo:Identifiable,Equatable {
    internal var id:UUID = UUID()
    internal var title:String = ""
    internal var isDone:Bool = false
}

extension ToDo {
    public static func ==(lhs:ToDo, rhs:ToDo) -> Bool {
        return lhs.id == rhs.id
    }
}

