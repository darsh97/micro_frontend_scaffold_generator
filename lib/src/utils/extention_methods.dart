import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

extension BlocExtensions<Event, State> on Bloc<Event, State> {
  Stream<State> get behaviorStream {
    var behaviorSubject = BehaviorSubject.seeded(state);
    behaviorSubject.addStream(stream).then((value) => behaviorSubject.close());

    return behaviorSubject.stream;
  }
}
