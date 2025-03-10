//
//  TelaLogin.swift
//  Doubloons
//
//  Created by Turma01-11 on 10/03/25.
//

import SwiftUI

struct TelaLogin: View {
    @StateObject var financeiroView = FinanceiroViewModel()
    @State var nome = ""
    @State var message = ""
    var body: some View {
        VStack{
            Text("\(financeiroView.usuarios.count)")
            TextField("Nome do usuario", text: $nome)
            
            Text(message)
            
            Button("Confirmar"){
                
            }
        }.onAppear(){
            financeiroView.fetch()
        }
        
    }
}

#Preview {
    TelaLogin()
}
