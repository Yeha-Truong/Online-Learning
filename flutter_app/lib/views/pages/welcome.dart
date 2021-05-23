import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatelessWidget {
  void _signin(context) {
    Navigator.pushNamed(context, '/signin');
  }

  void _subscribe(context) {
    Navigator.pushNamed(context, '/signup');
  }

  void _trail(context) {
    Provider.of<UserProvider>(context, listen: false)
        .saveUser(new User(), UserType.Guest)
        .then((value) => SchedulerBinding.instance!.addPostFrameCallback((_) {
              Navigator.pushNamed(context, '/');
            }));
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<UserProvider>(context, listen: false).loadUser().then((value) {
      if (value) Navigator.pushReplacementNamed(context, '/');
    });
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
                      'OnLearn',
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
                        child: Text('Subscribe to OnLearn'),
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
