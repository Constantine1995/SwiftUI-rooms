//
//  RoomDetail.swift
//  Rooms
//
//  Created by Constantine Likhachov on 11.01.2020.
//  Copyright © 2020 Constantine Likhachov. All rights reserved.
//

import SwiftUI

struct RoomDetail: View {
    let room: Room
    @State private var zoomed = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(room.imageName)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .navigationBarTitle(Text(room.name), displayMode: .inline)
                .onTapGesture {
                    withAnimation(.linear(duration: 1)) { self.zoomed.toggle() }
            }
            .frame(minWidth: 0, idealWidth: .infinity, maxWidth: 0, minHeight: 0, idealHeight: .infinity, maxHeight: 0, alignment: .center)
            
            if room.hasVideo && !zoomed {
                Image(systemName: "video.fill")
                    .font(.title)
                    .padding(.all)
                    .transition(.move(edge: .leading))
                
            }
        }
    }
}

struct RoomDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { RoomDetail(room: testData[0]) }
    }
}
