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
        let url = ""
        
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
}

