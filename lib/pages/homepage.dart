import 'package:news_app/components/news_card.dart';
import 'package:news_app/model/articleModel.dart';
import 'package:news_app/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:news_app/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  ApiServiceWSJ clientWSJ = ApiServiceWSJ();
  ApiServiceApple clientApple = ApiServiceApple();
  ApiServiceIndonesia clientIndonesia = ApiServiceIndonesia();
  ApiServiceTesla clientTesla = ApiServiceTesla();

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  RefreshController _refreshController2 =
      RefreshController(initialRefresh: false);

  RefreshController _refreshController3 =
      RefreshController(initialRefresh: false);

  RefreshController _refreshController4 =
      RefreshController(initialRefresh: false);

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: AppBar(
            flexibleSpace: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Browse",
                            style: medium.copyWith(
                                fontSize: 24, color: black_primary),
                          ),
                          SizedBox(height: 8),
                          Text("Discover things of this world",
                              style: regular.copyWith(
                                  fontSize: 16, color: grey_primary)),
                        ],
                      ),
                      // Spacer(),
                      // InkWell(
                      //   borderRadius: BorderRadius.circular(50),
                      //   onTap: () {},
                      //   child: Image.asset("assets/images/bookmark_on.png",
                      //       width: 40),
                      // )
                    ],
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Column(
            children: [
              Container(
                height: 35,
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    color: purple_primary,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: grey_primary,
                  isScrollable: true,
                  tabs: [
                    Text(
                      "The Wall Street Journal",
                      style: semibold.copyWith(fontSize: 12),
                    ),
                    Text(
                      "Gadget",
                      style: semibold.copyWith(fontSize: 12),
                    ),
                    Text(
                      "Indonesia",
                      style: semibold.copyWith(fontSize: 12),
                    ),
                    Text(
                      "Tesla",
                      style: semibold.copyWith(fontSize: 12),
                    )
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _wsj(clientWSJ, context, _refreshController),
                    _apple(clientApple, context, _refreshController2),
                    _indonesia(clientIndonesia, context, _refreshController3),
                    _tesla(clientTesla, context, _refreshController4),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _indonesia(ApiServiceIndonesia client, BuildContext context,
    RefreshController _refreshController) {
  return SmartRefresher(
    controller: _refreshController,
    enablePullDown: true,
    header: WaterDropMaterialHeader(),
    onRefresh: () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => HomePage(),
          transitionDuration: Duration(seconds: 0),
        ),
      );
    },
    child: FutureBuilder(
      future: client.getArticle(),
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        if (snapshot.hasData) {
          List<Article> articles = snapshot.data;
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: articles.length,
            padding: EdgeInsets.fromLTRB(0, 30, 24, 18),
            itemBuilder: (context, index) {
              return NewsCard(articles[index], context);
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ),
  );
}

Widget _wsj(ApiServiceWSJ client, BuildContext context,
    RefreshController _refreshController) {
  return SmartRefresher(
    controller: _refreshController,
    enablePullDown: true,
    header: WaterDropMaterialHeader(),
    onRefresh: () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => HomePage(),
          transitionDuration: Duration(seconds: 0),
        ),
      );
    },
    child: FutureBuilder(
      future: client.getArticle(),
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        if (snapshot.hasData) {
          List<Article> articles = snapshot.data;
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: articles.length,
            padding: EdgeInsets.fromLTRB(0, 30, 24, 0),
            itemBuilder: (context, index) {
              return NewsCard(articles[index], context);
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ),
  );
}

Widget _apple(ApiServiceApple client, BuildContext context,
    RefreshController _refreshController) {
  return SmartRefresher(
    controller: _refreshController,
    enablePullDown: true,
    header: WaterDropMaterialHeader(),
    onRefresh: () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => HomePage(),
          transitionDuration: Duration(seconds: 0),
        ),
      );
    },
    child: FutureBuilder(
      future: client.getArticle(),
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        if (snapshot.hasData) {
          List<Article> articles = snapshot.data;
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: articles.length,
            padding: EdgeInsets.fromLTRB(0, 30, 24, 0),
            itemBuilder: (context, index) {
              return NewsCard(articles[index], context);
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ),
  );
}

Widget _tesla(ApiServiceTesla client, BuildContext context,
    RefreshController _refreshController) {
  return SmartRefresher(
    controller: _refreshController,
    enablePullDown: true,
    header: WaterDropMaterialHeader(),
    onRefresh: () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => HomePage(),
          transitionDuration: Duration(seconds: 0),
        ),
      );
    },
    child: FutureBuilder(
      future: client.getArticle(),
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        if (snapshot.hasData) {
          List<Article> articles = snapshot.data;
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: articles.length,
            padding: EdgeInsets.fromLTRB(0, 30, 24, 0),
            itemBuilder: (context, index) {
              return NewsCard(articles[index], context);
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ),
  );
}
