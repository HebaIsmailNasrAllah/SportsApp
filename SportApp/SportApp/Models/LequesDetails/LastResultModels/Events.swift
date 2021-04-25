/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Events : Codable {
	var idEvent : String?
	var idSoccerXML : String?
	var idAPIfootball : String?
	var strEvent : String?
	var strEventAlternate : String?
	var strFilename : String?
	var strSport : String?
	var idLeague : String?
	var strLeague : String?
	var strSeason : String?
	var strDescriptionEN : String?
	var strHomeTeam : String?
	var strAwayTeam : String?
	var intHomeScore : String?
	var intRound : String?
	var intAwayScore : String?
	var intSpectators : String?
	var strOfficial : String?
	var strHomeGoalDetails : String?
	var strHomeRedCards : String?
	var strHomeYellowCards : String?
	var strHomeLineupGoalkeeper : String?
	var strHomeLineupDefense : String?
	var strHomeLineupMidfield : String?
	var strHomeLineupForward : String?
	var strHomeLineupSubstitutes : String?
	var strHomeFormation : String?
	var strAwayRedCards : String?
	var strAwayYellowCards : String?
	var strAwayGoalDetails : String?
	var strAwayLineupGoalkeeper : String?
	var strAwayLineupDefense : String?
	var strAwayLineupMidfield : String?
	var strAwayLineupForward : String?
	var strAwayLineupSubstitutes : String?
	var strAwayFormation : String?
	var intHomeShots : String?
	var intAwayShots : String?
	var strTimestamp : String?
	var dateEvent : String?
	var dateEventLocal : String?
	var strTime : String?
	var strTimeLocal : String?
	var strTVStation : String?
	var idHomeTeam : String?
	var idAwayTeam : String?
	var strResult : String?
	var strVenue : String?
	var strCountry : String?
	var strCity : String?
	var strPoster : String?
	var strSquare : String?
	var strFanart : String?
	var strThumb : String?
	var strBanner : String?
	var strMap : String?
	var strTweet1 : String?
	var strTweet2 : String?
	var strTweet3 : String?
	var strVideo : String?
	var strStatus : String?
	var strPostponed : String?
	var strLocked : String?

	enum CodingKeys: String, CodingKey {

		case idEvent = "idEvent"
		case idSoccerXML = "idSoccerXML"
		case idAPIfootball = "idAPIfootball"
		case strEvent = "strEvent"
		case strEventAlternate = "strEventAlternate"
		case strFilename = "strFilename"
		case strSport = "strSport"
		case idLeague = "idLeague"
		case strLeague = "strLeague"
		case strSeason = "strSeason"
		case strDescriptionEN = "strDescriptionEN"
		case strHomeTeam = "strHomeTeam"
		case strAwayTeam = "strAwayTeam"
		case intHomeScore = "intHomeScore"
		case intRound = "intRound"
		case intAwayScore = "intAwayScore"
		case intSpectators = "intSpectators"
		case strOfficial = "strOfficial"
		case strHomeGoalDetails = "strHomeGoalDetails"
		case strHomeRedCards = "strHomeRedCards"
		case strHomeYellowCards = "strHomeYellowCards"
		case strHomeLineupGoalkeeper = "strHomeLineupGoalkeeper"
		case strHomeLineupDefense = "strHomeLineupDefense"
		case strHomeLineupMidfield = "strHomeLineupMidfield"
		case strHomeLineupForward = "strHomeLineupForward"
		case strHomeLineupSubstitutes = "strHomeLineupSubstitutes"
		case strHomeFormation = "strHomeFormation"
		case strAwayRedCards = "strAwayRedCards"
		case strAwayYellowCards = "strAwayYellowCards"
		case strAwayGoalDetails = "strAwayGoalDetails"
		case strAwayLineupGoalkeeper = "strAwayLineupGoalkeeper"
		case strAwayLineupDefense = "strAwayLineupDefense"
		case strAwayLineupMidfield = "strAwayLineupMidfield"
		case strAwayLineupForward = "strAwayLineupForward"
		case strAwayLineupSubstitutes = "strAwayLineupSubstitutes"
		case strAwayFormation = "strAwayFormation"
		case intHomeShots = "intHomeShots"
		case intAwayShots = "intAwayShots"
		case strTimestamp = "strTimestamp"
		case dateEvent = "dateEvent"
		case dateEventLocal = "dateEventLocal"
		case strTime = "strTime"
		case strTimeLocal = "strTimeLocal"
		case strTVStation = "strTVStation"
		case idHomeTeam = "idHomeTeam"
		case idAwayTeam = "idAwayTeam"
		case strResult = "strResult"
		case strVenue = "strVenue"
		case strCountry = "strCountry"
		case strCity = "strCity"
		case strPoster = "strPoster"
		case strSquare = "strSquare"
		case strFanart = "strFanart"
		case strThumb = "strThumb"
		case strBanner = "strBanner"
		case strMap = "strMap"
		case strTweet1 = "strTweet1"
		case strTweet2 = "strTweet2"
		case strTweet3 = "strTweet3"
		case strVideo = "strVideo"
		case strStatus = "strStatus"
		case strPostponed = "strPostponed"
		case strLocked = "strLocked"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		idEvent = try values.decodeIfPresent(String.self, forKey: .idEvent)
		idSoccerXML = try values.decodeIfPresent(String.self, forKey: .idSoccerXML)
		idAPIfootball = try values.decodeIfPresent(String.self, forKey: .idAPIfootball)
		strEvent = try values.decodeIfPresent(String.self, forKey: .strEvent)
		strEventAlternate = try values.decodeIfPresent(String.self, forKey: .strEventAlternate)
		strFilename = try values.decodeIfPresent(String.self, forKey: .strFilename)
		strSport = try values.decodeIfPresent(String.self, forKey: .strSport)
		idLeague = try values.decodeIfPresent(String.self, forKey: .idLeague)
		strLeague = try values.decodeIfPresent(String.self, forKey: .strLeague)
		strSeason = try values.decodeIfPresent(String.self, forKey: .strSeason)
		strDescriptionEN = try values.decodeIfPresent(String.self, forKey: .strDescriptionEN)
		strHomeTeam = try values.decodeIfPresent(String.self, forKey: .strHomeTeam)
		strAwayTeam = try values.decodeIfPresent(String.self, forKey: .strAwayTeam)
		intHomeScore = try values.decodeIfPresent(String.self, forKey: .intHomeScore)
		intRound = try values.decodeIfPresent(String.self, forKey: .intRound)
		intAwayScore = try values.decodeIfPresent(String.self, forKey: .intAwayScore)
		intSpectators = try values.decodeIfPresent(String.self, forKey: .intSpectators)
		strOfficial = try values.decodeIfPresent(String.self, forKey: .strOfficial)
		strHomeGoalDetails = try values.decodeIfPresent(String.self, forKey: .strHomeGoalDetails)
		strHomeRedCards = try values.decodeIfPresent(String.self, forKey: .strHomeRedCards)
		strHomeYellowCards = try values.decodeIfPresent(String.self, forKey: .strHomeYellowCards)
		strHomeLineupGoalkeeper = try values.decodeIfPresent(String.self, forKey: .strHomeLineupGoalkeeper)
		strHomeLineupDefense = try values.decodeIfPresent(String.self, forKey: .strHomeLineupDefense)
		strHomeLineupMidfield = try values.decodeIfPresent(String.self, forKey: .strHomeLineupMidfield)
		strHomeLineupForward = try values.decodeIfPresent(String.self, forKey: .strHomeLineupForward)
		strHomeLineupSubstitutes = try values.decodeIfPresent(String.self, forKey: .strHomeLineupSubstitutes)
		strHomeFormation = try values.decodeIfPresent(String.self, forKey: .strHomeFormation)
		strAwayRedCards = try values.decodeIfPresent(String.self, forKey: .strAwayRedCards)
		strAwayYellowCards = try values.decodeIfPresent(String.self, forKey: .strAwayYellowCards)
		strAwayGoalDetails = try values.decodeIfPresent(String.self, forKey: .strAwayGoalDetails)
		strAwayLineupGoalkeeper = try values.decodeIfPresent(String.self, forKey: .strAwayLineupGoalkeeper)
		strAwayLineupDefense = try values.decodeIfPresent(String.self, forKey: .strAwayLineupDefense)
		strAwayLineupMidfield = try values.decodeIfPresent(String.self, forKey: .strAwayLineupMidfield)
		strAwayLineupForward = try values.decodeIfPresent(String.self, forKey: .strAwayLineupForward)
		strAwayLineupSubstitutes = try values.decodeIfPresent(String.self, forKey: .strAwayLineupSubstitutes)
		strAwayFormation = try values.decodeIfPresent(String.self, forKey: .strAwayFormation)
		intHomeShots = try values.decodeIfPresent(String.self, forKey: .intHomeShots)
		intAwayShots = try values.decodeIfPresent(String.self, forKey: .intAwayShots)
		strTimestamp = try values.decodeIfPresent(String.self, forKey: .strTimestamp)
		dateEvent = try values.decodeIfPresent(String.self, forKey: .dateEvent)
		dateEventLocal = try values.decodeIfPresent(String.self, forKey: .dateEventLocal)
		strTime = try values.decodeIfPresent(String.self, forKey: .strTime)
		strTimeLocal = try values.decodeIfPresent(String.self, forKey: .strTimeLocal)
		strTVStation = try values.decodeIfPresent(String.self, forKey: .strTVStation)
		idHomeTeam = try values.decodeIfPresent(String.self, forKey: .idHomeTeam)
		idAwayTeam = try values.decodeIfPresent(String.self, forKey: .idAwayTeam)
		strResult = try values.decodeIfPresent(String.self, forKey: .strResult)
		strVenue = try values.decodeIfPresent(String.self, forKey: .strVenue)
		strCountry = try values.decodeIfPresent(String.self, forKey: .strCountry)
		strCity = try values.decodeIfPresent(String.self, forKey: .strCity)
		strPoster = try values.decodeIfPresent(String.self, forKey: .strPoster)
		strSquare = try values.decodeIfPresent(String.self, forKey: .strSquare)
		strFanart = try values.decodeIfPresent(String.self, forKey: .strFanart)
		strThumb = try values.decodeIfPresent(String.self, forKey: .strThumb)
		strBanner = try values.decodeIfPresent(String.self, forKey: .strBanner)
		strMap = try values.decodeIfPresent(String.self, forKey: .strMap)
		strTweet1 = try values.decodeIfPresent(String.self, forKey: .strTweet1)
		strTweet2 = try values.decodeIfPresent(String.self, forKey: .strTweet2)
		strTweet3 = try values.decodeIfPresent(String.self, forKey: .strTweet3)
		strVideo = try values.decodeIfPresent(String.self, forKey: .strVideo)
		strStatus = try values.decodeIfPresent(String.self, forKey: .strStatus)
		strPostponed = try values.decodeIfPresent(String.self, forKey: .strPostponed)
		strLocked = try values.decodeIfPresent(String.self, forKey: .strLocked)
	}
    init(){}

}
