//
//  ViewModel.swift
//  Doubloons
//
//  Created by Turma01-11 on 10/03/25.
//

import Foundation


class FinanceiroViewModel : ObservableObject {
    @Published var usuarios : [Financeiro] = []
    
    func fetch(){
        let url = "http://192.168.128.90:1880/getD"
        
        let task = URLSession.shared.dataTask(with: URL(string: url)!){
            data, _, error in
            do {
                self.usuarios = try JSONDecoder().decode([Financeiro].self, from: data!)
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
    
    func post(_ obj : Financeiro){
        
        
        guard let url = URL(string: "http://192.168.128.90:1880/postD") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // Headers must specify that the HTTP request body is JSON-encoded
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        
        let encoder = JSONEncoder()
        
        do {
            let jsonData = try encoder.encode(obj)
            request.httpBody = jsonData
            print("jsonData: ", String(data: request.httpBody!, encoding: .utf8) ?? "no body data")
        } catch {
            print("Error encoding to JSON: \(error.localizedDescription)")
        }
        
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error to send resource: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Error to send resource: invalid response")
                return
            }
            
            if httpResponse.statusCode == 200 {
                print("Resource POST successfully")
            } else {
                print("Error POST resource: status code \(httpResponse.statusCode)")
            }
        }
        
        task.resume()
        
    }
}

