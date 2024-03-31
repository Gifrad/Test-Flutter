part of 'user_bloc_bloc.dart';

abstract class UserBlocEvent extends Equatable {
  const UserBlocEvent();

  @override
  List<Object> get props => [];
}

class AddUser extends UserBlocEvent {
  final UserModel user;
  const AddUser(this.user);

  @override
  List<Object> get props => [user];
}

class RemoveUser extends UserBlocEvent {
  final int index;
  const RemoveUser(this.index);

  @override
  List<Object> get props => [index];
}

class UpdateUser extends UserBlocEvent {
  final int index;
  final UserModel user;
  const UpdateUser(this.index, this.user);

  @override
  List<Object> get props => [index, user];
}

class FailedUser extends UserBlocEvent {}
