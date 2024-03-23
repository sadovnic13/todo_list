import 'package:bloc/bloc.dart';
import 'package:crypt/crypt.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_list/util/password_hashing.dart';

part 'logpage_event.dart';
part 'logpage_state.dart';

class LogpageBloc extends Bloc<LogpageEvent, LogpageState> {
  LogpageBloc() : super(LoginInitial()) {
    on<SignInUser>((event, emit) async {
      try {
        emit(LoginLoading());
        await Supabase.instance.client.auth
            .signInWithPassword(email: event.email, password: Crypt.sha256(event.password, salt: salt).toString());
        // categoryList = await categoryRepository.getCategoryList();
        // debugPrint(categoryList.toString());
        emit(LoginSuccess());
      } catch (e) {
        emit(LoginFailure(exception: e));
      }
    });
  }
}
