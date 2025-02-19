//
//  ChatViewController.swift
//  ChitChaT
//
//  Created by Disha Limbani on 2024-01-23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestoreInternal

class ChatViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    
    //Variable
    let db = Firestore.firestore()
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = K.appName
        navigationItem.hidesBackButton = true
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        loadMessages()
    }
    
    func loadMessages(){
        
        
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener() { QuerySnapshot, error in
            self.messages = []
            
            if let e = error {
                print("there is an eooro \(e)")
            }else{
                
                if let snapshotDocument = QuerySnapshot?.documents {
                    for doc in snapshotDocument{
                        print(doc.data())
                         let data = doc.data()
                        if let senderData = data[K.FStore.senderField] as? String, let messageData = data[K.FStore.bodyField] as? String{
                            let newMessage = Message(sender: senderData, body: messageData)
                            self.messages.append(newMessage)
                        
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                let indexpath = IndexPath(row: self.messages.count - 1, section: 0)
                                self.tableView.scrollToRow(at: indexpath, at: .top, animated: false)
                            }
                            
                        }
                        
                    }
                }
            }
        }
        
        
    }
    // Send Message button
    @IBAction func onClickSend(_ sender: UIButton) {
        if messageTextfield.text != "" {
            
        
            if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
                // Add a new document with a generated ID
                db.collection(K.FStore.collectionName).addDocument(data: [
                    K.FStore.senderField : messageSender,
                    K.FStore.bodyField : messageBody,
                    K.FStore.dateField :Date().timeIntervalSince1970
                    
                ]){ (error) in
                    if let e = error {
                        
                        print("Error to add in Database.\(e)")
                    } else {
                        print("successfully added in Database.")
                        self.messageTextfield.text = ""
                    }
                    
                }
            }
        }
    }
    
    @IBAction func onClickBtnLogOut(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
    
   

}
extension ChatViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! CellMessage
        let messages = messages[indexPath.row]
       
        if messages.sender == Auth.auth().currentUser?.email{
            cell.leftImageView.isHidden = true
            cell.rightImgView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lighBlue)
            cell.label.textColor = UIColor(named: K.BrandColors.blue)
        }else{
            cell.leftImageView.isHidden = false
            cell.rightImgView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.blue)
            cell.label.textColor = UIColor(named: K.BrandColors.lighBlue)
        }
        cell.label?.text = messages.body
        return cell
    }
    
    
}
