import 'package:first_app/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;  
  final String imageUrl;

  ProductItem({
    this.id, 
    this.title, 
    this.imageUrl
    });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(     
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: id,
              );
            },
          child: Image.network(imageUrl, fit: BoxFit.cover,)
          ),
        footer: GridTileBar(        
          backgroundColor: Colors.black87,
          leading: 
            IconButton(
              color: theme.primaryColor,
              icon: Icon(Icons.favorite), 
              onPressed: (){}
              ),
          title: 
            FittedBox(  
              fit: BoxFit.fitWidth,          
              child: Text(title, textAlign: TextAlign.center)
              ),
          trailing: 
            IconButton(
              color: theme.accentColor,
              icon: Icon(Icons.shopping_cart), 
              onPressed: (){}
              ),
        ),
      ),
    );
  }
}