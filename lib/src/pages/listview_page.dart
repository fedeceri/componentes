import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  ListaPage({Key key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _agregar10();
    
    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent ){
        //_agregar10();
        _fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Listas')
       ),
       body: Stack(
         children: <Widget> [
           _crearLista(),
           _crearLoading(),
         ]
         ),
    );
  }

  Widget _crearLista(){
    return RefreshIndicator(
      onRefresh: _obtenerPagina1,
        child: ListView.builder(
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index){
          final imagen = _listaNumeros[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
        itemCount: _listaNumeros.length,
      ),
    );
  }

  Future<Null> _obtenerPagina1() async{
    final duration = new Duration(seconds: 2);
     new Timer(duration, (){
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }

  void _agregar10(){
    for (var i = 0; i < 10; i++) {
      _ultimoItem ++;
      _listaNumeros.add(_ultimoItem);
    }

    setState(() {
      
    });
  }


  Future<Null> _fetchData() async{
    _isLoading = true;
    setState(() {
      
      final _duration = new Duration(seconds: 2);
      new Timer(_duration, respuestaHTTP);
    });
  }

  void respuestaHTTP(){

    _isLoading = false;

    _scrollController.animateTo(_scrollController.position.pixels +100, curve: Curves.fastOutSlowIn, duration: new Duration(milliseconds: 250));

    _agregar10();

  }

  Widget _crearLoading(){
    if(_isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15.0)
        ],
      );
    }else{
      return Container();
    }
  
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

}