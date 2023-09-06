import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:httprequest/Model/listcrew_model.dart';
import 'package:httprequest/provider/listcrew_provider.dart';
import 'package:provider/provider.dart';

class ListCrew extends StatefulWidget {
  const ListCrew({super.key});

  @override
  State<ListCrew> createState() => _ListCrewState();
}

class _ListCrewState extends State<ListCrew> {
  @override
  void initState() {
    context.read<ListCrewProvider>().get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("test")),
        body: Consumer<ListCrewProvider>(builder: (context, data, _) {
          return ListView.builder(
            itemCount: data.list.length,
            itemBuilder: (BuildContext context, int index) {
              return _listcrew(data.list[index]);
            },
          );
        }),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => context.go('/add'),
        ),
    );
  }

  Widget _listcrew(ListCrewModel model) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(model.avatar)),
      title: Text("${model.firstName} ${model.lastName}"),
      subtitle: Text(model.email),
    );
  }
}
