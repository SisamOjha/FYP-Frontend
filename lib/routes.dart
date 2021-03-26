import 'package:DoctorOnHand/screens/home/home_screen.dart';
import 'package:DoctorOnHand/screens/profile/profile_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:DoctorOnHand/screens/forgot_password/forgot_password_screen.dart';
import 'package:DoctorOnHand/screens/otp/otp_screen.dart';
import 'package:DoctorOnHand/screens/sign_in/sign_in_screen.dart';
import 'package:DoctorOnHand/screens/splash/splash_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'screens/specialist/specialist_screen.dart';


// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  SpecialistScreen.routeName: (context) => SpecialistScreen(),
  
  ProfileScreen.routeName: (context) => ProfileScreen(),
};
