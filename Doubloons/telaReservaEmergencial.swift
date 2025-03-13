//
//  telaGastos.swift
//  telaGastos
//
//  Created by Turma01-11 on 27/02/25.
//

import SwiftUI

struct telaReservaEmergencial: View {
    @State var reserva = ReservaEmergencial(total_reserva: 0, mensalmente: 0, guardado_este_mes: 0, quantidade_de_meses_acumulados: 0, data_criacao: 0)
    @State var usuario : Financeiro = Financeiro(nome: "", saldo_em_conta: 0, renda_bruta_mensal: 0, saldo_restante_mensal: 0, gastos_fixos: GastosFixos(total_gastos: 0, gastos: [Gasto(titulo: "", valor: 0)]), metas_financeiras: MetasFinanceiras(total_metas: 0, metas: [Meta(titulo: "", data_criacao: 2)]), reserva_emergencial: ReservaEmergencial(total_reserva: 0, mensalmente: 0, guardado_este_mes: 0, quantidade_de_meses_acumulados: 0, data_criacao: 0), tarefas: [Tarefa(titulo: "", descricao: "", prioridade: "", status: "")])
    @ObservedObject var reservaEmergencialView = FinanceiroViewModel()
    
    @State var usuarios : [Financeiro] = []
    
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Text("Reserva Emergencial")
                        .font(.title)
                        .bold()
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
                        Text("R$ " + String(usuario.reserva_emergencial.total_reserva))
                            .font(.title3)
                            .bold()
                            .padding(.leading, 20)
                    }
                    .padding(.bottom, 10)
                    Spacer()
                }
                .padding(.bottom, 10)
            }
            .background(LinearGradient(gradient: Gradient(colors: [.verde, 
                .verdeM,
                .verdeE,
                .verdeP]), startPoint: .topTrailing, endPoint: .bottomLeading))
            .foregroundColor(.white)
            .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 20, bottomLeading: 20)))
            .shadow(radius: 10)
            .padding(.leading, 15)
        }
            Spacer().frame(height: 30)
        VStack{
            Text("Criar uma reserva:").bold().padding(.trailing,200)
            HStack{
                TextField("Entre com o valor a ser guardado todo mês", value: $reserva.mensalmente, format: .number)
                    .overlay(VStack{Divider().offset(x: 0, y: 15)})
            }.padding()
            HStack{
                Button( action: {
                    print(reserva)
                    
                }, label: {
                    Text("Criar")
                        .font(.title3)
                        .fontWeight(.semibold).foregroundColor(.white)
                })
            }.frame(width: 150, height: 60)
                .background(LinearGradient(gradient: Gradient(colors:[.verde, 
                    .verdeM,
                    .verdeE,
                    .verdeP]),startPoint: .topTrailing, endPoint: .bottomLeading))
                .clipShape(UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 10, topTrailing: 10)))
                .shadow(radius: 8).padding(.trailing,200).padding(.top)
            Spacer().frame(height: 30)
            
            Text("Reserva:").bold().padding(.trailing,275)
            
            ZStack{
                HStack{
                    Text("Total Acumulado: R$" + String(usuario.reserva_emergencial.total_reserva))
                    .frame(width: 300)
                    
                }.frame(width: 350,height: 70).background(.white)
                    .clipShape(Rectangle()).cornerRadius(10)
                    .shadow(radius: 10)
                HStack{
                    Text("Guardando todo mês: R$" + String(usuario.reserva_emergencial.guardado_este_mes))
                }.frame(width: 350,height: 70)
                .background(.white)
                .clipShape(Rectangle())
                .cornerRadius(10)
                .shadow(radius: 10)
                .offset(x: 0.0, y: 60.0)
                HStack{
                    Text("Guardado todo mês: R$" + String(usuario.reserva_emergencial.guardado_este_mes))
                }.frame(width: 350,height: 70)
                .background(.white)
                .clipShape(Rectangle())
                .cornerRadius(10)
                .shadow(radius: 10)
                .offset(x: 0.0, y: 120.0)
            }
            Spacer().frame(height: 150)
            HStack{
                Spacer().frame(width: 50)
                Text("Saldo Restante Mensal")
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                
                Spacer().frame(width: 45)
                
                Text("R$ "+String(usuario.saldo_restante_mensal))
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                
            }.frame(width: 370, height: 60)
                .background(.cinzaescuro)
                .clipShape(UnevenRoundedRectangle(cornerRadii: .init(bottomTrailing: 10, topTrailing: 10)))
                .shadow(radius: 8)
                .offset(x: -65)
        }.onAppear(){
            usuarios = reservaEmergencialView.usuarios.filter({$0._id == "f08635540136f70086da8e9a93f194f5"})
            
            if (usuarios.count > 0){
                usuario = usuarios.first!
            }
        }
    }
}
#Preview {
    telaReservaEmergencial()
}
