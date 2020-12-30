
import 'package:movie_app/model/genre_response.dart';
import 'package:movie_app/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class GenresListBloc {
  //este es el servico por donde se recuperarn los datos;
  final MovieRepository _repository = MovieRepository();
  //este es el stream controller que por defecto funciona como broadcast
  final BehaviorSubject<GenreResponse> _subject = BehaviorSubject<GenreResponse>();

  getGenres() async {
    GenreResponse response = await _repository.getGenres();
    _subject.sink.add(response);
  }

  dispose(){
    //para cerrar el stream
    _subject.close();
  }
  // este es el getter del stream controller
  BehaviorSubject<GenreResponse> get subject => _subject;
}

final genresBloc = GenresListBloc();