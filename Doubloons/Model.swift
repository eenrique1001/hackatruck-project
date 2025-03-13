//
//  Model.swift
//  Doubloons
//
//  Created by Turma01-11 on 28/02/25.
//

import Foundation

struct Financeiro: Codable, Hashable {
    var _id: String?
    var _rev: String?
    var nome: String
    var saldo_em_conta: Double
    var renda_bruta_mensal: Double
    var saldo_restante_mensal: Double
    var gastos_fixos: GastosFixos
    var metas_financeiras: MetasFinanceiras
    var reserva_emergencial: ReservaEmergencial
    var tarefas: [Tarefa]
}

struct GastosFixos: Codable, Hashable {
    var total_gastos: Double
    var gastos: [Gasto]
}

struct Gasto: Codable, Hashable {
    var titulo: String
    var valor: Double?
}

struct MetasFinanceiras: Codable, Hashable {
    var total_metas: Double?
    var metas: [Meta]
}

struct Meta: Codable, Hashable {
    var titulo: String
    var valor: Double?
    var mensalmente: Double?
    var total_acumulado: Double?
    var data_criacao: Int
}

struct ReservaEmergencial: Codable, Hashable {
    var total_reserva: Double
    var mensalmente: Double?
    var guardado_este_mes: Double
    var quantidade_de_meses_acumulados: Int
    var data_criacao: Int64
}

extension ReservaEmergencial: CustomStringConvertible{
    var description: String {
        let formatado = String(format: "%.2f", total_reserva)
        return "\(total_reserva): \(formatado)"
    }
}

struct Tarefa: Codable, Hashable {
    var titulo: String
    var descricao: String
    var prioridade: String
    var status: String
}
