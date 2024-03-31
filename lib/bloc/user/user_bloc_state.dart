part of 'user_bloc_bloc.dart';

abstract class UserBlocState extends Equatable {
  final List<UserModel> user;
  const UserBlocState(this.user);

  @override
  List<Object> get props => [user];
}

class UserBlocInitial extends UserBlocState {
  const UserBlocInitial(super.user);
}

class UserBlocLoading extends UserBlocState {
  const UserBlocLoading(super.user);
}

class UserBlocLoaded extends UserBlocState {
  const UserBlocLoaded(super.user);
}

class UserBlocFailed extends UserBlocState {
  final String e;
  const UserBlocFailed(super.user, this.e);

  @override
  List<Object> get props => [user, e];
}
