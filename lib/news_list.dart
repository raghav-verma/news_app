import 'package:flutter/material.dart';
import 'api_manager.dart';
import 'news_model.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
 Future<News>?  _news;

  @override
  void initState() {
    fetchData();
    super.initState();
  }
  fetchData()async{
    final result = await ApiManager().get("https://newsapi.org/v2/top-headlines?country=us&apiKey=48c4bcaefe284ce4b98e1a27cefd6b32");
    _news = Future.delayed(const Duration(), ()=>News.fromJson(result));
    print(News.fromJson(result));
    setState(()  {

  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: FutureBuilder<News>(
          future: _news,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                padding : EdgeInsets.only(
                  top : 100,
                ),
                  itemCount: snapshot.data?.articles?.length??0,
                  itemBuilder: (context, index) {
                    var article = snapshot.data?.articles[index];
                    return ListTile(
                      leading: Container(
                        height: 100,
                        width: 100,
                          child: Image.network(article?.urlToImage??'https://via.placeholder.com/150', fit: BoxFit.cover)),
                      title: Text(article?.title??''),
                      subtitle: Text(article?.description??''),
                    );
                  }, separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 60,
                  );
              },);
            } else
              return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
