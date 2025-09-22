class MovieDao {
  int? idMovie;
  String? nameMovie;
  String? time;
  String? dateRelease;

  MovieDao({this.idMovie,this.nameMovie,this.time,this.dateRelease});

  factory MovieDao.fromMap(Map<String, dynamic> mapa){  
    return MovieDao(
      idMovie: mapa['idMovie'],
      nameMovie: mapa['nameMovie'],
      time: mapa['time'],
      dateRelease: mapa['dateRelease']
    );
  }


}