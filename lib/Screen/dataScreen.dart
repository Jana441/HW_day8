import 'package:flutter/material.dart';
import 'package:hw_day8/service/api.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    var screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Color.fromARGB(189, 254, 206, 223),
      appBar: AppBar(
        title: Text("Products Store"),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 20,
        ),
        backgroundColor: const Color.fromARGB(189, 254, 206, 223),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Serch for item",
                hintStyle: TextStyle(color: const Color.fromARGB(255, 8, 8, 8)),
                prefixIcon: Icon(Icons.search),
                prefixIconColor: const Color.fromARGB(255, 10, 0, 0),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            Expanded(
              child: FutureBuilder(
                future: Api().getP(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: LoadingAnimationWidget.threeArchedCircle(
                        color: const Color.fromARGB(255, 243, 242, 242),
                        size: 150,
                      ),
                    );
                  }
                  return GridView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      final product = snapshot.data![index];
                      return Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(87, 205, 239, 252),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Image.network(
                                  product.thumbnail!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Text(
                              product.title!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(" Id : ${
                              product.id.toString()
                            }", textAlign: TextAlign.center),
                            Text(
                              product.category!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "${product.price.toString()}\$",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
