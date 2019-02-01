import Foundation

struct ServerResponse: Codable {
    let data: [DataItem]
    let success: Bool
    let status: Int
}

struct DataItem: Codable {
    let id, title: String
    let description: String?
    let images: [ImgurImage]?
}

struct ImgurImage: Codable {
    let id: String
    let description: String?
    let width:Int
    let height:Int
    let type: TypeEnum
    let link: String
}


enum TypeEnum: String, Codable {
    case imageGIF = "image/gif"
    case imageJPEG = "image/jpeg"
    case imagePNG = "image/png"
    case videoMp4 = "video/mp4"
}
