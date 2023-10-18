import 'package:cloud_firestore/cloud_firestore.dart';

class Filme {
  String id;
  String nome;
  String capa;
  int duracao;

  Filme({this.id = '', this.nome = '', this.capa = '', this.duracao = 0});

  Map<String, dynamic> toMap() {
    return {'id': id, 'nome': nome, 'capa': capa, 'duracao': duracao};
  }

  factory Filme.fromDoc(DocumentSnapshot<Object?> data) {
    return Filme(
      id: data['id'],
      nome: data['nome'],
      capa: data['capa'],
      duracao: data['duracao'],
    );
  }


  
}
