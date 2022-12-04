//
//  APIGiter.swift
//  FetchChallenge
//
//  Created by Brady Robshaw on 12/2/22.
//

import Foundation

struct APIGitter {
    
    func fetch<T: Decodable>(_ callType: CallType)async throws -> T {
        let urlString: String
        
        switch callType {
        case .dessertList:
            urlString = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        case .meal(let id):
            urlString = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)"
            print("going to url \(urlString)")
        }
        
        return try await data(from: urlString)
    }
    
    private func data<T: Decodable>(from urlString: String)async throws -> T {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        let data = try await URLSession.shared.decode(T.self, from: url, dateDecodingStrategy: .formatted(dateFormatter))
        print("parsed data \(data)")
        return data
    }
    
    enum CallType {
        case dessertList
        case meal(id: String)
    }
}

extension URLSession {
    func decode<T: Decodable>(
        _ type: T.Type = T.self,
        from url: URL,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
        dataDecodingStrategy: JSONDecoder.DataDecodingStrategy = .deferredToData,
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate
    ) async throws  -> T {
        let (data, _) = try await data(from: url)

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = keyDecodingStrategy
        decoder.dataDecodingStrategy = dataDecodingStrategy
        decoder.dateDecodingStrategy = dateDecodingStrategy

        let decoded = try decoder.decode(T.self, from: data)
        return decoded
    }
}
