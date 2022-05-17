import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:catapp/providers/image_provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => CatImage())
    ], child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cat App'),
        ),
        body: Center(
          child: InkWell(
            onTap: () => context.read<CatImage>().getURL(),
            child: Image(image: NetworkImage(context.watch<CatImage>().url)),
            
          ),
        )
        ),
    );
  }
}
