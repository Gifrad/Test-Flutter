import 'package:education/bloc/user/user_bloc_bloc.dart';
import 'package:education/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUserPage extends StatefulWidget {
  const ContactUserPage({super.key});

  @override
  State<ContactUserPage> createState() => _ContactUserPageState();
}

class _ContactUserPageState extends State<ContactUserPage> {
  late TextEditingController _nameController;
  late TextEditingController _numberController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _numberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Contact User'),
        centerTitle: true,
      ),
      body: BlocConsumer<UserBlocBloc, UserBlocState>(
        listener: (context, state) {
          if (state is UserBlocFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.e),
              backgroundColor: Colors.red,
            ));
          }
          if (state is UserBlocLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Success'),
              backgroundColor: Colors.blue,
            ));
          }
        },
        builder: (context, state) {
          print(state);
          if (state.user.isEmpty) {
            return const Center(
              child: Text('Belum Ada Data'),
            );
          }
          if (state is UserBlocLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: state.user.map((e) {
              int index = state.user.indexOf(e);
              return ListTile(
                title: Text(e.name),
                subtitle: Text(e.number),
                leading: IconButton(
                    onPressed: () {
                      updateDialog(index, context);
                    },
                    icon: Icon(Icons.edit)),
                trailing: IconButton(
                  onPressed: () {
                    print(state);
                    context.read<UserBlocBloc>().add(RemoveUser(index));
                  },
                  icon: const Icon(Icons.delete),
                ),
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
          onPressed: () {
            addDialog(context);
          },
          child: const Icon(
            Icons.add,
          )),
    );
  }

  void addDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Nama'),
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
                const Text('Number'),
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
                  height: 16,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<UserBlocBloc>().add(AddUser(UserModel(
                          name: _nameController.text,
                          number: _numberController.text)));
                      Navigator.pop(context);
                    },
                    child: const Text('Save'),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void updateDialog(int index, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Nama'),
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
                const Text('Number'),
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
                  height: 16,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<UserBlocBloc>().add(UpdateUser(
                          index,
                          UserModel(
                              name: _nameController.text,
                              number: _numberController.text)));
                      Navigator.pop(context);
                    },
                    child: const Text('Edit'),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
