import 'package:flutter/material.dart';
import 'package:nftapp/app/helper/api/model/getnftmodel.dart';
import 'package:nftapp/app/helper/api/nftapi/nftapi.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: APIHelper.apiHelper.fetchNFT(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error: ${snapshot.error}"),
                );
              } else if (snapshot.hasData) {
                Result? result = snapshot.data;
                return ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Text("${result?.name}"),
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )
        ],
      ),
    );
  }
}
