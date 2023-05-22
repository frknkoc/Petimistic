import UIKit
import Firebase
import SDWebImage

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var postArr = [Post]()
    /*
    var emailArr = [String]()
    var descriptionArr = [String]()
    var imageArr = [String]()
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        firebaseGetData()
    }
    
    func firebaseGetData() {
        let firestoreDatabase = Firestore.firestore()
        firestoreDatabase.collection("Post").order(by: "date", descending: true)
            .addSnapshotListener { (snapshot, error) in //parantezi ekledim
            if error != nil {
                print("Hata")
            } else {
                if snapshot?.isEmpty != true && snapshot != nil{ //snapshot != nil kaldırılabilir
                    self.postArr.removeAll(keepingCapacity: false)

                    for document in snapshot!.documents {
                        let documentId = document.documentID
                        //print(documentId)
                        
                        if let imageurl = document.get("imageurl") as? String {
                            if let description = document.get("description") as? String {
                                if let email = document.get("email") as? String {
                                    let post = Post(email: email, description: description, imageurl: imageurl)
                                    self.postArr.append(post)
                                }
                            }
                        }
                    }
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.descriptionLabel.text = postArr[indexPath.row].description
        cell.postImageView.sd_setImage(with: URL(string: self.postArr[indexPath.row].imageurl))
        cell.emailLabel.text = postArr[indexPath.row].email
        return cell
    }
}
