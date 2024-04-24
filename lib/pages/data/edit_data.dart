import 'package:education/bloc/data/data_bloc.dart';
import 'package:education/models/data/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditData extends StatefulWidget {
  final DataModel? data;
  const EditData({super.key, this.data});

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  late TextEditingController _idController;
  late TextEditingController _nameController;
  late TextEditingController _numberController;
  late TextEditingController _ageController;
  late TextEditingController _addressController;

  @override
  void initState() {
    _idController = TextEditingController(text: widget.data!.id.toString());
    _nameController = TextEditingController(text: widget.data!.name);
    _numberController = TextEditingController(text: widget.data!.number);
    _ageController = TextEditingController(text: widget.data!.age);
    _addressController = TextEditingController(text: widget.data!.address);
    super.initState();
  }

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _numberController.dispose();
    _ageController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EDIT DATA'),
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
        },
        builder: (context, state) {
          if (state is DataLoading) {
            const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ID',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                TextFormField(
                  enabled: false,
                  controller: _idController,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Text(
                  'Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                TextFormField(
                  controller: _nameController,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Text(
                  'Number',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                TextFormField(
                  controller: _numberController,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Text(
                  'Age',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                TextFormField(
                  controller: _ageController,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Text(
                  'Address',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                TextFormField(
                  controller: _addressController,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<DataBloc>().add(
                            DataUpdate(
                              widget.data!.id!,
                              DataModel(
                                id: widget.data!.id,
                                name: _nameController.text,
                                number: _numberController.text,
                                age: _ageController.text,
                                address: _addressController.text,
                              ),
                            ),
                          );
                      Navigator.pop(context);
                    },
                    child: const Text("Simpan"),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
