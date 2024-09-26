import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorite_manager.dart';

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteManager>(
      builder: (context, favoriteManager, child) {
        /// Cek apakah daftar favorit kosong
        if (favoriteManager.favorites.isEmpty) {
          return Center(
            child: Text(
              'Tidak ada masakan favorit',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          );
        } else {
          return GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.8,
            ),
            itemCount: favoriteManager.favorites.length,
            itemBuilder: (context, index) {
              final food = favoriteManager.favorites[index];
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
                        child: Image.asset(
                          food['image']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        food['name']!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        favoriteManager.toggleFavorite(food);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
