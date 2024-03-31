import 'package:education/models/user/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'user_bloc_event.dart';
part 'user_bloc_state.dart';

class UserBlocBloc extends Bloc<UserBlocEvent, UserBlocState> {
  UserBlocBloc() : super(UserBlocInitial(List.empty())) {
    on<UserBlocEvent>((event, emit) async {
      if (event is FailedUser) {
        emit(UserBlocFailed(state.user, 'Error'));
      } else {
        emit(UserBlocLoading(state.user));
      }

      await Future.delayed(const Duration(seconds: 2));
      if (event is AddUser) {
        try {
          List<UserModel> newUser = List.from(state.user)..add(event.user);
          emit(UserBlocLoaded(newUser));
        } catch (e) {
          emit(UserBlocFailed(state.user, e.toString()));
        }
      } else if (event is UpdateUser) {
        try {
          List<UserModel> newUser = state.user;
          newUser[event.index] = event.user;
          emit(UserBlocLoaded(newUser));
        } catch (e) {
          emit(UserBlocFailed(state.user, e.toString()));
        }
      } else if (event is RemoveUser) {
        try {
          state.user.removeAt(event.index);
          emit(UserBlocLoaded(state.user));
        } catch (e) {
          emit(UserBlocFailed(state.user, e.toString()));
        }
      } else {
        emit(UserBlocLoaded(state.user));
      }
    });
  }
}
