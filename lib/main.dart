import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: context.darkTheme,
      title: 'Flutter Extensions',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: context.height * 0.05,
              ),
              Container(padding: context.paddingLow, child: nameField),
              SizedBox(
                height: context.height * 0.05,
              ),
              Container(padding: context.paddingNormal, child: emailField),
              SizedBox(
                height: context.height * 0.05,
              ),
              Container(padding: context.paddingLarge, child: nameField),
              SizedBox(
                height: context.height * 0.002,
              ),
              Container(padding: context.paddingLarger, child: emailField),
            ],
          ),
        ),
      ),
    );
  }
}

extension StringOperation on String {
  String? get isValidName =>
      contains(RegExp(r'[A-Z]')) ? null : 'Name is invalid';
  String? get isValidEmail =>
      contains(RegExp(r'[A-Z]')) ? null : 'Email is invalid';
}

extension _FormArea on _MyHomePageState {
  TextFormField get nameField => TextFormField(
        validator: (value) => value!.isValidName,
        decoration: customInputDecoration(),
      );
  TextFormField get emailField => TextFormField(
        validator: (value) => value!.isValidEmail,
        decoration: customInputDecoration(),
      );
}

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ThemeData get darkTheme => ThemeData.dark();
  ThemeData get lightTheme => ThemeData.light();
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(height * 0.01);
  EdgeInsets get paddingNormal => EdgeInsets.all(height * 0.02);
  EdgeInsets get paddingLarge => EdgeInsets.all(height * 0.04);
  EdgeInsets get paddingLarger => EdgeInsets.all(height * 0.08);
}

InputDecoration customInputDecoration() {
  return const InputDecoration(
    hintStyle: TextStyle(
      color: Colors.grey,
      fontSize: 17,
      fontWeight: FontWeight.w800,
    ),
    hintText: 'input something',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
  );
}
