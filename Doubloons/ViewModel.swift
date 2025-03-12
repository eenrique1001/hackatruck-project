//
//  ViewModel.swift
//  Doubloons
//
//  Created by Turma01-11 on 10/03/25.
//

import Foundation


class FinanceiroViewModel : ObservableObject {
    @Published var usuarios : [Financeiro] = []
//    @Published var usuario : Financeiro = Financeiro(nome: "", saldo_em_conta: 0, renda_bruta_mensal: 0, saldo_restante_mensal: 0, gastos_fixos: GastosFixos(total_gastos: 0, gastos: [Gasto(titulo: "", valor: 0)]), metas_financeiras: MetasFinanceiras(total_metas: 0, metas: [Meta(titulo: "", data_criacao: 2)]), reserva_emergencial: ReservaEmergencial(total_reserva: 0, mensalmente: 0, guardado_este_mes: 0, quantidade_de_meses_acumulados: 1, data_criacao: 2), tarefas: [Tarefa(titulo: "", descricao: "", prioridade: "", status: "")])
    
//    func fetch2() -> Financeiro {
//        print("entrou")
//        let url = "http://192.168.128.90:1880/getD"
//        
//        let task = URLSession.shared.dataTask(with: URL(string: url)!){
//            data, _, error in
//            do {
//                self.usuarios = try JSONDecoder().decode([Financeiro].self, from: data!)
//            } catch {
//                print(error)
//            }
//        }
//        
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: true){_ in
//            print(self.usuarios.filter({$0._id == "f08635540136f70086da8e9a93f194f5"}).count)
//            if (self.usuarios.filter({$0._id == "f08635540136f70086da8e9a93f194f5"}).count > 0){
//                self.usuario = self.usuarios.first!
////                print(self.usuario.nome)
//            }
//            task.resume()
//        }
//        
//        
//        
//        return usuario
//        
//    }
    
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

