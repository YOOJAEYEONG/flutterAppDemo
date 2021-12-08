// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/src/word_pair.dart';//영단어 관련 오픈 패키지 추가

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          // child: Text('Hello World'),
          child: RandomWords(),
        ),
      ),
    );
  }
}

/*
 * 대부분의 앱 로직과 상태는 여기서 유지됩니다—RandomWords 위젯을 위해 상태를 보관합니다.
 * 이 클래스에 생성된 단어 쌍이 저장됩니다.
 */
class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(wordPair.asCamelCase);
  }
}

//RandomWords 위젯은 상태 클래스를 만드는 것 이외에 별다른 일을 하지 않습니다:
class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}