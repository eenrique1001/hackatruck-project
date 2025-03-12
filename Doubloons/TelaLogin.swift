//
//  TelaLogin.swift
//  Doubloons
//
//  Created by Turma01-11 on 10/03/25.
//

import SwiftUI

struct TelaLogin: View {
    @StateObject var financeiroView = FinanceiroViewModel()
    @State var nomeAux = ""
    @State var message = ""
    
    var body: some View {
        NavigationStack {
            VStack{
                Text("\(financeiroView.usuarios.count)")
                ForEach(financeiroView.usuarios, id: \.self){
                    i in
                    Text(i.nome)
                        .onAppear() {
                            nomeAux = i.nome
                            print(nomeAux)
                        }
                }
//                TextField("Nome do usuario", text: $nome)
                
                Text(message)
                
                //            Button("Confirmar"){
                //
                //            }
                NavigationLink(destination: telaMetasFinanceiras()) {
                    Text("PRÓXIMA TELA")
                }
                
            }.onAppear(){
                financeiroView.fetch()
            }
        }
    }
}

#Preview {
    TelaLogin()
}
