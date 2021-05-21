import 'package:flutter/material.dart';

class SearchAlternativeFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(128.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Container(
                margin: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 40.0),
                child: Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFormField(
                          autofocus: false,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            suffixIcon: Icon(Icons.cancel),
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
                      TextButton(
                        onPressed: () => {},
                        child: Text('Cancel'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottom: TabBar(tabs: [
              Tab(
                child: Text('All'),
              ),
              Tab(
                child: Text('Courses'),
              ),
              Tab(
                child: Text('Paths'),
              ),
              Tab(
                child: Text('Authors'),
              ),
            ]),
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 8.0),
              child: ListView(
                children: [],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8.0),
              child: ListView(
                children: [],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8.0),
              child: ListView(
                children: [],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8.0),
              child: ListView(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
