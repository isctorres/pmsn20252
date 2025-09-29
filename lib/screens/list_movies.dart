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
            onPressed: ()=>Navigator.pushNamed(context,"/add"), 
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
              ? ListView.builder(
                itemBuilder: (context, index) {
                  final objM = snapshot.data![index];
                  return Container(
                    height: 100,
                    color: Colors.black,
                    child: Text(objM.nameMovie!),
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
}