import 'package:flutter/material.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(255, 234, 0, .1),
  100: Color.fromRGBO(255, 234, 0, .2),
  200: Color.fromRGBO(255, 234, 0, .3),
  300: Color.fromRGBO(255, 234, 0, .4),
  400: Color.fromRGBO(255, 234, 0, .5),
  500: Color.fromARGB(142, 237, 211, 120),
  600: Color.fromARGB(176, 255, 200, 0),
  700: Color.fromARGB(204, 233, 166, 42),
  800: Color.fromARGB(228, 217, 164, 20),
  900: Color.fromARGB(222, 255, 201, 7),
};
ThemeData nativeTheme() {
  return ThemeData(
      primaryColor: Color(
          0xFFFF914D), //partner app old primary color: #FA692C ,new updated color #FFEA00 (02-10-2021)
      // primaryColorLight: Color.fromRGBO(255, 166, 146, .6), // Color(0xFFFFA692),
      primaryColorLight: Color.fromARGB(255, 235, 160, 114),
      primaryColorDark: Color(0xFFFF914D),
      primarySwatch: MaterialColor(0xFFFF914D, color),
      primaryIconTheme: IconThemeData(color: Colors.white),
      iconTheme: IconThemeData(color: Color(0xFFFF914D)),
      cardColor: Color(0xFFF8F1F7),
      textTheme: TextTheme(
        labelLarge: TextStyle(color: Colors.black, fontSize: 17),
        displayLarge: TextStyle(fontSize: 15, color: Colors.black),
        displayMedium: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.32), //listtile subtitle white
        displaySmall: TextStyle(
            fontSize: 21,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.5), // intro
        headlineMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black), //service
        headlineSmall: TextStyle(
            fontSize: 13.5,
            color: Colors.white.withOpacity(0.6),
            letterSpacing: 0.32,
            fontWeight: FontWeight.w300), // listtile white title
        titleLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black), //list's title
        titleMedium: TextStyle(
            fontSize: 12.5,
            color: Colors.grey[600],
            fontWeight: FontWeight.w400), // textform label, listtile title
        titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black.withOpacity(0.6)), //listtile subtitle
        labelSmall: TextStyle(
            fontSize: 31,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.7)),
        bodySmall: TextStyle(
            color: Colors.black54,
            fontSize: 17,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.32), // drawer

        bodyLarge: TextStyle(
            color: Colors.black, fontSize: 10, fontWeight: FontWeight.w400),
        bodyMedium: TextStyle(
            color: Colors.black45, fontSize: 10, fontWeight: FontWeight.w400),
      ),
      primaryTextTheme: TextTheme(
        labelLarge: TextStyle(color: Colors.black, fontSize: 17),
        displayLarge: TextStyle(fontSize: 15, color: Color(0xFFFF914D)),
        displayMedium: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.32), //listtile subtitle white
        displaySmall: TextStyle(
            fontSize: 21,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.5), // intro
        headlineMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black), //service
        headlineSmall: TextStyle(
            fontSize: 13.5,
            color: Colors.white.withOpacity(0.6),
            letterSpacing: 0.32,
            fontWeight: FontWeight.w300), // listtile white title
        titleLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black), //list's title
        titleMedium: TextStyle(
            fontSize: 12.5,
            color: Colors.grey[600],
            fontWeight: FontWeight.w400), // textform label, listtile title
        titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black.withOpacity(0.6)), //listtile subtitle
        labelSmall: TextStyle(
            fontSize: 31,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.7)),
        bodySmall: TextStyle(
            color: Colors.black54,
            fontSize: 17,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.32), // drawer

        bodyLarge: TextStyle(
            color: Colors.black, fontSize: 10, fontWeight: FontWeight.w400),
        bodyMedium: TextStyle(
            color: Colors.black45, fontSize: 10, fontWeight: FontWeight.w400),
      ),
      scaffoldBackgroundColor: Colors.white,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xFFFF914D),
      ),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        padding:
            MaterialStateProperty.all(EdgeInsets.only(top: 10, bottom: 10)),
        backgroundColor: MaterialStateProperty.all(Color(0xFFFF914D)),
        shadowColor: MaterialStateProperty.all(Colors.white),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        )),
        textStyle: MaterialStateProperty.all(TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600)),
      )),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
        side: MaterialStateProperty.all(
            BorderSide(color: Color(0xFFFF914D), width: 1.5)),
        textStyle: MaterialStateProperty.all(TextStyle(
            fontSize: 16,
            color: Color(0xFFFF914D),
            fontWeight: FontWeight.w400)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        )),
      )),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.grey[100],
        titleTextStyle:
            TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFF914D)),
      ),
      //elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(elevation: 0.5)),
      fontFamily: 'Poppins',
      dividerColor: Colors.grey[300],
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        height: 50,
        buttonColor: Color(0xFFFF914D),
        focusColor: Color(0xFFFF914D),
        highlightColor: Color(0xFFFF914D),
        hoverColor: Color(0xFFFF914D),
        splashColor: Color(0xFFFF914D),
        disabledColor: Colors.grey,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.all(new Radius.circular(10.0))),
      ),
      cardTheme: CardTheme(
        elevation: 0.5,
        margin: EdgeInsets.all(0),
        color: Colors.grey[100],
        shadowColor: Colors.grey[200],
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.grey[400],
          // color: Color(0xFF707173),
          fontWeight: FontWeight.w400,
        ),
        counterStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(width: 0.2, color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Color(0xFF898A8D).withOpacity(0.2)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFF914D)),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        filled: true,
        fillColor: Colors.white,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      appBarTheme: AppBarTheme(
        color: Colors.grey[100],
        elevation: 0,
        actionsIconTheme: IconThemeData(color: Color(0xFFFF914D), size: 30),
        iconTheme: IconThemeData(color: Color(0xFFFF914D), size: 24),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.only(top: 15, bottom: 15),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shadowColor: MaterialStateProperty.all(Colors.white),
            overlayColor: MaterialStateProperty.all(Colors.white),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            textStyle: MaterialStateProperty.all(TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
                fontWeight: FontWeight.w600))),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(Colors.white),
        fillColor: MaterialStateProperty.all(Color(0xFFFF914D)),
      ));
}
