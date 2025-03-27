import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class GameAddPage extends StatefulWidget {
  const GameAddPage({super.key});

  @override
  State<GameAddPage> createState() => _GameAddPageState();
}

class _GameAddPageState extends State<GameAddPage> {
  late final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add steam game")),
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: _textController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "steam gameId",
                  hintText: "2200780",
                ),
              ),
            ),
          ),
          IconButton(
            key: const Key("steamstore_add_searchpage_search_iconButton"),
            onPressed: () {
              Beamer.of(
                context,
              ).beamToNamed("/steamstore/game/${_textController.text}");
            },
            icon: const Icon(Icons.search, semanticLabel: "submit"),
          ),
        ],
      ),
    );
  }
}
