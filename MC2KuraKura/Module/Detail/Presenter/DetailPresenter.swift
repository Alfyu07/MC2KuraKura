//
//  DetailPresenter.swift
//  MC2KuraKura
//
//  Created by Wahyu Alfandi on 03/06/23.
//

import SwiftUI

class DetailPresenter: ObservableObject {
    private let router = DetailRouter()
    private let detailUseCase: DetailUseCase
    
    @Published var meeting: MeetingModel
    
    init(detailUseCase: DetailUseCase) {
        self.detailUseCase = detailUseCase
        self.meeting = self.detailUseCase.getMeeting()
    }
    
    func getParticipantsName() -> String {
        if meeting.participants.isEmpty {
            return "There are no participants in this meeting"
            
        }
        if meeting.participants.count == 1 {
            return meeting.participants.first!.firstName
            
        }
        
        var hasil: String = ""
        for participant in meeting.participants {
            if participant == meeting.participants.last {
                hasil = hasil + "and " + participant.firstName
            } else {
                hasil = hasil + participant.firstName + ", "
            }
        }
        return hasil
    }
    
    func linkBuilder<Content: View>(
      @ViewBuilder content: () -> Content
    ) -> some View {
      NavigationLink(destination: router.makeVoteView(for: meeting)) { content() }
    }
    
}
