part of 'data_bloc.dart';

abstract class DataState extends Equatable {
  final List<DataModel> data;
  const DataState(this.data);

  @override
  List<Object> get props => [data];
}

class DataInitial extends DataState {
  const DataInitial(super.data);
}

class DataLoading extends DataState {
  const DataLoading(super.data);
}

class DataLoaded extends DataState {
  const DataLoaded(super.data);
}

class DataFailed extends DataState {
  final String e;
  const DataFailed(super.data, this.e);
}
