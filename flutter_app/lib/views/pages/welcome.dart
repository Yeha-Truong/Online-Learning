import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  void _signin(context) {
    Navigator.pushNamed(context, '/signin');
  }

  void _subscribe(context) {
    Navigator.pushNamed(context, '/signup');
  }

  void _trail(context) {
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/default/takodachi.png'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Text(
                      'PLURALSIGHT',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                child: Column(
                  children: [
                    FractionallySizedBox(
                      widthFactor: 0.9,
                      child: ElevatedButton(
                        autofocus: true,
                        child: Text('Sign in'),
                        onPressed: () => _signin(context),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.9,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(
                              color: Colors.red,
                              width: 10.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                        child: Text('Subscribe to Pluralsight'),
                        onPressed: () => _subscribe(context),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.9,
                      child: OutlinedButton(
                        child: Text('Explore without a subsciption'),
                        onPressed: () => _trail(context),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
