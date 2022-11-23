import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contest_hub/model/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authprovider = Provider((ref) => AuthProvider());

final streamprovider = StreamProvider((ref) => AuthProvider().getPostStream());

class AuthProvider {
  Future<String> userlogin(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return "Successful";
    } on AsyncLoading {
      return "Loading..";
    } on FirebaseAuthException catch (error) {
      return "$error";
    }
  }

  Future<String> userSignup(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return "Successful";
    } on FirebaseAuthException catch (error) {
      return "$error";
    }
  }

  Stream<List<UserModel>> getPostStream() {
    final userdb = FirebaseFirestore.instance.collection('Photo');
    return userdb.snapshots().map((event) => getPostData(event));
  }

  List<UserModel> getPostData(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      final json = e.data() as Map<String, dynamic>;
      return UserModel(
          category: json['Category'],
          aboutOrganizer: json['Organizer'],
          deadline: json['Deadline'],
          description: json['Description'],
          title: json['Title'],
          featurephoto: json['Feature Photo']);
    }).toList();
  }
}
