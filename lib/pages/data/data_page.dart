import 'package:education/bloc/data/data_bloc.dart';
import 'package:education/pages/data/add_data.dart';
import 'package:education/pages/data/edit_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  void initState() {
    context.read<DataBloc>().add(DataFetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DATA"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: BlocConsumer<DataBloc, DataState>(
        listener: (context, state) {
          if (state is DataFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.e),
                backgroundColor: Colors.red,
              ),
            );
          }
          if (state is DataLoaded) {
            context.read<DataBloc>().add(DataFetch());
          }
        },
        builder: (context, state) {
          return state.data.isNotEmpty
              ? ListView(
                  children: state.data
                      .map(
                        (e) => ListTile(
                          leading: CircleAvatar(child: Text(e.id.toString())),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(e.name.toString()),
                              Text(e.age.toString()),
                              Text(e.number.toString()),
                              Text(e.address.toString()),
                            ],
                          ),
                          trailing: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditData(
                                        data: e,
                                      ),
                                    ),
                                  );
                                },
                                child: const Icon(
                                  Icons.edit,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              InkWell(
                                onTap: () {
                                  context
                                      .read<DataBloc>()
                                      .add(DataDelete(e.id!.toInt()));
                                },
                                child: const Icon(
                                  Icons.delete,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList())
              : const Center(
                  child: Text('Data Tidak Ada'),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddData(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
