//
//  AfricanCountry.swift
//  Africa
//
//  Created by Julius Rucha on 22.08.25.
//

import Foundation

struct AfricanCountry: Identifiable, Codable {
    let id = UUID()
    
    enum CodingKeys: String, CodingKey {
        case name, population, area, capital, flag, region
    }
    let name: String
    let population: Int
    let area: Double // in square kilometers
    let capital: String
    let flag: String // emoji flag
    let region: String
    
    static let countries: [AfricanCountry] = [
        AfricanCountry(name: "Nigeria", population: 223_804_632, area: 923_768, capital: "Abuja", flag: "🇳🇬", region: "West Africa"),
        AfricanCountry(name: "Ethiopia", population: 126_527_060, area: 1_104_300, capital: "Addis Ababa", flag: "🇪🇹", region: "East Africa"),
        AfricanCountry(name: "Egypt", population: 112_716_598, area: 1_001_450, capital: "Cairo", flag: "🇪🇬", region: "North Africa"),
        AfricanCountry(name: "Democratic Republic of the Congo", population: 102_262_808, area: 2_344_858, capital: "Kinshasa", flag: "🇨🇩", region: "Central Africa"),
        AfricanCountry(name: "Tanzania", population: 67_438_106, area: 947_303, capital: "Dodoma", flag: "🇹🇿", region: "East Africa"),
        AfricanCountry(name: "South Africa", population: 60_414_495, area: 1_221_037, capital: "Pretoria", flag: "🇿🇦", region: "Southern Africa"),
        AfricanCountry(name: "Kenya", population: 55_100_586, area: 580_367, capital: "Nairobi", flag: "🇰🇪", region: "East Africa"),
        AfricanCountry(name: "Uganda", population: 48_582_334, area: 241_550, capital: "Kampala", flag: "🇺🇬", region: "East Africa"),
        AfricanCountry(name: "Sudan", population: 48_109_006, area: 1_886_068, capital: "Khartoum", flag: "🇸🇩", region: "North Africa"),
        AfricanCountry(name: "Algeria", population: 45_606_480, area: 2_381_741, capital: "Algiers", flag: "🇩🇿", region: "North Africa"),
        AfricanCountry(name: "Morocco", population: 37_840_044, area: 446_550, capital: "Rabat", flag: "🇲🇦", region: "North Africa"),
        AfricanCountry(name: "Angola", population: 36_684_202, area: 1_246_700, capital: "Luanda", flag: "🇦🇴", region: "Southern Africa"),
        AfricanCountry(name: "Ghana", population: 34_121_985, area: 238_535, capital: "Accra", flag: "🇬🇭", region: "West Africa"),
        AfricanCountry(name: "Mozambique", population: 33_897_354, area: 801_590, capital: "Maputo", flag: "🇲🇿", region: "Southern Africa"),
        AfricanCountry(name: "Madagascar", population: 30_325_732, area: 587_041, capital: "Antananarivo", flag: "🇲🇬", region: "East Africa"),
        AfricanCountry(name: "Cameroon", population: 28_647_293, area: 475_442, capital: "Yaoundé", flag: "🇨🇲", region: "Central Africa"),
        AfricanCountry(name: "Côte d'Ivoire", population: 28_713_423, area: 322_463, capital: "Yamoussoukro", flag: "🇨🇮", region: "West Africa"),
        AfricanCountry(name: "Niger", population: 27_202_843, area: 1_267_000, capital: "Niamey", flag: "🇳🇪", region: "West Africa"),
        AfricanCountry(name: "Burkina Faso", population: 23_251_485, area: 274_200, capital: "Ouagadougou", flag: "🇧🇫", region: "West Africa"),
        AfricanCountry(name: "Mali", population: 23_293_698, area: 1_240_192, capital: "Bamako", flag: "🇲🇱", region: "West Africa"),
        AfricanCountry(name: "Malawi", population: 20_931_751, area: 118_484, capital: "Lilongwe", flag: "🇲🇼", region: "Southern Africa"),
        AfricanCountry(name: "Zambia", population: 20_569_737, area: 752_618, capital: "Lusaka", flag: "🇿🇲", region: "Southern Africa"),
        AfricanCountry(name: "Senegal", population: 17_763_163, area: 196_722, capital: "Dakar", flag: "🇸🇳", region: "West Africa"),
        AfricanCountry(name: "Chad", population: 18_278_568, area: 1_284_000, capital: "N'Djamena", flag: "🇹🇩", region: "Central Africa"),
        AfricanCountry(name: "Somalia", population: 18_143_378, area: 637_657, capital: "Mogadishu", flag: "🇸🇴", region: "East Africa"),
        AfricanCountry(name: "Zimbabwe", population: 16_665_409, area: 390_757, capital: "Harare", flag: "🇿🇼", region: "Southern Africa"),
        AfricanCountry(name: "Guinea", population: 14_190_612, area: 245_857, capital: "Conakry", flag: "🇬🇳", region: "West Africa"),
        AfricanCountry(name: "Rwanda", population: 14_094_683, area: 26_338, capital: "Kigali", flag: "🇷🇼", region: "East Africa"),
        AfricanCountry(name: "Benin", population: 13_712_828, area: 114_763, capital: "Porto-Novo", flag: "🇧🇯", region: "West Africa"),
        AfricanCountry(name: "Burundi", population: 13_238_559, area: 27_830, capital: "Gitega", flag: "🇧🇮", region: "East Africa"),
        AfricanCountry(name: "Tunisia", population: 12_458_223, area: 163_610, capital: "Tunis", flag: "🇹🇳", region: "North Africa"),
        AfricanCountry(name: "South Sudan", population: 11_194_299, area: 619_745, capital: "Juba", flag: "🇸🇸", region: "East Africa"),
        AfricanCountry(name: "Togo", population: 9_053_799, area: 56_785, capital: "Lomé", flag: "🇹🇬", region: "West Africa"),
        AfricanCountry(name: "Sierra Leone", population: 8_791_092, area: 71_740, capital: "Freetown", flag: "🇸🇱", region: "West Africa"),
        AfricanCountry(name: "Libya", population: 6_888_388, area: 1_759_540, capital: "Tripoli", flag: "🇱🇾", region: "North Africa"),
        AfricanCountry(name: "Republic of the Congo", population: 6_106_869, area: 342_000, capital: "Brazzaville", flag: "🇨🇬", region: "Central Africa"),
        AfricanCountry(name: "Central African Republic", population: 5_742_315, area: 622_984, capital: "Bangui", flag: "🇨🇫", region: "Central Africa"),
        AfricanCountry(name: "Liberia", population: 5_418_377, area: 111_369, capital: "Monrovia", flag: "🇱🇷", region: "West Africa"),
        AfricanCountry(name: "Mauritania", population: 4_862_989, area: 1_030_700, capital: "Nouakchott", flag: "🇲🇷", region: "West Africa"),
        AfricanCountry(name: "Eritrea", population: 3_748_901, area: 117_600, capital: "Asmara", flag: "🇪🇷", region: "East Africa"),
        AfricanCountry(name: "Gambia", population: 2_773_168, area: 11_295, capital: "Banjul", flag: "🇬🇲", region: "West Africa"),
        AfricanCountry(name: "Botswana", population: 2_675_352, area: 581_730, capital: "Gaborone", flag: "🇧🇼", region: "Southern Africa"),
        AfricanCountry(name: "Namibia", population: 2_604_172, area: 825_615, capital: "Windhoek", flag: "🇳🇦", region: "Southern Africa"),
        AfricanCountry(name: "Gabon", population: 2_436_566, area: 267_667, capital: "Libreville", flag: "🇬🇦", region: "Central Africa"),
        AfricanCountry(name: "Lesotho", population: 2_330_318, area: 30_355, capital: "Maseru", flag: "🇱🇸", region: "Southern Africa"),
        AfricanCountry(name: "Guinea-Bissau", population: 2_150_842, area: 36_125, capital: "Bissau", flag: "🇬🇼", region: "West Africa"),
        AfricanCountry(name: "Equatorial Guinea", population: 1_714_671, area: 28_051, capital: "Malabo", flag: "🇬🇶", region: "Central Africa"),
        AfricanCountry(name: "Mauritius", population: 1_300_557, area: 2_040, capital: "Port Louis", flag: "🇲🇺", region: "East Africa"),
        AfricanCountry(name: "Eswatini", population: 1_210_822, area: 17_364, capital: "Mbabane", flag: "🇸🇿", region: "Southern Africa"),
        AfricanCountry(name: "Djibouti", population: 1_136_455, area: 23_200, capital: "Djibouti", flag: "🇩🇯", region: "East Africa"),
        AfricanCountry(name: "Comoros", population: 852_075, area: 1_862, capital: "Moroni", flag: "🇰🇲", region: "East Africa"),
        AfricanCountry(name: "Cabo Verde", population: 598_682, area: 4_033, capital: "Praia", flag: "🇨🇻", region: "West Africa"),
        AfricanCountry(name: "São Tomé and Príncipe", population: 231_856, area: 964, capital: "São Tomé", flag: "🇸🇹", region: "Central Africa"),
        AfricanCountry(name: "Seychelles", population: 107_660, area: 455, capital: "Victoria", flag: "🇸🇨", region: "East Africa")
    ]
}
