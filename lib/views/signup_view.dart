
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_details/bloc/signin_bloc.dart';
import 'package:user_details/bloc/signin_events.dart';
import 'package:user_details/bloc/signin_state.dart';
import 'package:user_details/bloc/signup_bloc.dart';
import 'package:user_details/resources/signup_repository.dart';
import 'profile_view.dart';

class signup_view extends StatefulWidget {
  final signup_repository Signup_repository;
  const signup_view({Key? key,  required this.Signup_repository}) :
      assert(Signup_repository!=null),  super(key: key);


  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup_view> {
  late signup_bloc Signup_bloc;
  late signinBloc SigninBloc;
  signup_repository get _Signup_repository=>widget.Signup_repository;

  bool isLoading= false;
  final _contactController = TextEditingController();
  final _passwordController = TextEditingController();
   var _nameController = TextEditingController();

@override
void initState(){
   Signup_bloc=
  BlocProvider.of<signup_bloc>(context);
   Signup_bloc= signup_bloc(
      Signup_repository: _Signup_repository,

  );
  super.initState();

}


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<signinEvent,signinState>
      (bloc: SigninBloc, builder: (
        BuildContext context,
        signinState state,
    )
    {
      if(state is signinFailure) {
        _onWidgetDidBuild(() {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text('${state.error}'),
              backgroundColor: Colors.black,),
          );
        });


        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.amber,
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: Text(" Sign Up ",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,

                    ),),
                ),
                const SizedBox(
                  height: 20,
                ),
                ContactField(),
                const SizedBox(
                  height: 20,
                ),
                PasswordField(),
                const SizedBox(
                  height: 20,
                ),
                NameField(),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(" Log In ? ",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 80,
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, bottom: 20),
                  width: 364,
                  child: ElevatedButton(
                    onPressed: () {
                      state is! signinLoading ? _onLoginButtonPressed : null;
                      setState(() {
                        isLoading = true;
                      });
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) =>
                            profile_view(_nameController.text)),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),

                    child: const Text(" Sign In ",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),

                  ),

                ),
                Container(
                  child:
                  state is signinLoading ? CircularProgressIndicator() : null,
                ),
              ],
            ),
          ),
        );
      };
     
  }
  );

  }
  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      callback();
    });
  }

  Widget ContactField(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(

        decoration: InputDecoration(labelText: 'Phone'),
        controller: _contactController,

      ),
    );
  }
  Widget PasswordField(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        decoration: InputDecoration(labelText: 'Password'),
        controller: _passwordController,
      ),
    );
  }
  Widget NameField(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(

        decoration: InputDecoration(labelText: 'Name'),
        controller: _nameController,

      ),
    );
  }
  void dispose() {
    SigninBloc.dispose();
    super.dispose();
  }
  _onLoginButtonPressed() {
    SigninBloc.dispatch(signinButtonPressed(
      name: _nameController.text,
      password: _passwordController.text,
      phone: _contactController.text,
    ));
  }
}