import 'package:bloc/bloc.dart';


part 'welcome_events.dart';
part 'welcome_states.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    on<WelcomeEvent>((event, emit) {
      // TODO: implement event handler
      emit(WelcomeState(page: state.page));
    });
  }
}
