//
//  MockNewsItemDetailsView.swift
//  TempoTask
//
//  Created by Hesham Donia on 31/10/2021.
//

import UIKit

class MockNewsItemDetailsView: NewsItemDetailsView {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    public func getAuthorName() -> String {
        presenter?.getNewsItemDetails()?.author ?? ""
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
