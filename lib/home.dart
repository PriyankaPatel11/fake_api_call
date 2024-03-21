import 'package:flutter/material.dart';
import 'package:flutter_fake_api/model/model.dart';
import 'package:flutter_fake_api/provider/provider.dart';
import 'package:flutter_fake_api/services/service.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Products>> _futureProducts;

  // @override
  // void initState() {
  //   super.initState();
  //   _futureProducts = ProductService
  //       .fetchProducts();
  //   print(_futureProducts);
  // }

   @override
  void initState() {
    super.initState();

    // Use WidgetsBinding.instance.addPostFrameCallback to ensure that context is fully initialized.
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductProvider>(context, listen: false).getAllProduct();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Products'),
        ),
        body: Consumer<ProductProvider>
        (builder: (context, value, child){
          if(value.isLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final product = value.product;
          return  GridView.builder(
            padding: EdgeInsets.all(5),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5
                      ), 
                      itemCount: product.length,
                      
                    itemBuilder: (context, index){
                       return Flexible(               
                         child: Container(
                          padding: EdgeInsets.zero,
                          height: MediaQuery.of(context).size.height*0.7,
                          width: MediaQuery.of(context).size.width*0.267,                       
                          decoration: BoxDecoration(
                            // color: Colors.blueGrey.shade200,
                            // border: Border.all(color: Colors.black),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey.shade200,
                                blurRadius: 2.0,
                                spreadRadius: 1,
                                blurStyle: BlurStyle.outer
                              )
                            ],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                 ClipRRect(                               
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5)
                                  ),
                                  child: Image.network(product[index].image,
                                  height: 75,
                                  width: 300,
                                  fit: BoxFit.fill,)
                                  ),
                                  
                                  Container(
                                    padding: EdgeInsets.fromLTRB(8, 5, 0, 0),
                                    height: MediaQuery.of(context).size.height*0.1,
                                    width: MediaQuery.of(context).size.width*0.9,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Flexible(child: Text(product[index].title)),
                                        Flexible(child: Text('${product[index].price} - ${product[index].category}')),
                                        Flexible(child: Text('${product[index].rating.rate} (${product[index].rating.count})')),
                                    ],),
                                  )
                                 
                            ],
                          ),
                                           ),
                       );
                         
                }
            );


        }
      )

    );
  }
}
