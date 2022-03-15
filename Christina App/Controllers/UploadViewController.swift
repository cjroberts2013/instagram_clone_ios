//
//  UploadViewController.swift
//  Christina App
//
//  Created by Charles Roberts on 3/12/22.
//

import UIKit
import Firebase

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var captionTextField: UITextField!
    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var uploadButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let getstureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(getstureRecognizer)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        selectedImage.image = nil
        uploadButton.isHidden = true
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func selectImageClicked(_ sender: Any) {
        
        view.endEditing(true)
        
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        selectedImage.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
        uploadButton.isHidden = false
    }
    
    @IBAction func uploadClicked(_ sender: Any) {
        print("Upload clicked")
        // Validate that the selected image is not nil.
        // Caption can be optional.
        let storage = Storage.storage()
        let storageReference = storage.reference()
        
        let mediaFolder = storageReference.child("media")
        
        if let data = selectedImage.image?.jpegData(compressionQuality: 0.5) {
            let imageReference = mediaFolder.child("image.jpeg")
            imageReference.putData(data, metadata: nil) { metaData, error in
                if error != nil {
                    print("Error occured\(error?.localizedDescription)")
                } else {
                    imageReference.downloadURL { url, error in
                        if error != nil {
                            print("Error occured\(error?.localizedDescription)")
                        } else {
                            let imageUrl = url?.absoluteString
                            print(imageUrl)
                        }
                    }
                    
                }
            }
        }
    }
    
}
