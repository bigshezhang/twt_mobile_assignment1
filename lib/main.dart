import 'dart:math';
import 'package:flutter/material.dart';
import 'package:twt_mobile_assignment1/things_you_do_not_need_understand/wpy_storage.dart';
import 'package:twt_mobile_assignment1/you_can_edit_here/post.dart';
import 'package:twt_mobile_assignment1/you_can_edit_here/post_card.dart';
import 'package:twt_mobile_assignment1/you_can_edit_here/wpy_service.dart';
import 'package:twt_mobile_assignment1/things_you_do_not_need_understand/wpy_network.dart';

Future<void>  main() async {
  WidgetsFlutterBinding.ensureInitialized();  //等待初始化完毕
  await CommonPreferences.init();
  await NetStatusListener.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);    //超类

  // This widget is the root of your application.
  @override   //复写
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '一份小作业',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int length = 10;    //帖子长度，只展示10个帖子
  List<Post> postList = [];

  Future<void> _getPost() async {
    postList = await FeedbackService.getPosts();
    setState(() {
      postList = postList;
    });
    for(Post post in postList){
      if (!post.image_urls.isEmpty){
        print(post.image_urls.first);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("迷你微北洋"),
        actions: <Widget>[
          TextButton(
              child: Text(
                "登录",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              onPressed: () => FeedbackService.getTokenByPassword(onSuccess: () => print("获取到的Token: \n"+CommonPreferences.lakeToken.value),onFailure: print),
          ),
          IconButton(
              onPressed: () => _getPost(),
              icon: Icon(Icons.refresh)
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            ...List.generate(postList.length == 0 ? 0 : postList.length, (index) => postList.length == 0 ? Text("Nothing") : PostCard(postList[index])),
          ],
        ),
      ),
    );
  }
}
