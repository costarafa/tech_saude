import 'package:flutter/material.dart';
import 'package:saude_tech/app/database/dao/pressao_arterial_dao.dart';
import 'package:saude_tech/app/domain/entities/pressao_arterial.dart';
import 'package:saude_tech/app/my_app.dart';

class ListarPressao extends StatefulWidget {
  const ListarPressao({Key key}) : super(key: key);

  @override
  State<ListarPressao> createState() =>
      _ListarPressaoState();
}
// ignore: must_be_immutable
class _ListarPressaoState extends State<ListarPressao> {
PressaoArterialDAO pressaoArterialDAO = new PressaoArterialDAO();

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
                Navigator.pushNamed(context, '/cadastrarPressao');
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
            future: pressaoArterialDAO.listarTodos(),
            builder:
                (context, AsyncSnapshot<List<PressaoArterial>> snapshot) {
              if (!snapshot.hasData) return const CircularProgressIndicator();
              var lista = snapshot.data;
              return ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, contador) {
                    var pressao = lista[contador];
                    return ListTile(
                      title: Text(pressao.valorPressaoArterial),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              color: Colors.black38,
                              onPressed: () {
                                Navigator.pushNamed(context, '/editpressao',
                                        arguments: pressao)
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
                                                pressaoArterialDAO.excluir(int.parse(pressao.id.toString()));
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
