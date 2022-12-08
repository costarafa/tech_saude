import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saude_tech/app/database/dao/pressao_arterial_dao.dart';
import 'package:saude_tech/app/domain/entities/pressao_arterial.dart';

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
                        return SizedBox(
                            child: ListTile(
                              title: Text(pressao.valorPressaoArterial.toString() +" MMHG"),
                              trailing: SizedBox(
                                width: 100,
                                child: Row(
                                  children: [
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
                                                          pressaoArterialDAO.excluir(
                                                              int.parse(pressao.id
                                                                  .toString()));
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
                            )
                        );
                      });
                }
        ),
      );
    }




}