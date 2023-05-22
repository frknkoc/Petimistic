import Foundation

class Post {
    var email : String
    var description : String
    var imageurl : String
    
    init(email: String, description: String, imageurl: String) {
        self.email = email
        self.description = description
        self.imageurl = imageurl
    }
}
