//
//  ContentView.swift
//  doubloons1
//
//  Created by Turma01-4 on 26/02/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var financeiroView = FinanceiroViewModel()
    @State var usuario : Financeiro = Financeiro(nome: "", saldo_em_conta: 0, renda_bruta_mensal: 0, saldo_restante_mensal: 0, gastos_fixos: GastosFixos(total_gastos: 0, gastos: [Gasto(titulo: "", valor: 0)]), metas_financeiras: MetasFinanceiras(total_metas: 0, metas: [Meta(titulo: "", data_criacao: 2)]), reserva_emergencial: ReservaEmergencial(total_reserva: 0, mensalmente: 0, guardado_este_mes: 0, quantidade_de_meses_acumulados: 1, data_criacao: 2), tarefas: [Tarefa(titulo: "", descricao: "", prioridade: "", status: "")])
    @State var usuarios: [Financeiro] = []
    @State var renda:String = ""
    @State var mostra : Bool = false
    @State var eye2 : String = "eye"
<<<<<<< HEAD
    @State var dinheiro : String = "R$ 1522,04"
    @StateObject var obj1 = FinanceiroViewModel()
=======
    @State var dinheiro : String = ""

>>>>>>> main
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
                        Text("Bem-vindo(a), " + usuario.nome)
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
                NavigationLink(destination:telaGastos(usuario: usuario)){
                    HStack{
                        VStack(alignment:.leading){
                            Text("Gastos fixos").foregroundColor(.white).bold()
                            Spacer().frame(height: 5)
                            Text("R$" + String(usuario.gastos_fixos.total_gastos)).foregroundColor(.white)
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
                NavigationLink(destination:telaMetasFinanceiras(usuario: usuario)){
                    HStack{
                        VStack(alignment:.leading){
                            Text("Metas Financeiras").foregroundColor(.white).bold()
                            Spacer().frame(height: 5)
                            Text("R$" + String(usuario.metas_financeiras.total_metas!)).foregroundColor(.white)
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
                NavigationLink(destination:telaReservaEmergencial(usuario: usuario)){
                    HStack{
                        VStack(alignment:.leading){
                            Text("Reserva               Emergencial").foregroundColor(.white).bold().multilineTextAlignment(.leading)
                            Spacer().frame(height: 5)
                            Text("R$" + String(usuario.reserva_emergencial.total_reserva)).foregroundColor(.white)
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
                            Text("R$" + String(usuario.saldo_restante_mensal)).foregroundColor(.white)
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
            NavigationLink(destination:telaTarefas(usuario: usuario)){
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
                    ,startPoint: .bottomLeading, endPoint: .topTrailing))
                .clipShape(UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 20, topTrailing: 20))).offset(y:30)
            }
<<<<<<< HEAD
        }.onAppear {
            obj1.fetch()
=======
        }.onAppear(){
            financeiroView.fetch()
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true){_ in
                usuarios = financeiroView.usuarios.filter({$0.nome == "Hesse"})
                print(usuarios.count)
                if (usuarios.count > 0){
                    usuario = usuarios.first!
                    dinheiro = "R$" + String(usuario.saldo_em_conta)
                }
            }
>>>>>>> main
        }
    }
}

#Preview {
    ContentView()
}
