import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebasetest/firebase_options.dart';
import 'package:flutter/material.dart';

import 'registration.dart';
import 'todo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  String? mailAddress;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDoアプリ'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Todoアプリ', style: TextStyle(fontSize: 50)),
          Text('ログインしてください。'),
          CustumTextField(
            label: 'メールアドレス',
            isPassword: false,
            onChengedFunc: (newText) {
              mailAddress = newText;
            },
          ),
          CustumTextField(
            label: 'パスワード',
            isPassword: true,
            onChengedFunc: (newText) {
              password = newText;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('新規登録は'),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Registration()));
                  },
                  child: Text('こちら'))
            ],
          ),
          ElevatedButton(
              onPressed: () async {
                try {
                  UserCredential userCredential = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: mailAddress!, password: password!);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ToDo(user: userCredential.user!)));
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return ErrorDialog(content: 'ユーザーが存在しません');
                        });
                  } else if (e.code == 'wrong-password') {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return ErrorDialog(content: 'パスワードが違います');
                        });
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: Container(
                width: 200,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  'ログイン',
                  textAlign: TextAlign.center,
                ),
              ))
        ],
      ),
    );
  }
}

class CustumTextField extends StatelessWidget {
  String label;
  void Function(String) onChengedFunc;
  bool isPassword;

  CustumTextField(
      {required this.label,
      required this.onChengedFunc,
      required this.isPassword,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        obscureText: isPassword,
        onChanged: (newText) {
          onChengedFunc(newText);
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            label: Text(label)),
      ),
    );
  }
}
