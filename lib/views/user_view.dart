import 'profile_view.dart';
import 'package:flutter/material.dart';

class profile_details extends StatefulWidget {
  const profile_details({Key? key}) : super(key: key);

  @override
  _profile_detailsState createState() => _profile_detailsState();
}

class _profile_detailsState extends State<profile_details> {
  final _EmailController = TextEditingController();
  final _PhoneController = TextEditingController();
  final _AddressController = TextEditingController();
  final _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.amber,
        body: Padding(
          padding: const EdgeInsets.all(25.0),

          child: Container(
              color: Colors.white,
              child: Column(

                children: [
                  NameField(),
                  const SizedBox(
                    height: 10,
                  ),
                  EmailField(),
                  const SizedBox(
                    height: 10,
                  ),
                  PhoneField(),
                  const SizedBox(
                    height: 10,
                  ),
                  AddressField(),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 80,
                    padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                    width: 244,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {

                        });
                        Navigator.of(context) .pop();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),

                      child: const Text("Add User",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),

                    ),
                  ),
                ],
              )

          ),
        ),
      ),
    );
  }
  Widget NameField() {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: TextFormField(

        decoration: const InputDecoration(labelText: 'Name',
            labelStyle: TextStyle(color: Colors.amber)),
        controller: _nameController,

      ),
    );
  }
  Widget EmailField() {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: TextFormField(

        decoration: const InputDecoration(labelText: 'Email',
            labelStyle: TextStyle(color: Colors.amber)),
        controller: _EmailController,

      ),
    );
  }
  Widget PhoneField() {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: TextFormField(

        decoration: const InputDecoration(labelText: 'Phone' ,
            labelStyle: TextStyle(color: Colors.amber)),
        controller: _PhoneController,

      ),
    );
  }
  Widget AddressField() {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: TextFormField(

        decoration: const InputDecoration(labelText: 'Address',
            labelStyle: TextStyle(color: Colors.amber)),
        controller: _AddressController,

      ),
    );
  }
}
