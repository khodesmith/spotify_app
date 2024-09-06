import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_app/data/models/auth/create_user_req.dart';
import 'package:spotify_app/data/models/auth/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createUserReq);

  Future<Either> signin(SigninUserReq signinUserReq);
}

class AuthFirebaseServiceImplementation extends AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserReq.email,
        password: signinUserReq.password,
      );

      return const Right('Sign In was successful');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'invalid-email') {
        message = 'No user found for this email';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password for this User';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);

      return const Right('Sign Up was successful');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = 'The Password is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exist with this email';
      }
      return Left(message);
    }
  }
}

// class GoogleServiceImplementation extends AuthFirebaseService {
//   @override
//   Future<void> signin() {
//     // TODO: implement signin
//     throw UnimplementedError();
//   }

//   @override
//   Future<Either> signup(CreateUserReq createUserReq) async {
//     try {
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: createUserReq.email, password: createUserReq.password);
//     } on FirebaseAuthException catch (e) {}
//   }
// }
