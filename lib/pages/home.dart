import 'dart:io';

import 'package:bandnameapp/models/banda.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

// una lista de tipo bands
class _HomeState extends State<Home> {
  List<Bands> bands = [
    Bands(id: '1', name: 'Jose', votes: '2'),
    Bands(id: '2', name: 'Andres', votes: '2'),
    Bands(id: '3', name: 'Pepe', votes: '2'),
    Bands(id: '4', name: 'Juares', votes: '10'),
    Bands(id: '5', name: 'Jazmin', votes: '0'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Band Names '),
      ),
      body: ListView.builder(
          itemCount: bands.length,
          itemBuilder: (BuildContext context, int index) =>
              bandTile(bands[index])),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          // addNewBand(context);
          // _alertD(context);
          addNewBand();
          print('Abrir Dialong');
        },
        // solo hacemos la referencia
        child: const Icon(Icons.add),
      ),
    );
  }

  //  bamos a recibi banda
  Widget bandTile(Bands bands) {
    return Dismissible(
      direction: DismissDirection.startToEnd,

     
      background: Container(
        padding: const EdgeInsets.only(left: 8.0),
        color: Colors.amberAccent,
        child: const Align(
          child: Text('Dlete Bands'),
        ),
      ),
      onDismissed: (DismissDirection direction) {
        print('id ${bands.id}');
        // TODO: LLAMAR EL BORRADO EN EL SICKET
      },

      key: UniqueKey(),

      child: ListTile(
        onTap: () {
          print('Bans NAME');
        },
        title: Text(bands.name),
        trailing: Text(
          bands.votes,
          style: const TextStyle(fontSize: 20),
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          // indicmaos que solo necesitamos los dos primeros
          child: Text(
            bands.name.substring(0, 2),
          ),
        ),
      ),
    );
  }

  addNewBand() {
    final textController = TextEditingController();

    if (Platform.isAndroid) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.orange,
              title: const Text('Add new Bands'),
              content: TextField(
                controller: textController,
              ),
              actions: [
                MaterialButton(
                    color: Colors.black87,
                    child: const Text(
                      'Add Bnds',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                    onPressed: () {
                      addBandLis(textController.text);
                    })
              ],
            );
          });
    }

    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('new Bnad Nmae: '),
            content: CupertinoTextField(
              controller: textController,
            ),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true, // para que se note la accion
                onPressed: () {
                  addBandLis(textController.text);
                },
                child: const Text('Agregar'),
              ),

              // para cerrar se requiere otro button
              CupertinoDialogAction(
                isDestructiveAction: true,
                child: const Text('Dissmise'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        });
  }

  addBandLis(String name) {
    if (name.length > 1) {
      bands.add(Bands(id: DateTime.now().toString(), name: name, votes: '2'));
      setState(() {});
    }
    // cerrar el dialog
    Navigator.pop(context); // nos regredsa ala vista
  }
}
