import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/cadastro_filme.dart';
import '../model/filme.dart';

class ListFilmes extends StatefulWidget {
  const ListFilmes({super.key});
  @override
  _ListFilmesState createState() => _ListFilmesState();
}

class _ListFilmesState extends State<ListFilmes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listagem de Filmes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CadastroFilme()),
      );
        },
        child: const Icon(Icons.plus_one),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('filmes').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          final List<DocumentSnapshot> documents = snapshot.data!.docs;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              Filme filme = Filme.fromDoc(documents[index]);
              return ListTile(
                leading: Image.network(filme.capa),
                trailing: Text(filme.id.toString()),
                title: Text(filme.nome),
                subtitle: Text(filme.duracao.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
