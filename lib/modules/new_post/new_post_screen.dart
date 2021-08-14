import 'package:flutter/material.dart';
import 'package:socialapp/shard/components/component.dart';

class NewPostsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:defaultAppBar(
          context:context ,
      title: 'New Post',

      ),

    );
  }
}
