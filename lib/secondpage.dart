import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'data.dart' as MyAppx;

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(210.0),
          child: AppBar(
            // title: Center(child: Text("Second Route")),
            automaticallyImplyLeading: true,
            flexibleSpace: Image(
              image: AssetImage('images/data.png'),
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            backgroundColor: Colors.transparent,
          )),
      body: RandomWords(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios),
        onPressed: () {
           Navigator.pop(context);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => MyAppx.MyAppx()),
          // );
        },
      ),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildSuggestions(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}
