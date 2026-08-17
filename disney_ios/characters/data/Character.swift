

struct CharactersContainer: Codable {
    let data: [Character]
}

struct Character: Codable {
    let id: Int
    let name: String
    let imageUrl: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case imageUrl
    }
}
