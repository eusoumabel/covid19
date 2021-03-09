import 'package:clipboard/clipboard.dart';
import 'package:covid19/components/app_bar.dart';
import 'package:covid19/utils/constants.dart';
import 'package:covid19/utils/helpers/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_link_preview/flutter_link_preview.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: "Information",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Constants.kInformationString,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 15),
              ),
              Text(
                Constants.kAuthor,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 15),
              ),
              _linkButton(
                title: "Corona API",
                url: Constants.kApiDocumentationUrl,
              ),
              _linkButton(
                  title: "Developer's GitHub", url: Constants.kAuthorGit),
            ],
          ),
        ),
      ),
    );
  }

  Padding _linkButton({String title, String url}) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: TextButton(
        child: Text(
          title,
          style: Theme.of(context).textTheme.button.copyWith(
                color: Theme.of(context).dividerColor,
              ),
        ),
        onPressed: () {
          launchURL(url);
        },
      ),
    );
  }
}
