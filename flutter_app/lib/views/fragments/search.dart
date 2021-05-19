import 'package:flutter/material.dart';
import 'package:flutter_app/views/fragments/search_alternative.dart';

class SearchFragment extends StatefulWidget {
  @override
  _SearchFragmentState createState() => _SearchFragmentState();
}

class _SearchFragmentState extends State<SearchFragment>
    with AutomaticKeepAliveClientMixin {
  void _search(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchAlternativeFragment()),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(128.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Container(
              margin: EdgeInsets.symmetric(horizontal: 24.0),
              child: TextFormField(
                onFieldSubmitted: (keywords) => _search(context),
                autofocus: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 0.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Over 7,000 courses at your fingertips',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Text(
              'Search by title, aauthor or subject.',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
