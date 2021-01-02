//
//  DetailView.swift
//  ToDoApp
//
//  Created by H5266 on 2021/01/02.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var todoData:ToDoData
    var todo: ToDo
    
    var body: some View {

        VStack{
            Text(todo.title).navigationTitle("ToDo Detail")
        }.navigationBarItems(trailing: toEditView)
        
    }
    
    var toEditView: some View {
        NavigationLink(destination: EditView(todo:todo, title: todo.title)){ Image(systemName: "pencil") }
    }
}

struct DetailView_Preview: PreviewProvider {
    static let todoData = ToDoData()
    static var todo:ToDo = ToDo()

    static var previews: some View {
        DetailView(todo:todo).environmentObject(todoData)
    }
}
