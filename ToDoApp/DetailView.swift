//
//  DetailView.swift
//  ToDoApp
//
//  Created by H5266 on 2021/01/02.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var todoData:ToDoData
    var todo: String
    
    var body: some View {
        Text(todo).navigationTitle("ToDo Detail")
    }

}

struct DetailView_Preview: PreviewProvider {
    static let todoData = ToDoData()
    static var todo:String = ""

    static var previews: some View {
        DetailView(todo:todo).environmentObject(todoData)
    }
}
