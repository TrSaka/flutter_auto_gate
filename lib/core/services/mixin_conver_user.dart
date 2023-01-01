import 'package:firebase_auth/firebase_auth.dart';
import '../../models/user_model.dart';

mixin ConvertUser {
  Users convertUser(UserCredential user) {
    return Users(id: user.user!.uid, email: user.user!.email!);
  }
}
