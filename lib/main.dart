// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';//영단어 관련 오픈 패키지 추가

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}

/*
 * 대부분의 앱 로직과 상태는 여기서 유지됩니다—RandomWords 위젯을 위해 상태를 보관합니다.
 * 이 클래스에 생성된 단어 쌍이 저장됩니다.
 * 제안된 단어 쌍을 저장하기 위해 RandomWordsState 클래스에 _suggestions 목록을 추가하세요.
 * 또한, 글자 크기를 키우기 위해 _biggerFont 변수를 추가하세요.
 * Dart 언어에서는 식별자 앞에 밑줄을 붙이면 프라이빗 적용이 됩니다.
 */
class RandomWordsState extends State<RandomWords> {

  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  /// @see https://flutter-ko.dev/docs/get-started/codelab
  /// 함수는 단어 쌍 마다 한 번 씩 _buildRow()를 호출합니다.
  /// 이 함수는 ListTile 에서 각각 새로운 쌍을 표시하여 다음 단계에서 행을 더 매력적으로 만들 수 있게 합니다.
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }
  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}

//RandomWords 위젯은 상태 클래스를 만드는 것 이외에 별다른 일을 하지 않습니다:
class RandomWords extends StatefulWidget {

  @override
  RandomWordsState createState() => RandomWordsState();
}