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
    
    @State var usuario : Financeiro = Financeiro(nome: "", saldo_em_conta: 0, renda_bruta_mensal: 0, saldo_restante_mensal: 0, gastos_fixos: GastosFixos(total_gastos: 0, gastos: [Gasto(titulo: "", valor: 0)]), metas_financeiras: MetasFinanceiras(total_metas: 0, metas: [Meta(titulo: "teste", data_criacao: 1740405814346)]), reserva_emergencial: ReservaEmergencial(total_reserva: 0, mensalmente: 0, guardado_este_mes: 0, quantidade_de_meses_acumulados: 0, data_criacao: 0), tarefas: [Tarefa(titulo: "", descricao: "", prioridade: "", status: "")])
    
    
    
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
                        Text("R$" + String(usuario.metas_financeiras.total_metas!))
                            .font(.title3)
                            .bold()
                            .padding(.leading, 20)
                    }
                    .padding(.bottom, 10)
                    Spacer()
                }
                .padding(.bottom, 10)
            }
            .background(LinearGradient(gradient: Gradient(colors: [.roxoC, .roxoE]), startPoint: .topTrailing, endPoint: .bottomLeading))
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
                .background(LinearGradient(gradient: Gradient(colors: [.roxoC, .roxoE]), startPoint: .topTrailing, endPoint: .bottomLeading))
                .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 20, bottomLeading: 20, bottomTrailing: 20)))
                .shadow(radius: 5)
                .padding(.leading, -170)
                
                Spacer().frame(height: 35)
                
                Text("Metas criadas:").padding(.leading, -165).bold()
                
                ScrollView{
                    VStack {
                        ForEach(usuario.metas_financeiras.metas, id: \.self){
                            m in
                            HStack{
                                VStack{
                                    Text(m.titulo)
                                    Text("\(m.valor)")
                                    Text("\(m.mensalmente)")
                                    Text("\(m.total_acumulado)")
                                    Text(Date(timeIntervalSince1970: TimeInterval(m.data_criacao/1000)).description)
                                    
                                    
                                    
                                }
                            }
                            
                        }
                    }
                    
                    
                }
                
            }
            .padding(.leading, 20)
        }
        Spacer()
    }
}



#Preview {
    telaMetasFinanceiras()
}
