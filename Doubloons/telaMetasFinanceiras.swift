//
//  telaMetasFinanceiras.swift
//  Doubloons
//
//  Created by Turma01-11 on 28/02/25.
//

import SwiftUI

struct telaMetasFinanceiras: View {
    
    @State var titulo : String=""
    
    @State var meta = Meta(titulo: "", valor: nil, mensalmente: nil, total_acumulado: nil, data_criacao: 0)
    
    @ObservedObject var financeiroView = FinanceiroViewModel()
    
    @State var usuarios : [Financeiro] = []
    
    @State var usuario : Financeiro?
    
    
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Text("Metas Financeiras")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.top, 20)
                        .padding(.leading, 20)
                        .padding(.bottom, 5)
                    Spacer()
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .frame(width: 40, height: 20)
                        .foregroundStyle(.white)
                        .padding()
                }
                HStack{
                    HStack{
                        Text("R$ 522,04")
                            .font(.title3)
                            .bold()
                            .padding(.leading, 20)
                    }
                    .padding(.bottom, 10)
                    Spacer()
                }
                .padding(.bottom, 10)
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.black]), startPoint: .topTrailing, endPoint: .bottomLeading))
            .foregroundColor(.white)
            .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 20, bottomLeading: 20)))
            .shadow(radius: 10)
            .padding(.leading, 15)
        }
        Spacer().frame(height: 30)
        HStack{
            VStack{
            Text("Criar objetivo:")
                    .fontWeight(.semibold).padding(.leading, -173)
                HStack{
                    TextField("Insira um titulo", text: $meta.titulo)
                        .overlay(VStack{Divider().offset(x: 0, y: 15)})
                }.padding()
                HStack{
                    TextField("Valor do objetivo", value: $meta.valor, format: .number)
                        .overlay(VStack{Divider().offset(x: 0, y: 15)})
                }.padding()
                HStack{
                    TextField("Quantidade mensal pra guardar", value: $meta.mensalmente, format: .number)
                        .overlay(VStack{Divider().offset(x: 0, y: 15)})
                }.padding()
                
                HStack{
                    TextField("Total acumulado até o momento", value: $meta.total_acumulado, format: .number)
                        .overlay(VStack{Divider().offset(x: 0, y: 15)})
                }.padding()

                Spacer().frame(height: 35)
                HStack{
                    Button( action: {
                        print(meta)
                        
                    }, label: {
                        Text("Criar")
                            .font(.title3)
                            .fontWeight(.semibold)
                    })
                   
                }
                .foregroundColor(.white)
                .frame(width: 130, height: 60)
                .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.black]), startPoint: .topTrailing, endPoint: .bottomLeading))
                .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 20, bottomLeading: 20, bottomTrailing: 20)))
                .shadow(radius: 5)
                .padding(.leading, -170)

                Spacer().frame(height: 35)
                
                Text("Metas criadas:").padding(.leading, -165).bold()
                
                ScrollView{
                    
                    
                    
                }
                
            }.padding(.leading, 20)
        }.onAppear(){
            usuarios = financeiroView.usuarios.filter({$0._id == "f08635540136f70086da8e9a93f194f5"})
            
            if (usuarios.count > 0){
                usuario = usuarios.first!
            }
        }
        Spacer()
    }
}

#Preview {
    telaMetasFinanceiras()
}
