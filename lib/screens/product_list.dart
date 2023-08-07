import 'package:flutter/material.dart';
import 'package:sqflite_demo/data/dbHelper.dart';

import '../models/product.dart';

class ProductList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductListState();
  }

}

class _ProductListState extends State{
  DbHelper dbHelper = new DbHelper();
  late List<Product> products;
  int productCount = 0;

  //bu sayfadaki state'i başlat
  //yani ürünleri burda set et
  @override
  void initState() {
    var productsFuture = dbHelper.getProducts();
    productsFuture.then((data){
      this.products = data;
    });
    // TODO: implement initState
   // super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(
       title: Text('Ürün listesi'),
     ),
     body: buildProductList(),
   );
  }

 ListView buildProductList() {
    //uygulama ilk açıldığında ekran boş, ürün yok ürün listesinde
   //init state kısmında data gittiği an ürünler listelenmeye başlanacak
  return ListView.builder(itemCount: productCount,
  itemBuilder: (BuildContext context, int position){
    return Card(
      color: Colors.cyan,
      elevation: 2.0,
      child: ListTile(
        leading: CircleAvatar(backgroundColor: Colors.amber,
        child: Text("solfej"),),
        title: Text(this.products[position].name),
        subtitle: Text(this.products[position].description),
        onTap: (){},
      ),
    );
  });
 }
}