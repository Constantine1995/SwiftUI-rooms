//
//  ContentView.swift
//  Rooms
//
//  Created by Constantine Likhachov on 11.01.2020.
//  Copyright © 2020 Constantine Likhachov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store = RoomStore(rooms: [])
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button(action: addRoom) {
                        Text("Add Room")
                    }
                }
                
                Section {
                    ForEach(store.rooms) { room in
                        RoomCell(room: room)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
            }
            .navigationBarTitle(Text("Rooms"))
            .navigationBarItems(trailing: EditButton())
            .listStyle(GroupedListStyle())
        }
    }
    
    func addRoom() {
        store.rooms.append(Room(name: "Observation Deck", capacity: 200))
    }
    
    func delete(at offsets: IndexSet) {
        store.rooms.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        store.rooms.move(fromOffsets: source, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: RoomStore(rooms: testData))
            .environment(\.sizeCategory, .extraExtraLarge)
            .environment(\.colorScheme, .dark)
    }
}

struct RoomCell: View {
    let room: Room
    
    var body: some View {
        return NavigationLink(destination: RoomDetail(room: room)) {
            Image(room.thumbnailName)
                .cornerRadius(8)
                .frame(width: 70, height: 70, alignment: .center)
            
            VStack(alignment: .leading) {
                Text(room.name)
                Text("\(room.capacity) people")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}
