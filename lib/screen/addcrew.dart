import 'package:flutter/material.dart';
import 'package:httprequest/provider/crew_provider.dart';
import 'package:provider/provider.dart';

class AddCrew extends StatelessWidget {
  const AddCrew({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final appBar = AppBar(
      leading: const Icon(Icons.arrow_back_rounded),
      title: const Text("Add Crew"),
    );
    final bodyMediaQuery = mediaQueryHeight - appBar.preferredSize.height;

    TextEditingController nameController = TextEditingController();
    TextEditingController jobController = TextEditingController();


    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                ),
              ),
              TextFormField(
                controller: jobController,
                decoration: const InputDecoration(
                  labelText: "Job",
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                  onPressed: (){
                    context.read<CrewProvider>().post(nameController.text, jobController.text);
                  },
                  child: const Text("Add Crew")
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Consumer<CrewProvider>(
                  builder: (context, data, _) {
                    return Column(
                      children: [
                        Text(data.crewModel.name),
                        Text(data.crewModel.job)
                      ],
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
