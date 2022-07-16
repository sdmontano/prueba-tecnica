import 'package:flutter/material.dart';
import 'package:prueba_tecnica/data/models/post_model.dart';
import 'package:prueba_tecnica/data/repository/post_repository.dart';
import 'package:prueba_tecnica/widgets/appbar.dart';
import 'package:prueba_tecnica/widgets/card.dart';
import 'package:prueba_tecnica/widgets/texfield_input.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  TextEditingController titlecontroller = new TextEditingController();
  TextEditingController bodycontroller = new TextEditingController();

  late Future<List<PostModel>> posts;
  late PostRepository service;
  late Future<PostModel> post;

  @override
  void initState() {
    super.initState();
    service = PostRepository();
    posts = service.getData();
  }

  @override
  void dispose() {
    super.dispose();
    titlecontroller.dispose();
    bodycontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewAppBar(titl: 'Post'),
      body: FutureBuilder(
        future: posts,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final items = snapshot.data;
            List<PostModel> temp = items;
// Create a ListView
            return ListView.builder(
              itemCount: temp.length,
              itemBuilder: (context, index) {
                PostModel pos = temp[index];
                return Cards(
                  title: pos.title,
                  body: pos.description,
                  ontap: () {
                    post = service.deleteData(pos.id);
                    setState(() {
                      posts = service.getData();
                    });
                  },
                );
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
//Button to add new post
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFieldInput(
                        textEditingController: titlecontroller,
                        textInputType: TextInputType.text,
                        hintText: 'Enter the title',
                      ),
                      SizedBox(height: 20),
                      TextFieldInput(
                        textEditingController: bodycontroller,
                        textInputType: TextInputType.text,
                        hintText: 'Enter the description',
                      ),
                    ],
                  )),
                  actions: [
                    MaterialButton(
                      child: Text('Add'),
                      textColor: Colors.orangeAccent,
                      onPressed: () {
                        post = service.postData(
                            titlecontroller.text, bodycontroller.text);
                        titlecontroller.clear;
                        bodycontroller.clear;
                        setState(() {
                          posts = service.getData();
                        });
                        Navigator.of(context).pop();
                      },
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
