import 'package:movie_app/model/movie_response.dart';
import 'package:movie_app/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class MovieListBloc {
  //este es el servico por donde se ecuperarn los datos;
  final MovieRepository _repository = MovieRepository();
  //este es el stream controller que por defecto funciona como broadcast
  final BehaviorSubject<MovieResponse> _subject = BehaviorSubject<MovieResponse>();

  getMovies() async {
    MovieResponse response = await _repository.getMovies();
    _subject.sink.add(response);
  }

  dispose(){
    //para cerrar el stream
    _subject.close();
  }
  // este es el getter del stream controller
  BehaviorSubject<MovieResponse> get subject => _subject;
}

final movieBloc = MovieListBloc();