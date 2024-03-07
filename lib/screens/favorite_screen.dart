import 'dart:js_interop';

import 'package:counter_app/screens/favorite_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favorite_provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
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
      body: ListView.builder(
          itemCount: 20,
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
                        context.read<FavoriteProvider>().removeFavorite(index);
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
          }),
    );
  }
}
