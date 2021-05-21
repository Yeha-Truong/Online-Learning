import 'package:flutter/material.dart';

class DownloadFragment extends StatefulWidget {
  @override
  _DownloadFragmentState createState() => _DownloadFragmentState();
}

class _DownloadFragmentState extends State<DownloadFragment>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Downloads'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(children: [
        FractionallySizedBox(
          widthFactor: 0.9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Downloads',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              TextButton(
                onPressed: () => {},
                child: Text('Remove all'),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: [],
          ),
        ),
      ]),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
