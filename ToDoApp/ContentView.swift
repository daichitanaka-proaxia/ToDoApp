//
//  ContentView.swift
//  ToDoApp
//
//  Created by H5266 on 2021/01/02.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var todoData:ToDoData
    var body: some View {
        NavigationView{
        VStack{
            currentToDoCount
            list.navigationBarTitle("ToDo List").navigationBarItems(trailing: toAddView)
        }
        }
    }
    
    var list: some View {
        List{
            ForEach(todoData.items){ item in
                NavigationLink(destination: DetailView(todo: item)){Text(item.title)}
            }.onDelete(perform: todoData.remove)
        }
    }
    
    var toAddView: some View {
        NavigationLink(destination: AddView()){Image(systemName: "plus")}
    }
    
    var currentToDoCount: some View {
        if todoData.items.count > 0 {
            return Text("\(todoData.items.count)件")
        } else {
            return Text("現在 ToDo はありません")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static let todoData = ToDoData()
    static var previews: some View {
        ContentView().environmentObject(todoData)
    }
}
