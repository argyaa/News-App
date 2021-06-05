import 'package:flutter/material.dart';
import 'package:news_app/model/articleModel.dart';
import 'package:news_app/theme/theme.dart';
import 'package:intl/intl.dart';

String dateformat(Article article) {
  var dt = article.publishedAt;
  DateTime parseDt = DateTime.parse(dt);
  var newFormat = DateFormat("yyyy-MM-dd   HH:mm");
  String updatedDt = newFormat.format(parseDt);
  return updatedDt;
}

@override
// ignore: non_constant_identifier_names
Widget NewsCard(Article article, BuildContext context) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/article", arguments: article);
        },
        child: Ink(
          height: MediaQuery.of(context).size.height * 0.21,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              article.urlToImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        article.urlToImage,
                        height: MediaQuery.of(context).size.height * 0.21,
                        width: MediaQuery.of(context).size.width * 0.33,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Center(child: Text("Image Not Found")),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      article.title == null
                          ? "title not found"
                          : (article.title.length >= 90)
                              ? article.title.substring(0, 90) + "..."
                              : article.title,
                      style:
                          medium.copyWith(fontSize: 16, color: black_primary),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    article.publishedAt != null
                        ? dateformat(article)
                        //"${article.publishedAt.substring(8, 10)}-${article.publishedAt.substring(5, 7)}-${article.publishedAt.substring(0, 4)}   ${article.publishedAt.substring(11, 13)}:${article.publishedAt.substring(14, 16)} WIB"
                        : "date not found",
                    style: regular.copyWith(fontSize: 12, color: grey_primary),
                  ),
                  Spacer(),
                  Text(
                    article.source.name != null
                        ? article.source.name
                        : "source not found",
                    style: regular.copyWith(fontSize: 12),
                  ),
                  SizedBox(height: 15),
                ],
              )
            ],
          ),
        ),
      ),
      SizedBox(height: 25),
    ],
  );
}
