import 'package:crypt/crypt.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../util/util.dart';

part 'logpage_event.dart';
part 'logpage_state.dart';

class LogpageBloc extends Bloc<LogpageEvent, LogpageState> {
  LogpageBloc() : super(LoginInitial()) {
    on<SignInUser>((event, emit) async {
      try {
        emit(LoginLoading());
        await Supabase.instance.client.auth
            .signInWithPassword(email: event.email, password: Crypt.sha256(event.password, salt: salt).toString());
        emit(LoginSuccess());
      } catch (e) {
        emit(LoginFailure(exception: e));
      }
    });
  }
}
