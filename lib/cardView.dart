import 'package:flutter/material.dart';
import 'package:ipod_card_selector/albumCard.dart';

class CardView extends StatefulWidget {
  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  final PageController _pageCtrl = PageController(viewportFraction: 0.6);
  double curPage = 0.6;

  @override
  void initState() {
    _pageCtrl.addListener(() {
      setState(() {
        curPage = _pageCtrl.page;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            height: 300,
            color: Colors.black,
            child: PageView.builder(
              controller: _pageCtrl,
              scrollDirection: Axis.horizontal,
              itemCount: 9,
              itemBuilder: (context, int idx) => AlbumCard(
                color: Colors.accents[idx],
                curIdx: idx,
                curPage: this.curPage,
              ),
            ),
          )
        ],
      ),
    );
  }
}


