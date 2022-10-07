import 'package:bloc/bloc.dart';

import '../../core/events/session_expired_event.dart';
import '../../core/helpers/event_bus.dart';
import '../../di/injection.dart';
import 'session_state.dart';

class SessionBloc extends Cubit<SessionState> {
  final _eventBus = getIt<EventBus>();
  SessionBloc() : super(SessionInitial()) {
    _eventBus.on<SessionExpiredEvent>().listen((_) {
      emit(SessionExpired());
    });
  }
}
