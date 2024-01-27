import 'package:blog_app/screens/add_post.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final dbReference = FirebaseDatabase.instance.ref().child('Posts');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9fafc),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("New Blogs"),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddPostScreen()));
              },
              child: Icon(Icons.add)),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: FirebaseAnimatedList(
                query: dbReference.child('Post List'),
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(10),
                        ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: FadeInImage.assetNetwork(
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width*1,
                                height: MediaQuery.of(context).size.height*.25,
                                placeholder: 'images/blog.png',
                                image: snapshot.child('pImage').value.toString()),
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(snapshot.child('pTitle').value.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(snapshot.child('pDescription').value.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),
                          )
                          
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
