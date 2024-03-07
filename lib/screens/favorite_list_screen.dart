import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favorite_provider.dart';

class FavoriteListScreen extends StatefulWidget {
  const FavoriteListScreen({super.key});

  @override
  State<FavoriteListScreen> createState() => _FavoriteListScreenState();
}

class _FavoriteListScreenState extends State<FavoriteListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favrite Items'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FavoriteListScreen()));
              },
              icon: const Icon(Icons.favorite))
        ],
      ),
      body: Consumer<FavoriteProvider>(
        builder: (BuildContext context, FavoriteProvider value, Widget? child) {
          return ListView.builder(
              itemCount: value.favoriteItem.length,
              itemBuilder: (context, index) {
                return Consumer<FavoriteProvider>(
                  builder: (BuildContext context, FavoriteProvider value,
                      Widget? child) {
                    return ListTile(
                      leading: Text('$index'),
                      title: const Text('Add to Favorite'),
                      trailing: IconButton(
                        onPressed: () {
                          if (value.favoriteItem.contains(index)) {
                            context
                                .read<FavoriteProvider>()
                                .removeFavorite(index);
                          } else {
                            context.read<FavoriteProvider>().setFavorite(index);
                          }
                        },
                        icon: Icon(
                          value.favoriteItem.contains(index)
                              ? Icons.favorite
                              : Icons.favorite_border,
                        ),
                      ),
                    );
                  },
                );
              });
        },
      ),
    );
  }
}
