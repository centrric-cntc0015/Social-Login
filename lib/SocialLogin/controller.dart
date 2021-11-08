import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'model.dart';

class Controller extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await Firebase.initializeApp();
  }

  RxBool googleSignin = false.obs;
  RxBool facebookSignin = false.obs;
  GoogleSignUpRequestModel googleSignUpdata = GoogleSignUpRequestModel();
  FacbookSignUpRequestModel facebookSignUpdata = FacbookSignUpRequestModel();

  //  Google signin
  Future<GoogleSignUpRequestModel> signInWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    late GoogleSignInAuthentication? googleAuth;
    late OAuthCredential credential;
    await _googleSignIn.signIn().then((googleUser) async {
      googleSignin.value = true;
      googleAuth = await googleUser?.authentication;
      print(googleAuth?.accessToken);
      credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
    }).onError((error, stackTrace) {
      googleSignin.value = false;
      print('Google Sign in error');
    });

    await FirebaseAuth.instance.signInWithCredential(credential);
    User? user = FirebaseAuth.instance.currentUser;
    googleSignUpdata = GoogleSignUpRequestModel(
        userName: user?.displayName,
        authKey: user?.uid,
        email: user?.email,
        country: 'India',
        platform: 'google');
    update();
    return googleSignUpdata;
  }

//     print('<=========================================>');
//     print('--- signInWithFacebook ---');
//     print('<=========================================>');

  Future<FacbookSignUpRequestModel> signInWithFacebook() async {
    late OAuthCredential credential;
    await FacebookAuth.instance.login().then((facebookUser) async {
      facebookSignin.value = true;
      print(facebookUser.accessToken);
      credential = FacebookAuthProvider.credential(
          facebookUser.accessToken?.token ?? '');
    }).onError((error, stackTrace) {
      facebookSignin.value = false;
      print('Facebook Sign in error');
    });

    await FirebaseAuth.instance.signInWithCredential(credential);
    User? user = FirebaseAuth.instance.currentUser;
    facebookSignUpdata = FacbookSignUpRequestModel(
        userName: user?.displayName,
        authKey: user?.uid,
        email: user?.email,
        country: 'India',
        platform: 'google');
    update();
    return facebookSignUpdata;
  }

  Future<void> logOutGoogle() async {
    googleSignin.value = false;
    GoogleSignIn _googleSignIn = GoogleSignIn();
    await _googleSignIn.signIn().then((googleUser) async {
      googleSignUpdata = GoogleSignUpRequestModel();
      _googleSignIn.signOut();
    }).onError((error, stackTrace) {
      print('Google Logout in error');
    });
    FirebaseAuth.instance.currentUser?.delete();
    update();
  }

  Future<void> logOutFacbook() async {
    facebookSignin.value = false;

    await FacebookAuth.instance.logOut().then((googleUser) async {
      facebookSignUpdata = FacbookSignUpRequestModel();
    }).onError((error, stackTrace) {
      print('Facbook Logout error');
    });
    FirebaseAuth.instance.currentUser?.delete();
    update();
  }

// String generateNonce([int length = 32]) {
//   final charset =
//       '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
//   final random = Random.secure();
//   return List.generate(length, (_) => charset[random.nextInt(charset.length)])
//       .join();
// }

// /// Returns the sha256 hash of [input] in hex notation.
// String sha256ofString(String input) {
//   final bytes = utf8.encode(input);
//   final digest = sha256.convert(bytes);
//   return digest.toString();
// }

//     print('<=========================================>');
//     print('---signInWithApple---');
//     print('<=========================================>');

// Future<UserCredential> signInWithApple() async {
//   // To prevent replay attacks with the credential returned from Apple, we
//   // include a nonce in the credential request. When signing in with
//   // Firebase, the nonce in the id token returned by Apple, is expected to
//   // match the sha256 hash of `rawNonce`.
//   final rawNonce = generateNonce();
//   final nonce = sha256ofString(rawNonce);

//   // Request credential for the currently signed in Apple account.
//   final appleCredential = await SignInWithApple.getAppleIDCredential(
//     scopes: [
//       AppleIDAuthorizationScopes.email,
//       AppleIDAuthorizationScopes.fullName,
//     ],
//     nonce: nonce,
//   );

//   // Create an `OAuthCredential` from the credential returned by Apple.
//   final oauthCredential = OAuthProvider("apple.com").credential(
//     idToken: appleCredential.identityToken,
//     rawNonce: rawNonce,
//   );

//   // Sign in the user with Firebase. If the nonce we generated earlier does
//   // not match the nonce in `appleCredential.identityToken`, sign in will fail.
//   return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
// }

}
