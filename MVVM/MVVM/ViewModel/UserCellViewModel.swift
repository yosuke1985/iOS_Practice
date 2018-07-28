//
//  UserCellViewModel.swift
//  MVVM
//
//  Created by YOSUKE on 2018/07/28.
//  Copyright © 2018 YOSUKE. All rights reserved.
//

import Foundation
import UIKit

/*
 現在通ダウンロード中か、ダウンロード終了か、エラーかの状態をenumで定義
 */
enum ImageDownloadProgress {
    case loading(UIImage)
    case finish(UIImage)
    case error
}

final class UserCellViewModel {
    
    /*
     ユーザーを変数として保持
     */
    private var user: User
    
    /*
     ImageDownloaderを変数として保持
     */
    private let imageDownloader = ImageDownloader()
    
    /*
     ImageDownloaderでダウンロード中かどうかのBool変数として保持
     */
    private var isLoading = false
    
    /*
     Cellに反映させるアウトプット
     */
    var nickName: String {
        return user.name
    }
    
    /*
     Cellを選択した時に必要なwebURL
     */
    var webURL: URL {
        return URL(string: user.webURL)!
    }
    
    /*
     userを引数にinit
     */
    init(user: User) {
        self.user = user
    }
    
    /*
     imageDownloaderを使ってダウンロードし、その結果をImageDownloadProgressとしてClosureで返している
     */
    func downloadImage(progress :@escaping (ImageDownloadProgress) -> Void) {
        /*
         isLoadingがtrueだったら、returnしている。このメソッドはcellForRowメソッドで呼ばれる
         ことを想定しているため、何回もダウンロードしないためにisLoadingを使用している
         */
        if isLoading == true {
            return
        }
        
        isLoading = true
        
        /*
         grayのUIImageを作成
         */
        let loadingImage = UIImage(color: .gray, size: CGSize(width: 45, height: 45))!
        
        /*
         .loadingをClosureで返している
         */
        progress(.loading(loadingImage))
        
        /*
         imageDownloaderを用いて、画像をダウンロードしている。
         引数に、user.iconUrlを使っている
         ダウンロード終了したら、.finishをClosureで返している
         Errorだったら、.errorをClosureで返している
         */
        imageDownloader.downloadImage(imageURL: user.iconUrl,
                                      success: { (image) in
                                        progress(.finish(image))
                                        self.isLoading = false
        }) { (error) in
            progress(.error)
            self.isLoading = false
        }
    }
}
