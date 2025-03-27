import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class NintendoGameAddPage extends StatefulWidget {
  const NintendoGameAddPage({super.key});

  @override
  State<NintendoGameAddPage> createState() => _NintendoGameAddPageState();
}

class _NintendoGameAddPageState extends State<NintendoGameAddPage> {
  late final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Nintendo game")),
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: _textController,
                keyboardType: TextInputType.text,
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: "game name",
                  hintText: "Mario World",
                ),
              ),
            ),
          ),
          IconButton(
            key: const Key("nintendo_add_searchpage_search_iconButton"),
            onPressed: () {
              if (_textController.text.isEmpty) {
                return;
              }
              Beamer.of(context).beamToNamed(
                "/nintendo/search",
                data: {"name": _textController.text},
              );
            },
            icon: const Icon(Icons.search, semanticLabel: "submit"),
          ),
        ],
      ),
    );
  }
}
