//
//  ToDoListRowView.swift
//  ToDoApp
//
//  Created by H5266 on 2021/01/03.
//

import SwiftUI

struct ToDoListRowView: View {
    @EnvironmentObject var todoData:ToDoData
    @State var isDone = false
    
    var todo:ToDo
    var body: some View {
        HStack{
        circleButton
        Text(todo.title)
        }
    }
    
    var circleButton: some View {
        Button(action: {
            todoData.done(todo: todo)
            isDone = true
        }){ if isDone {Image(systemName: "circle.fill")} else {Image(systemName: "circle")}}
    }

}

struct ToDoListRowView_Previews: PreviewProvider {
    static let todoData = ToDoData()
    static var todo:ToDo = ToDo()
    static var previews: some View {
        ToDoListRowView(todo: todo).environmentObject(todoData)
    }
}
