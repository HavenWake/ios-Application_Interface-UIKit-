//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Семён Пряничников on 14.04.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    let photosCollectionViewCell = PhotosCollectionViewCell()
    var photos: [PhotoModel] = []
    var photoNumber: UIImage?
    
    
    var isFullPhoto: Bool = false
    var endFrame: CGRect = CGRect()
    
    lazy var photoCollectionView: UICollectionView = {
        let photoLayout = UICollectionViewFlowLayout()
        photos = fetchData()
        photoLayout.scrollDirection = .vertical
        photoLayout.itemSize = CGSize(width:  (UIScreen.main.bounds.size.width - 32) / 3.0, height: (UIScreen.main.bounds.size.width - 32) / 3.0)
        photoLayout.minimumInteritemSpacing = 8
        photoLayout.minimumLineSpacing = 8
        photoLayout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        let photoCollectionView = UICollectionView.init(frame: .zero, collectionViewLayout: photoLayout)
        photoCollectionView.translatesAutoresizingMaskIntoConstraints = false
        photoCollectionView.dataSource = self
        photoCollectionView.delegate = self
        return photoCollectionView
    }()
    
    lazy var fullPhotoImageView: UIImageView = {
        let fullPhotoImageView = UIImageView()
        fullPhotoImageView.translatesAutoresizingMaskIntoConstraints = true
        fullPhotoImageView.layer.borderColor = UIColor.white.cgColor
        fullPhotoImageView.clipsToBounds = true
        fullPhotoImageView.alpha = 0
        return fullPhotoImageView
    }()
    
    lazy var transparentView: UIView = {
        let transparentView = UIView()
        transparentView.translatesAutoresizingMaskIntoConstraints = false
        transparentView.alpha = 0
        transparentView.backgroundColor = .black
        return transparentView
    }()
    
    lazy var closeButton: UIButton = {
        let closeButton = UIButton(type: .close)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.isUserInteractionEnabled = true
        closeButton.addTarget(self, action: #selector(closePicture), for: .touchUpInside)
        closeButton.isHidden = false
        closeButton.backgroundColor = .white
        closeButton.alpha = 0
        closeButton.clipsToBounds = true
        closeButton.layer.cornerRadius = 10
        return closeButton
    }()
    
    @objc private func closePicture() {
        self.isFullPhoto = false
        UIView.animate(withDuration: 0.5, animations: {
            self.fullPhotoImageView.frame = self.isFullPhoto ? UIScreen.main.bounds:self.endFrame
            self.view.layoutIfNeeded()
            self.transparentView.alpha = 0
            self.closeButton.alpha = 0
        }, completion: {_ in self.fullPhotoImageView.alpha = 0})
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Photo Gallery"
        
        setupViews()
        
        photoCollectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "photoCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setupViews() {
        view.backgroundColor = .white
        self.view.addSubview(photoCollectionView)
        self.view.addSubview(transparentView)
        self.view.addSubview(fullPhotoImageView)
        self.view.addSubview(closeButton)
        
        //Для колекшн вью
        self.photoCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.photoCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.photoCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.photoCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        //Для кнопки закрытия фото
        closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        //Для полупрозрачного вью
        transparentView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        transparentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        transparentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        transparentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let photoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotosCollectionViewCell
        let photo = photos[indexPath.row]
        photoCell.photoImageView.image = UIImage(named: photo.image)
        photoNumber = photoCell.photoImageView.image
        return photoCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoCell = collectionView.cellForItem(at: indexPath) as! PhotosCollectionViewCell
        isFullPhoto = true
        self.fullPhotoImageView.image = photoCell.photoImageView.image
        self.fullPhotoImageView.alpha = 1
        if let startingFrame = photoCell.superview?.convert(photoCell.frame, to: nil){
            self.fullPhotoImageView.frame = startingFrame
            self.endFrame = startingFrame
        }
        UIView.animate(withDuration: 0.5,animations: {
            self.fullPhotoImageView.frame = self.isFullPhoto ? CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width):self.endFrame
            self.fullPhotoImageView.center = self.view.center
            self.transparentView.alpha = 0.5
            self.closeButton.alpha = 1
            self.view.layoutIfNeeded()
        })
    }
}

extension PhotosViewController {
    func fetchData() -> [PhotoModel] {
        let onePhoto = PhotoModel.init(image: "photo1")
        let twoPhoto = PhotoModel.init(image: "photo2")
        let threePhoto = PhotoModel.init(image: "photo3")
        let fourPhoto = PhotoModel.init(image: "photo4")
        let fivePhoto = PhotoModel.init(image: "photo5")
        let sixPhoto = PhotoModel.init(image: "photo6")
        let sevenPhoto = PhotoModel.init(image: "photo7")
        let eightPhoto = PhotoModel.init(image: "photo8")
        let ninePhoto = PhotoModel.init(image: "photo9")
        let tenPhoto = PhotoModel.init(image: "photo10")
        let elevenPhoto = PhotoModel.init(image: "photo11")
        let twelvePhoto = PhotoModel.init(image: "photo12")
        let thirteenPhoto = PhotoModel.init(image: "photo13")
        let fourteenPhoto = PhotoModel.init(image: "photo14")
        let fifteenPhoto = PhotoModel.init(image: "photo15")
        let sixteenPhoto = PhotoModel.init(image: "photo16")
        let seventeenPhoto = PhotoModel.init(image: "photo17")
        let eighteenPhoto = PhotoModel.init(image: "photo18")
        let nineteenPhoto = PhotoModel.init(image: "photo19")
        let twentyPhoto = PhotoModel.init(image: "photo20")
        return [onePhoto, twoPhoto, threePhoto, fourPhoto, fivePhoto, sixPhoto, sevenPhoto, eightPhoto, ninePhoto, tenPhoto, elevenPhoto, twelvePhoto, thirteenPhoto, fourteenPhoto, fifteenPhoto, sixteenPhoto, seventeenPhoto, eighteenPhoto, nineteenPhoto, twentyPhoto ]
    }
}
