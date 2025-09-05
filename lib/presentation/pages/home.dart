import 'package:flutter/material.dart';
import 'package:meme_app_flutter/presentation/providers/api_provider.dart';
import 'package:meme_app_flutter/utils/widgets/my_card.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Provider.of<ApiProvider>(context, listen: false).fetchMeme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Memes for you",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),

        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ApiProvider>(context, listen: false).reset();
              Provider.of<ApiProvider>(context, listen: false).fetchMeme();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),

      body: Consumer<ApiProvider>(
        builder: (context, value, child) => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.memes!.length,
                itemBuilder: (context, index) {
                  var unitMeme = value.memes![index];
                  return MyCard(url: unitMeme.url!);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
