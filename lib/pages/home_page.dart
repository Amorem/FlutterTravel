import 'package:flutter/material.dart';
import 'package:flutter_travel/data.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _location = ['Moscow', 'Japan', 'London', 'Paris'];
  int _activeLocation = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        left: false,
        right: false,
        bottom: true,
        minimum: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05,
            0, MediaQuery.of(context).size.width * 0.05, 0),
        child: _mainColumn(context),
      ),
    );
  }

  Widget _mainColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.menu,
              color: Colors.black87,
              size: 35.0,
            ),
            Container(
              height: 39,
              width: 144,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/logo_discover.png'),
                ),
              ),
            ),
            Icon(
              Icons.search,
              color: Colors.black87,
              size: 35.0,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.03,
              bottom: MediaQuery.of(context).size.height * 0.03),
          child: _locationBar(context),
        ),
        _articleList(context),
      ],
    );
  }

  Widget _locationBar(BuildContext _context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.065,
      decoration: BoxDecoration(
        color: Color.fromRGBO(69, 69, 69, 1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _location.map(
          (f) {
            bool _isActive = _location[_activeLocation] == f ? true : false;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  f,
                  style: TextStyle(
                      fontSize: 15,
                      color: _isActive ? Colors.white : Colors.white54,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(
                  height: 5,
                ),
                _isActive
                    ? Container(
                        height: 2,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.redAccent,
                        ),
                      )
                    : Container(),
              ],
            );
          },
        ).toList(),
      ),
    );
  }

  Widget _articleList(BuildContext _context) {
    return Expanded(
      child: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.05),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(articles[index].image),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black38,
                            spreadRadius: 2,
                            blurRadius: 20,
                            offset: Offset(0, 6)),
                      ],
                    ),
                    child: _articleInfoColumn(_context, index),
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: MediaQuery.of(context).size.width * 0.10,
                child: _socialInfoContainer(_context, index),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _detailInfoRow(BuildContext _context, int _index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.play_arrow,
            color: Colors.redAccent,
            size: 30,
          ),
          onPressed: () {},
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  articles[_index].title,
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, bottom: 10),
                child: Text(
                  articles[_index].location,
                  style: TextStyle(
                      color: Colors.white54,
                      fontSize: 13,
                      fontWeight: FontWeight.w300),
                ),
              ),
              _ratingWidget(_context, _index),
            ],
          ),
        )
      ],
    );
  }

  Widget _articleInfoColumn(BuildContext _context, int _index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 30, 10),
          child: _authorInfoRow(_context, _index),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              40, MediaQuery.of(context).size.height * 0.02, 20, 0),
          child: _detailInfoRow(_context, _index),
        )
      ],
    );
  }

  Widget _authorInfoRow(BuildContext _context, int _index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://i.pravatar.cc/${_index + 1}00"),
                ),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    articles[_index].author,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "3 hours ago",
                    style: TextStyle(
                        color: Colors.white54,
                        fontSize: 13,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            )
          ],
        ),
        Column(
          children: <Widget>[
            Icon(
              Icons.favorite,
              color: Colors.red,
              size: 20,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Icon(
                Icons.bookmark,
                color: Colors.white,
                size: 20,
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _socialInfoContainer(BuildContext _context, int _index) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.favorite_border,
                color: Colors.redAccent,
              ),
              Text(
                articles[_index].likes.toString(),
                style: TextStyle(color: Colors.redAccent),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.comment,
                color: Colors.grey,
              ),
              Text(
                articles[_index].comments.toString(),
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.share,
                color: Colors.grey,
              ),
              Text(
                articles[_index].shares.toString(),
                style: TextStyle(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _ratingWidget(BuildContext _context, int _index) {
    return Row(
      children: List<Widget>.generate(
        5,
        (_currentIndex) {
          double _fillAmount = articles[_index].rating - _currentIndex;
          Icon _starIcon;
          if (_fillAmount >= 1) {
            _starIcon = Icon(Icons.star, color: Colors.amberAccent, size: 15);
          } else if (_fillAmount >= 0.5) {
            _starIcon =
                Icon(Icons.star_half, color: Colors.amberAccent, size: 15);
          } else {
            _starIcon =
                Icon(Icons.star_border, color: Colors.amberAccent, size: 15);
          }
          return _starIcon;
        },
      ),
    );
  }
}
