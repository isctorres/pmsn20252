import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pmsn20252/database/movies_database.dart';

class AddMovieScreen extends StatefulWidget {
  const AddMovieScreen({super.key});

  @override
  State<AddMovieScreen> createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
 
  MoviesDatabase? moviesDB;
  DateTime selectedDate = DateTime.now();
  TextEditingController conTitle = TextEditingController();
  TextEditingController conTime = TextEditingController();
  TextEditingController conRelease = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    moviesDB = MoviesDatabase();
  }

  @override
  Widget build(BuildContext context) {

    conRelease.text = selectedDate.toString();
   
    final txtTitle = TextFormField(
      controller: conTitle,
      decoration: InputDecoration(
        hintText: "Título de la película"
      ),
    );

    final txtTime = TextFormField(
      controller: conTime,
      decoration: InputDecoration(
        hintText: "Duración de la película"
      ),
    );

    final txtRelease = TextFormField(
      controller: conRelease,
      onTap: ()=>_selectedDate(context),
      decoration: InputDecoration(
        hintText: "Fecha de lanzamiento"
      ),
    );

    final btnGuardar = ElevatedButton(
      onPressed: (){
        moviesDB!.INSERT("tblMovies", {
          "nameMovie" : conTitle.text,
          "time" : conTime.text,
          "dateRelease" : conRelease.text 
        }).then((value) => Navigator.pop(context),);
      }, 
      child: Text("Guardar")
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Insertar película'),),
      body: ListView(
        shrinkWrap: true,
        children: [
          txtTitle,
          txtTime,
          txtRelease,
          btnGuardar
        ],
      ),
    );
  }

  _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context, 
      initialDate: selectedDate,
      firstDate: DateTime(2000), 
      lastDate: DateTime(2030)
    );
    if( picked != null && picked != selectedDate ){
      setState(() {
        selectedDate = picked;
      });
    }
  }

}