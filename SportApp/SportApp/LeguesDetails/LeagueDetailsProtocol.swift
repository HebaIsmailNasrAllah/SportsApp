//
//  LeagueDetailsProtocol.swift
//  SportApp
//
//  Created by Heba Ismail on 4/23/21.
//  Copyright © 2021 None. All rights reserved.
//

import Foundation
protocol LeagueDetailsProtocol : NSObjectProtocol {
    func setUpcomingEvents(allUpcomingEvents: [UpcomingEvents])
    func setLatestResults(allLatestResults: [Events])
    func setTeamsInLeague(allTeamsInLeague: [Teams])
    
}
