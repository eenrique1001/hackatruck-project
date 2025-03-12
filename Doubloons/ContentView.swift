//
//  ContentView.swift
//  doubloons1
//
//  Created by Turma01-4 on 26/02/25.
//

import SwiftUI

struct ContentView: View {
    @State var renda:String = ""
    @State var mostra : Bool = true
    @State var eye2 : String = "eye"
    @State var dinheiro : String = "R$ 1522,04"

    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text("Saldo em Conta")
                        .font(.title)
                        .bold()
                        .padding(.top, 20)
                        .padding(.leading, 20)
                        .padding(.bottom, 5)
                    Spacer()
                    Image(systemName: "line.3.horizontal")
                        .imageScale(.large)
                        .foregroundStyle(.white)
                        .padding()
                }
                HStack{
                    HStack{
                        Text(dinheiro)
                            .font(.title3)
                            .bold()
                            .padding(.leading, 20)
                        Spacer()
                        Image(systemName: eye2)
                            .padding(.trailing, 22)
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    .onTapGesture {
                        mostra.toggle()
                        if mostra == false {
                            eye2 = "eye.slash.fill"
                            dinheiro = "************"
                        } else {
                            mostra = true
                            eye2 = "eye"
                            dinheiro = "R$ 1522,04"
                        }
                    }.frame(width: 200, height: 40)
                    
                    HStack{
                        Text("Bem-vindo(a), Hesse!")
                            .font(.callout)
                            .padding(.trailing, 10)
                    }
                }
                .padding(.bottom, 10)
            }
            .background(LinearGradient(gradient: Gradient(colors: [.azulbebe, 
                .azulbebeE,
                .azulbebeP])
                ,startPoint: .topTrailing, endPoint: .bottomLeading))
            .foregroundColor(.white)
            .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 20, bottomLeading: 20)))
            .padding(.leading, 15)
            .shadow(radius: 15).offset(y:-70)
            HStack{
                Text("Renda Bruta Mensal")
                    .font(.title3)
                    .bold()
                    .frame(height: 30)
                    .padding(.trailing)
                HStack{
                    Text("R$").font(.title3)
                    TextField("Digite aqui", text: $renda)
                        .keyboardType(.decimalPad)
                        .font(.title3)
                        .foregroundColor(.white)
                        .font(.system(size: 15))
                }.frame(width: 110)
            }
            .frame(width: 380,height: 70)
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [.azulbebe, 
                .azulbebeE ,
                .azulbebeP])
                ,startPoint: .topTrailing, endPoint: .bottomLeading))
            .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 20, bottomTrailing: 20))).offset(y:-50)
            HStack{
                NavigationLink(destination:telaGastos()){
                    HStack{
                        VStack(alignment:.leading){
                            Text("Gastos fixos").foregroundColor(.white).bold()
                            Spacer().frame(height: 5)
                            Text("$522,04").foregroundColor(.white)
                            Spacer().frame(height: 30)
                            Text("Editar").font(.system(size: 15)).foregroundColor(.white)
                        }.padding(.leading,-40)
                    }.frame(width: 180,height: 130)
                        .background(LinearGradient(gradient: Gradient(colors: [.vermeioE,
                            .vermeioM,
                            .vermeio,
                            .vermeioC]),
                            startPoint: .topLeading,endPoint: .bottomTrailing))
                        .padding(1)
                        .background()
                        .cornerRadius(25)
                        .shadow(radius: 10)
                }
                NavigationLink(destination:telaMetasFinanceiras()){
                    HStack{
                        VStack(alignment:.leading){
                            Text("Metas Financeiras").foregroundColor(.white).bold()
                            Spacer().frame(height: 5)
                            Text("$522,04").foregroundColor(.white)
                            Spacer().frame(height: 30)
                            Text("Editar").font(.system(size: 15)).foregroundColor(.white)
                        }.padding(.leading,0)
                    }.frame(width: 180,height: 130)
                        .background(LinearGradient(gradient: Gradient(colors: [.roxoE,
                            .roxoM,
                            .roxoC])
                            ,startPoint: .topLeading,endPoint: .bottomTrailing))
                        .padding(1)
                        .background()
                        .cornerRadius(25)
                        .shadow(radius: 10)
                }
            }.offset(y:-20)
            HStack{
                NavigationLink(destination:telaReservaEmergencial()){
                    HStack{
                        VStack(alignment:.leading){
                            Text("Reserva               Emergencial").foregroundColor(.white).bold().multilineTextAlignment(.leading)
                            Spacer().frame(height: 5)
                            Text("$522,04").foregroundColor(.white)
                            Spacer().frame(height: 10)
                            Text("Editar").font(.system(size: 15)).foregroundColor(.white)
                        }.padding(.leading,-15)
                    }.frame(width: 180,height: 130)
                        .background(LinearGradient(gradient: Gradient(colors: [.verdeP,
                            .verdeE,
                            .verdeM,
                            .verde])
                        ,startPoint: .topLeading,endPoint: .bottomTrailing))
                        .padding(1)
                        .background()
                        .cornerRadius(25)
                        .shadow(radius: 10)
                }
                    HStack{
                        VStack(alignment:.leading){
                            Text("Saldo Restante    Mensal").foregroundColor(.white).bold().multilineTextAlignment(.leading)
                            Spacer().frame(height: 5)
                            Text("$522,04").foregroundColor(.white)
                            Spacer().frame(height: 30)
                        }.padding(.leading,-10)
                    }.frame(width: 180,height: 130)
                    .background(LinearGradient(gradient: Gradient(colors: [.azulbebeP, 
                        .azulbebeM])
                        ,startPoint: .topLeading,endPoint: .bottomTrailing))
                        .padding(1)
                        .background()
                        .cornerRadius(25)
                        .shadow(radius: 50)
                
            }.offset(y:-10)
            NavigationLink(destination:telaTarefas()){
                HStack{
                    Text("Tarefas")
                        .font(.title3)
                        .bold()
                        .padding(.leading, 125)
                        .padding(.trailing, 125)
                }
                .foregroundColor(.white)
                .padding(20)
                .background(LinearGradient(gradient: Gradient(colors: [.ocreE, 
                    .ocreM,
                    .ocreC])
                    ,startPoint: .topTrailing, endPoint: .bottomLeading))
                .clipShape(UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 20, topTrailing: 20))).offset(y:30)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
