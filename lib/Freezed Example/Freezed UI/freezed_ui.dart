
import 'package:bloc_tutorials/Freezed%20Example/Person%20Json%20Model/person_model.dart';
import 'package:flutter/material.dart';

class FreezedScreen extends StatefulWidget {
  const FreezedScreen({super.key});

  @override
  State<FreezedScreen> createState() => _FreezedScreenState();
}

class _FreezedScreenState extends State<FreezedScreen> {

  List<PersonModel> personList = [
    PersonModel(name: 'Talha'),
    PersonModel(name: 'Mehtab'),
    PersonModel(name: 'Saad'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var data = [
      {
        'name': null,
      },
      {
        'name': 'Zain'
      }
    ];
    personList.add(PersonModel.fromJson(data[0]));
    personList.add(PersonModel.fromJson(data[1]));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: personList.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text(personList[index].name!),
                    );
                  }),
            ),
          ],
        )
      ),
    );
  }
}
