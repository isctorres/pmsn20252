import 'package:flutter/material.dart';
import 'package:pmsn20252/database/movies_database.dart';

class ListMovies extends StatefulWidget {
  const ListMovies({super.key});

  @override
  State<ListMovies> createState() => _ListMoviesState();
}

class _ListMoviesState extends State<ListMovies> {

  MoviesDatabase? moviesDB;

  @override
  void initState() {
    super.initState();
    moviesDB = MoviesDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Peliculas :)"),
        actions: [
          IconButton(
            onPressed: ()=>Navigator.pushNamed(context,"/add").then((value) => setState(() {}),), 
            icon: Icon(Icons.add)
          )
        ],
      ),
      body: FutureBuilder(
        future: moviesDB!.SELECT(), 
        builder: (context, snapshot) {
          if( snapshot.hasError ){
            return Center(child: Text('Something was wrong!'),);
          }else{
            if(snapshot.hasData){
              return snapshot.data!.isNotEmpty 
              ? ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final objM = snapshot.data![index];
                  return Container(
                    height: 100,
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Text(objM.nameMovie!),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: (){}, 
                              icon: Icon(Icons.edit)
                            ),
                            //Expanded(child: Container()),
                            IconButton(
                              onPressed: () async {
                                return showDialog(
                                  context: context, 
                                  builder: (context) => _buildAlertDialog(),
                                );
                              }, 
                              icon: Icon(Icons.delete)
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              )
              : Center(child: Text('No existen registros'),);
            }else{
              return Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
    );
  }

  Widget _buildAlertDialog(){
    return AlertDialog(
      title: Text('Atención :)'),
      content: Text('¿Deseas eliminar el registro?'),
      actions: [
        TextButton(
          onPressed: (){}, 
          child: Text('Aceptar', style: TextStyle(color: Colors.black),)
        ),
        TextButton(
          onPressed: ()=>Navigator.pop(context), 
          child: Text('Cancelar', style: TextStyle(color: Colors.black),)
        )
      ],
    );
  }

}