import 'package:flutter/material.dart';
import "pages/home.dart";
import "pages/choose_location.dart";
import "pages/loader.dart";
import "pages/error.dart";

void main() => runApp(MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const Loader(),
        "/home": (context) => const HomePage(),
        "/location": (context) => const ChooseLocation(),
        "/error": (context) => const Error(),
      },
      debugShowCheckedModeBanner: false,
    ));
