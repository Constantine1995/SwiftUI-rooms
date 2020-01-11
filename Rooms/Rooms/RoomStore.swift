//
//  RoomStore.swift
//  Rooms
//
//  Created by Constantine Likhachov on 11.01.2020.
//  Copyright © 2020 Constantine Likhachov. All rights reserved.
//

import SwiftUI
import Combine

class RoomStore: ObservableObject {
    @Published var rooms: [Room]
    
    func didSet() { didChange.send() }
    
    init(rooms: [Room]) {
        self.rooms = rooms
    }
    var didChange = PassthroughSubject<Void, Never>()
}
