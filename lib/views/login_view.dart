import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_details/bloc/login_bloc.dart';
import 'package:user_details/bloc/login_events.dart';
import 'package:user_details/bloc/login_state.dart';
import 'package:user_details/bloc/signin_state.dart';
import 'package:user_details/bloc/signup_bloc.dart';
import 'package:user_details/resources/login_repository.dart';
import 'profile_view.dart';
import 'package:flutter/material.dart';
import 'signup_view.dart';


class login_page extends StatefulWidget {
  final login_repository? Login_repository;
  const login_page({Key? key,   this.Login_repository}) :
        assert(Login_repository!=null),  super(key: key);


  @override
  _login_pageState createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  late signup_bloc Signup_bloc;
  late LoginBloc loginBloc;
  login_repository get Login_repository=>widget.Login_repository!;
  final _contactController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLoading= false;

  @override
  void initState(){
    Signup_bloc=
        BlocProvider.of<signup_bloc>(context);
    Signup_bloc= signup_bloc(
      login_repository: Login_repository,

    );
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    final formKey= GlobalKey<FormState>();
    return BlocBuilder<LoginBloc,login_state>
    ( builder: (
    BuildContext context,
    login_state state,
    )
    {
      if (state is signinFailure) {
        _onWidgetDidBuild(() {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text('Wrong Inputs}'),
              backgroundColor: Colors.black,),
          );
        });
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.amber,
          body: Form(
            key: formKey,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(" Log In ",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,

                      ),),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ContactField(),
                  SizedBox(
                    height: 20,
                  ),
                  PasswordField(),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(


                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => signup_view())
                      );
                    },
                    child: Text("Sign Up?",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 80,
                    padding: EdgeInsets.only(left: 25, right: 25, bottom: 20),
                    width: 364,
                    child: ElevatedButton(
                      onPressed: () {
                        state is! LoginLoading ? _onLoginButtonPressed : null;
                        isLoading = true;
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => profile_view())
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),

                      child: Text(" Log In ",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),

                    ),
                  ),
                ],
              ),
            ),
          ),

        );


    }
      return loading();});
  }
      void _onWidgetDidBuild(Function callback) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          callback();
        });
      }
      Widget loading(){
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
  Widget ContactField(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(

        decoration: InputDecoration(labelText: 'Phone'),
        controller: _contactController,
        validator: (value)=>null,
      ),
    );

  }
  Widget PasswordField(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        decoration: InputDecoration(labelText: 'Password'),
        controller: _passwordController,
        validator: (value)=>null,
      ),
    );
  }
  _onLoginButtonPressed() {
    loginBloc.add(LoginButtonPressed(
        phone: _contactController.text,
        password: _passwordController.text,
    ));
  }

}