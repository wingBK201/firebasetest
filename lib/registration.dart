import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Registration extends StatelessWidget {
  String? mailAddless;
  String? password;
  String? checkPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新規登録'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustumTextField(
            label: 'メールアドレス',
            isPassword: false,
            onChengedFunc: (newText) {
              mailAddless = newText;
            },
          ),
          CustumTextField(
            label: 'パスワード',
            isPassword: true,
            onChengedFunc: (newText) {
              password = newText;
            },
          ),
          CustumTextField(
            label: '確認',
            isPassword: true,
            onChengedFunc: (newText) {
              checkPassword = newText;
            },
          ),
          ElevatedButton(
              onPressed: () async {
                if (password != checkPassword) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return ErrorDialog(content: 'パスワードを正しく入力してください');
                      });
                } else if (password != null && checkPassword != null) {
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: mailAddless!, password: checkPassword!);
                    final User user = userCredential.user!;
                    FirebaseFirestore.instance
                        .collection(user.uid)
                        .doc('0')
                        .set({
                      'item': 'ToDoを始めてみよう',
                      'done': false,
                    });
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return ErrorDialog(content: 'パスワードが短すぎます');
                          });
                    } else if (e.code == 'email-already-in-use') {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return ErrorDialog(
                                content: '入力されたメールアドレスはすでに登録されています');
                          });
                    }
                  } catch (e) {
                    print(e);
                  }
                } else {}
              },
              child: Container(
                width: 200,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  '新規登録',
                  textAlign: TextAlign.center,
                ),
              ))
        ],
      ),
    );
  }
}

class ErrorDialog extends StatelessWidget {
  String content;
  ErrorDialog({required this.content, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Error'),
      content: Text(content),
      actions: [
        TextButton(
            onPressed: () {
              print('ErrorDialog');
              Navigator.of(context).pop();
            },
            child: Text('OK')),
      ],
    );
  }
}
