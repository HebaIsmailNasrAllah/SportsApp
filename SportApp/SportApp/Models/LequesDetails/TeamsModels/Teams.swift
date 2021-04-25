/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Teams : Codable {
	var idTeam : String?
	var idSoccerXML : String?
	var idAPIfootball : String?
	var intLoved : String?
	var strTeam : String?
	var strTeamShort : String?
	var strAlternate : String?
	var intFormedYear : String?
	var strSport : String?
	var strLeague : String?
	var idLeague : String?
	var strLeague2 : String?
	var idLeague2 : String?
	var strLeague3 : String?
	var idLeague3 : String?
	var strLeague4 : String?
	var idLeague4 : String?
	var strLeague5 : String?
	var idLeague5 : String?
	var strLeague6 : String?
	var idLeague6 : String?
	var strLeague7 : String?
	var idLeague7 : String?
	var strDivision : String?
	var strManager : String?
	var strStadium : String?
	var strKeywords : String?
	var strRSS : String?
	var strStadiumThumb : String?
	var strStadiumDescription : String?
	var strStadiumLocation : String?
    var intStadiumCapacity : String?
	var strWebsite : String?
	var strFacebook : String?
	var strTwitter : String?
	var strInstagram : String?
	var strDescriptionEN : String?
	var strDescriptionDE : String?
	var strDescriptionFR : String?
	var strDescriptionCN : String?
	var strDescriptionIT : String?
	var strDescriptionJP : String?
	var strDescriptionRU : String?
	var strDescriptionES : String?
	var strDescriptionPT : String?
	var strDescriptionSE : String?
	var strDescriptionNL : String?
	var strDescriptionHU : String?
	var strDescriptionNO : String?
	var strDescriptionIL : String?
	var strDescriptionPL : String?
	var strGender : String?
	var strCountry : String?
    var strTeamBadge : String?
	var strTeamJersey : String?
	var strTeamLogo : String?
	var strTeamFanart1 : String?
	var strTeamFanart2 : String?
	var strTeamFanart3 : String?
	var strTeamFanart4 : String?
	var strTeamBanner : String?
	var strYoutube : String?
	var strLocked : String?

	enum CodingKeys: String, CodingKey {

		case idTeam = "idTeam"
		case idSoccerXML = "idSoccerXML"
		case idAPIfootball = "idAPIfootball"
		case intLoved = "intLoved"
		case strTeam = "strTeam" //
		case strTeamShort = "strTeamShort"
		case strAlternate = "strAlternate"
		case intFormedYear = "intFormedYear" //
		case strSport = "strSport" //
		case strLeague = "strLeague"
		case idLeague = "idLeague"
		case strLeague2 = "strLeague2"
		case idLeague2 = "idLeague2"
		case strLeague3 = "strLeague3"
		case idLeague3 = "idLeague3"
		case strLeague4 = "strLeague4"
		case idLeague4 = "idLeague4"
		case strLeague5 = "strLeague5"
		case idLeague5 = "idLeague5"
		case strLeague6 = "strLeague6"
		case idLeague6 = "idLeague6"
		case strLeague7 = "strLeague7"
		case idLeague7 = "idLeague7"
		case strDivision = "strDivision"
		case strManager = "strManager"
		case strStadium = "strStadium" //
		case strKeywords = "strKeywords"
		case strRSS = "strRSS"
		case strStadiumThumb = "strStadiumThumb"
		case strStadiumDescription = "strStadiumDescription"
		case strStadiumLocation = "strStadiumLocation"
		case intStadiumCapacity = "intStadiumCapacity"
		case strWebsite = "strWebsite"
		case strFacebook = "strFacebook"
		case strTwitter = "strTwitter"
		case strInstagram = "strInstagram"
		case strDescriptionEN = "strDescriptionEN"
		case strDescriptionDE = "strDescriptionDE"
		case strDescriptionFR = "strDescriptionFR"
		case strDescriptionCN = "strDescriptionCN"
		case strDescriptionIT = "strDescriptionIT"
		case strDescriptionJP = "strDescriptionJP"
		case strDescriptionRU = "strDescriptionRU"
		case strDescriptionES = "strDescriptionES"
		case strDescriptionPT = "strDescriptionPT"
		case strDescriptionSE = "strDescriptionSE"
		case strDescriptionNL = "strDescriptionNL"
		case strDescriptionHU = "strDescriptionHU"
		case strDescriptionNO = "strDescriptionNO"
		case strDescriptionIL = "strDescriptionIL"
		case strDescriptionPL = "strDescriptionPL"
		case strGender = "strGender"
		case strCountry = "strCountry" //
		case strTeamBadge = "strTeamBadge"  //
		case strTeamJersey = "strTeamJersey"
		case strTeamLogo = "strTeamLogo"
		case strTeamFanart1 = "strTeamFanart1"
		case strTeamFanart2 = "strTeamFanart2"
		case strTeamFanart3 = "strTeamFanart3"
		case strTeamFanart4 = "strTeamFanart4"
		case strTeamBanner = "strTeamBanner"
		case strYoutube = "strYoutube"
		case strLocked = "strLocked"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		idTeam = try values.decodeIfPresent(String.self, forKey: .idTeam)
		idSoccerXML = try values.decodeIfPresent(String.self, forKey: .idSoccerXML)
		idAPIfootball = try values.decodeIfPresent(String.self, forKey: .idAPIfootball)
		intLoved = try values.decodeIfPresent(String.self, forKey: .intLoved)
		strTeam = try values.decodeIfPresent(String.self, forKey: .strTeam)
		strTeamShort = try values.decodeIfPresent(String.self, forKey: .strTeamShort)
		strAlternate = try values.decodeIfPresent(String.self, forKey: .strAlternate)
		intFormedYear = try values.decodeIfPresent(String.self, forKey: .intFormedYear)
		strSport = try values.decodeIfPresent(String.self, forKey: .strSport)
		strLeague = try values.decodeIfPresent(String.self, forKey: .strLeague)
		idLeague = try values.decodeIfPresent(String.self, forKey: .idLeague)
		strLeague2 = try values.decodeIfPresent(String.self, forKey: .strLeague2)
		idLeague2 = try values.decodeIfPresent(String.self, forKey: .idLeague2)
		strLeague3 = try values.decodeIfPresent(String.self, forKey: .strLeague3)
		idLeague3 = try values.decodeIfPresent(String.self, forKey: .idLeague3)
		strLeague4 = try values.decodeIfPresent(String.self, forKey: .strLeague4)
		idLeague4 = try values.decodeIfPresent(String.self, forKey: .idLeague4)
		strLeague5 = try values.decodeIfPresent(String.self, forKey: .strLeague5)
		idLeague5 = try values.decodeIfPresent(String.self, forKey: .idLeague5)
		strLeague6 = try values.decodeIfPresent(String.self, forKey: .strLeague6)
		idLeague6 = try values.decodeIfPresent(String.self, forKey: .idLeague6)
		strLeague7 = try values.decodeIfPresent(String.self, forKey: .strLeague7)
		idLeague7 = try values.decodeIfPresent(String.self, forKey: .idLeague7)
		strDivision = try values.decodeIfPresent(String.self, forKey: .strDivision)
		strManager = try values.decodeIfPresent(String.self, forKey: .strManager)
		strStadium = try values.decodeIfPresent(String.self, forKey: .strStadium)
		strKeywords = try values.decodeIfPresent(String.self, forKey: .strKeywords)
		strRSS = try values.decodeIfPresent(String.self, forKey: .strRSS)
		strStadiumThumb = try values.decodeIfPresent(String.self, forKey: .strStadiumThumb)
		strStadiumDescription = try values.decodeIfPresent(String.self, forKey: .strStadiumDescription)
		strStadiumLocation = try values.decodeIfPresent(String.self, forKey: .strStadiumLocation)
		intStadiumCapacity = try values.decodeIfPresent(String.self, forKey: .intStadiumCapacity)
		strWebsite = try values.decodeIfPresent(String.self, forKey: .strWebsite)
		strFacebook = try values.decodeIfPresent(String.self, forKey: .strFacebook)
		strTwitter = try values.decodeIfPresent(String.self, forKey: .strTwitter)
		strInstagram = try values.decodeIfPresent(String.self, forKey: .strInstagram)
		strDescriptionEN = try values.decodeIfPresent(String.self, forKey: .strDescriptionEN)
		strDescriptionDE = try values.decodeIfPresent(String.self, forKey: .strDescriptionDE)
		strDescriptionFR = try values.decodeIfPresent(String.self, forKey: .strDescriptionFR)
		strDescriptionCN = try values.decodeIfPresent(String.self, forKey: .strDescriptionCN)
		strDescriptionIT = try values.decodeIfPresent(String.self, forKey: .strDescriptionIT)
		strDescriptionJP = try values.decodeIfPresent(String.self, forKey: .strDescriptionJP)
		strDescriptionRU = try values.decodeIfPresent(String.self, forKey: .strDescriptionRU)
		strDescriptionES = try values.decodeIfPresent(String.self, forKey: .strDescriptionES)
		strDescriptionPT = try values.decodeIfPresent(String.self, forKey: .strDescriptionPT)
		strDescriptionSE = try values.decodeIfPresent(String.self, forKey: .strDescriptionSE)
		strDescriptionNL = try values.decodeIfPresent(String.self, forKey: .strDescriptionNL)
		strDescriptionHU = try values.decodeIfPresent(String.self, forKey: .strDescriptionHU)
		strDescriptionNO = try values.decodeIfPresent(String.self, forKey: .strDescriptionNO)
		strDescriptionIL = try values.decodeIfPresent(String.self, forKey: .strDescriptionIL)
		strDescriptionPL = try values.decodeIfPresent(String.self, forKey: .strDescriptionPL)
		strGender = try values.decodeIfPresent(String.self, forKey: .strGender)
		strCountry = try values.decodeIfPresent(String.self, forKey: .strCountry)
		strTeamBadge = try values.decodeIfPresent(String.self, forKey: .strTeamBadge)
		strTeamJersey = try values.decodeIfPresent(String.self, forKey: .strTeamJersey)
		strTeamLogo = try values.decodeIfPresent(String.self, forKey: .strTeamLogo)
		strTeamFanart1 = try values.decodeIfPresent(String.self, forKey: .strTeamFanart1)
		strTeamFanart2 = try values.decodeIfPresent(String.self, forKey: .strTeamFanart2)
		strTeamFanart3 = try values.decodeIfPresent(String.self, forKey: .strTeamFanart3)
		strTeamFanart4 = try values.decodeIfPresent(String.self, forKey: .strTeamFanart4)
		strTeamBanner = try values.decodeIfPresent(String.self, forKey: .strTeamBanner)
		strYoutube = try values.decodeIfPresent(String.self, forKey: .strYoutube)
		strLocked = try values.decodeIfPresent(String.self, forKey: .strLocked)
	}
    
    init(strTeam: String? = nil,
         intFormedYear : String? = nil,
         strSport : String? = nil,
         strStadium :String? = nil,
         strCountry: String? = nil,
         strTeamBadge : String? = nil) {
        self.strTeam = strTeam
        self.intFormedYear = intFormedYear
        self.strSport = strSport
        self.strStadium = strStadium
        self.strCountry = strCountry
        self.strTeamBadge = strTeamBadge
    }
    
    init () {}
    

}
