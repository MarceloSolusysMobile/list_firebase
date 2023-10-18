import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../screens/list_filmes.dart';
import 'filme.dart';

class CadastroFilme extends StatefulWidget {
  const CadastroFilme({super.key});

  @override
  State<CadastroFilme> createState() => _CadastroFilmeState();
}

class _CadastroFilmeState extends State<CadastroFilme> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _capaController = TextEditingController();
  final TextEditingController _duracaoController = TextEditingController();

  CollectionReference filmes = FirebaseFirestore.instance.collection('filmes');
  Future<void> addFilme(Filme filme) async {
    return filmes
        .add(filme.toMap())
        .then((value) => print("Filme Adicionado"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Filmes')),
      body: Column(
        children: [
          TextField(
            controller: _idController,
            decoration: const InputDecoration(
              labelText: 'ID',
            ),
          ),
          TextField(
            controller: _nomeController,
            decoration: const InputDecoration(
              labelText: 'Nome',
            ),
          ),
          TextField(
            controller: _capaController,
            decoration: const InputDecoration(
              labelText: 'Capa',
            ),
          ),
          TextField(
            controller: _duracaoController,
            decoration: const InputDecoration(
              labelText: 'Duração',
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          addFilme(Filme(
            id: _idController.text,
            nome: _nomeController.text,
            capa: _capaController.text,
            duracao: int.parse(_duracaoController.text),
          ));
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListFilmes()),
          );
        },
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
