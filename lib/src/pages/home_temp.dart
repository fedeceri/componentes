import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  //const name({Key key}) : super(key: key);

  final opciones = ['Uno','Dos','Tres','Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
        
      ),
      body: ListView(
        children: _crearItemsCorta()
      ),
    );  
  }

  /* List<Widget> _crearItems(){
    List<Widget> lista = new List<Widget>();

    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      ); 
        lista..add(tempWidget)
             ..add(Divider());

    }
    return lista;
  } */

  List<Widget> _crearItemsCorta(){
    var widgets = opciones.map((item){
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Subtitulo'),
            leading: Icon(Icons.account_balance),
            trailing: Icon(Icons.arrow_downward),
            onTap: (){},
          ),
          Divider()
        ],
      );
    }).toList();
    return widgets;
  }


}