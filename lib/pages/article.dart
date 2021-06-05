import 'package:flutter/material.dart';
import 'package:news_app/model/articleModel.dart';
import 'package:news_app/theme/theme.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

// String dateformat(final arg) {
//   var dt = arg;
//   DateTime parseDt = DateTime.parse(dt);
//   var newFormat = DateFormat("yyyy-MM-dd   HH:mm");
//   String updatedDt = newFormat.format(parseDt);
//   return updatedDt;
// }

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  String article = loremIpsum(paragraphs: 10, words: 1000);
  bool isOn = false;

  // DataFavorite favorite = DataFavorite();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final arg = ModalRoute.of(context).settings.arguments as Article;
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // actions: [
            //   IconButton(
            //     icon: (!isOn)
            // ? Icon(Icons.bookmark)
            //         : Icon(Icons.bookmark_border_outlined),
            //     onPressed: () {
            //       setState(() {
            //         print("isOn : $isOn");
            //         if (isOn) {
            //           isOn = false;
            //           // favorite.saveData(isOn);
            //         } else {
            //           isOn = true;
            //           // favorite.saveData(isOn);
            //         }
            //         // print("getData${favorite.getData()}");
            //       });
            //     },
            //   ),
            //   SizedBox(width: 24),
            // ],
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(children: [
                Image.network(
                  arg.urlToImage,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xCC000000),
                        const Color(0x00000000),
                        const Color(0xCC000000),
                        const Color(0xCC000000),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: purple_primary),
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Text(
                          arg.source.name,
                          style: semibold.copyWith(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        child: Text(arg.title,
                            style: medium.copyWith(
                                fontSize: 20, color: Colors.white)),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                )
              ]),
            ),
          ),
          SliverList(
            // delegate: SliverChildBuilderDelegate((_, index) => ListTile(
            //       title: Text("index $index"),
            //     ))
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.fromLTRB(24, 30, 24, 0),
                child: Container(
                  child: Text.rich(
                    TextSpan(
                      text: 'this is lorem ipsum\n\n',
                      style:
                          semibold.copyWith(fontSize: 16, color: black_primary),
                      children: [
                        TextSpan(
                          text: article,
                          style: medium.copyWith(
                              fontSize: 16, color: black_primary),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ]),
          )
        ],
      )),
    );
  }
}
