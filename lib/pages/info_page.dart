import 'package:clipboard/clipboard.dart';
import 'package:covid19/components/app_bar.dart';
import 'package:covid19/components/native_loading.dart';
import 'package:covid19/utils/constants.dart';
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
                previewString: Constants.kApiDocumentationUrl,
              ),
              _linkButton(
                  title: "Developer's GitHub",
                  previewString: Constants.kAuthorGit),
            ],
          ),
        ),
      ),
    );
  }

  Padding _linkButton({String title, String previewString}) {
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
          _modal(copyString: previewString);
        },
      ),
    );
  }

  Future _modal({String copyString}) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
          child: Container(
            child: Wrap(
              children: [
                ListTile(
                  title: Text(
                    "Copy to clipboard.",
                    style: Theme.of(context).textTheme.button.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  leading: IconTheme(
                    data: Theme.of(context)
                        .iconTheme
                        .copyWith(color: Theme.of(context).primaryColor),
                    child: Icon(Icons.copy),
                  ),
                  onTap: () => FlutterClipboard.copy(copyString).then(
                    (value) => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Padding _onLoading() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: NativeLoading(animating: true),
    );
  }
}
