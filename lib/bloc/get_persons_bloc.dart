import 'package:movie_app/model/person_response.dart';
import 'package:movie_app/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class PersonsListBloc{
  final _repository = MovieRepository();
  final _subject = BehaviorSubject<PersonResponse>();

  getPersons() async{
    var reponse = await _repository.getPersons();
    _subject.sink.add(reponse);
  }

  dispose(){
    _subject.close();
  }

  BehaviorSubject<PersonResponse> get subject => _subject;

  
}

final personaBloc = PersonsListBloc();