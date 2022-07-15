import 'package:flutter/material.dart';
import 'package:prueba_tecnica/data/models/post_model.dart';
import 'package:prueba_tecnica/data/repository/post_repository.dart';
import 'package:prueba_tecnica/widgets/appbar.dart';
import 'package:prueba_tecnica/widgets/card.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController titlecontroller = new TextEditingController();
    TextEditingController bodycontroller = new TextEditingController();
    PostRepository service = PostRepository();
    Future<List<PostModel>> post = service.getData();

    return Scaffold(
      endDrawer: Drawer(
        child: ListTile(title: Text('Close Session')),
      ),
      appBar: NewAppBar(titl: 'Post'),
      body: FutureBuilder(
        future: post,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final items = snapshot.data;
            List<PostModel> temp = items;

            return ListView.builder(
              itemCount: temp.length,
              itemBuilder: (context, index) {
                PostModel posts = temp[index];
                return Cards(title: posts.title, body: posts.body);
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('New Post:'),
                  content: Container(
                      child: Column(
                    children: [
                      TextField(controller: titlecontroller),
                      SizedBox(height: 20),
                      TextField(controller: bodycontroller),
                    ],
                  )),
                  actions: [
                    MaterialButton(
                      child: Text('Add'),
                      textColor: Colors.orangeAccent,
                      onPressed: () {},
                    )
                  ],
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
