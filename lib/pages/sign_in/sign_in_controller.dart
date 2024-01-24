import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/sign_in/bloc/signin_bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == 'email') {
        final state = BlocProvider.of<SignInBloc>(context).state;
        String emailAddress = state.email;
        String password = state.password;
        if(emailAddress.isEmpty){

        }

        if(password.isEmpty){

        }

        try {
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailAddress, password: password);
          if(credential.user == null){
            //
          }

          if(!credential.user!.emailVerified){

          }

          var user = credential.user;

        } catch(e){}
      }
    } catch (e) {}
  }
}
