import 'package:flutter/material.dart';
import 'package:saude_tech/app/database/dao/glicemia_dao.dart';
import 'package:saude_tech/app/database/dao/pressao_arterial_dao.dart';
import 'package:saude_tech/app/domain/entities/glicemia.dart';
import 'package:saude_tech/app/domain/entities/pressao_arterial.dart';
import 'package:saude_tech/app/my_app.dart';

class ListarGlicemia extends StatefulWidget {
  const ListarGlicemia({Key key}) : super(key: key);

  @override
  State<ListarGlicemia> createState() =>
      _ListarGlicemiaState();
}
// ignore: must_be_immutable
class _ListarGlicemiaState extends State<ListarGlicemia> {
GlicemiaDAO glicemiaDAO = new GlicemiaDAO();

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
        return Scaffold(
        appBar: AppBar(
          title: Text("Tech Saúde"),
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, '/cadastrarGlicemia');
              },
            )
          ],
          leading: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/menuLateral');
            },
            child: Icon(
              Icons.menu,
            ),
          ),
        ),
    body:  
    GridView.count(
          crossAxisCount: (orientation == Orientation.portrait) ? 1 : 2,
          childAspectRatio: (1 / .4),
          children: [
    FutureBuilder(
            future: glicemiaDAO.listarTodos(),
            builder:
                (context, AsyncSnapshot<List<Glicemia>> snapshot) {
              if (!snapshot.hasData) return const CircularProgressIndicator();
              var lista = snapshot.data;
              return ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, contador) {
                    var glicemia = lista[contador];
                    return ListTile(
                      title: Text(glicemia.valorGlicemia),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              color: Colors.black38,
                              onPressed: () {
                                Navigator.pushNamed(context, '/editpressao',
                                        arguments: glicemia)
                                    .then((value) {
                                  setState(() {});
                                });
                              },
                            ),
                            IconButton(
                                icon: const Icon(Icons.delete),
                                color: Colors.black38,
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: const Text("Excluir?"),
                                          actions: [
                                            ElevatedButton(
                                              child: const Text("Sim"),
                                              onPressed: () {
                                                setState(() {
                                                glicemiaDAO.excluir(int.parse(glicemia.id.toString()));
                                                });
                                                Navigator.pop(context);
                                              },
                                            ),
                                            ElevatedButton(
                                              child: const Text("Não"),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                })
                          ],
                        ),
                      ),
                    );
                  });
            }
            )
],
        ),
      );
    });
          
          
          
  }
}
