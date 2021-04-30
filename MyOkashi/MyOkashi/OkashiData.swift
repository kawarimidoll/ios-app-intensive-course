//
//  OkashiData.swift
//  MyOkashi
//
//  Created by kawarimidoll on 2021/05/01.
//

import Foundation

class OkashiData: ObservableObject {

    struct ResultJson: Codable {
        struct Item: Codable {
            let id: String?
            let name: String?
            // priceはレスポンスが文字列でなく{}になってることがあるっぽいので対応が面倒…
            // let price: String?
            let url: URL?
            let image: URL?
        }

        let item: [Item]?
    }

    func search(keyword: String) {
        print("keyword: \(keyword)")

        guard let encoded_keyword = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }

        guard let req_url = URL(string: "https://sysbird.jp/webapi/?apikey=guest&format=json&keyword=\(encoded_keyword)&max=10&order=r") else {
            return
        }

        print("req_url: \(req_url)")

        let req = URLRequest(url: req_url)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: req) {
            (data, response, error) in
            session.finishTasksAndInvalidate()

            do {
                let decoder = JSONDecoder()
                let json = try decoder.decode(ResultJson.self, from: data!)

                print("result: \(json)")
            } catch {
                print("ERROR! \(error)")
            }
        }
        task.resume()
    }
}
