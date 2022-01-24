
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_details/bloc/signup_bloc.dart';
import 'package:user_details/bloc/signup_event.dart';

import 'signup_view.dart';
import 'package:flutter/material.dart';

class profile_view extends StatefulWidget {
  var name;

   profile_view(this.name, {Key? key}) : super(key: key);

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile_view> {
  @override
  Widget build(BuildContext context) {
    final signup_bloc Signup_bloc=
        BlocProvider.of<signup_bloc>(context);
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.amber,

        title:  Text("${widget.name}",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {

            },
            icon: const Icon(Icons.person_add_rounded,
              color: Colors.white,),
          ),
          FlatButton(
            onPressed: () {

              Signup_bloc.dispatch(LoggedOut());
            },
            child: const Text("Log Out", style: TextStyle(color: Colors.white),),
          ),],
      ),
      body: Container(
        color: Colors.white,
        child: ListTile(

          leading: Icon(
            Icons.person, color: Colors.amberAccent,),
          title: Text("User1",style: TextStyle(
            fontSize: 20,
            color: Colors.amberAccent,
            fontWeight: FontWeight.bold,
          ), ),
          trailing: Icon(
            Icons.edit, color: Colors.amberAccent,),




        ),


      ),
    );
  }
}
