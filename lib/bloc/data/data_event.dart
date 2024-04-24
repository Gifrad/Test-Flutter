part of 'data_bloc.dart';

abstract class DataEvent extends Equatable {
  const DataEvent();

  @override
  List<Object> get props => [];
}

class DataSave extends DataEvent {
  final DataModel data;
  const DataSave(this.data);

  @override
  List<Object> get props => [data];
}

class DataFetch extends DataEvent {}

class DataUpdate extends DataEvent {
  final int id;
  final DataModel data;
  const DataUpdate(this.id, this.data);

  @override
  List<Object> get props => [id, data];
}

class DataDelete extends DataEvent {
  final int index;
  const DataDelete(this.index);

  @override
  List<Object> get props => [index];
}
