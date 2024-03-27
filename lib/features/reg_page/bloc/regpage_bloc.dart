import 'package:bloc/bloc.dart';
import 'package:crypt/crypt.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../util/util.dart';

part 'regpage_event.dart';
part 'regpage_state.dart';

///Bloc for controlling the status of the registration screen
class RegpageBloc extends Bloc<RegpageEvent, RegpageState> {
  RegpageBloc() : super(RegistrationInitial()) {
    on<SignUpUser>((event, emit) async {
      try {
        emit(RegistrationLoading());
        if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(event.email)) {
          throw Exception("Неверный формат почты");
        }
        if (!RegExp(r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[a-zA-Z\d]{8,}$").hasMatch(event.password)) {
          throw Exception("Неверный формат пароля");
        }
        if (event.password != event.repeatedPassword) throw Exception("Пароли не совпадают");

        await Supabase.instance.client.auth
            .signUp(email: event.email, password: Crypt.sha256(event.password, salt: salt).toString());
        emit(RegistrationSuccess());
      } catch (e) {
        emit(RegistrationFailure(exception: e));
      }
    });
  }
}
