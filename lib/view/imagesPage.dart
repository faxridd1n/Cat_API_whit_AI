import 'package:flutter/material.dart';
import 'package:the_cat_api/service/user_service.dart';

class ImagesPage extends StatefulWidget {
  const ImagesPage({super.key});

  @override
  State<ImagesPage> createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
              backgroundColor: Colors.teal,

        title: Text('Images'),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder(
          future: CatService.getUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Image(image: NetworkImage(snapshot.data![index].url)),
                    );
                    });
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text('No data'),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}