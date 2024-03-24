import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerPackage/providers.dart';

class AnotherScreen extends StatefulWidget {
  const AnotherScreen({super.key});

  @override
  State<AnotherScreen> createState() => _AnotherScreenState();
}

class _AnotherScreenState extends State<AnotherScreen> {
  @override
  Widget build(BuildContext context) {
    var movies = context
        .watch<MovieProviders>()
        .favlist;
    return Scaffold(
      appBar: AppBar(
        title: Text("favourite movies"),
      ),
      body: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Movie ${movies[index]}'
              ),
              trailing: TextButton(onPressed: () {
                context.read<MovieProviders>().removeFav(movies[index]);
              },
                  child: Text('Remove', style: TextStyle(color: Colors.red),)),
            );
          }
      ),
    );
  }
}
