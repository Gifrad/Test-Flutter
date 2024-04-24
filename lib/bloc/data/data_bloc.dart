import 'package:education/database/db_helper.dart';
import 'package:education/models/data/data_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial(List.empty())) {
    on<DataEvent>((event, emit) async {
      if (event is DataFetch) {
        try {
          DbHelper db = DbHelper();
          emit(DataLoading(state.data));
          List<DataModel> data = await db.getAllData();
          emit(DataLoaded(data));
        } catch (e) {
          emit(DataFailed(state.data, e.toString()));
        }
      }
      if (event is DataSave) {
        try {
          DbHelper db = DbHelper();
          emit(DataLoading(state.data));
          await db.saveData(event.data);
          emit(DataLoaded(state.data));
        } catch (e) {
          emit(DataFailed(state.data, e.toString()));
        }
      }

      if (event is DataUpdate) {
        try {
          DbHelper db = DbHelper();
          emit(DataLoading(state.data));
          await db.updateData(event.data, event.id);
          emit(DataLoaded(state.data));
        } catch (e) {
          emit(DataFailed(state.data, e.toString()));
        }
      }

      if (event is DataDelete) {
        try {
          DbHelper db = DbHelper();
          emit(DataLoading(state.data));
          await db.deleteData(event.index);
          emit(DataLoaded(state.data));
        } catch (e) {
          emit(DataFailed(state.data, e.toString()));
        }
      }
    });
  }
}
