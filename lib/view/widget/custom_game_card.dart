import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:leadsdoit/model/soccer.dart';
import 'package:leadsdoit/services/web_service.dart';
import 'package:leadsdoit/view/util/assets.dart';
import 'package:leadsdoit/view/util/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';

class CGameCard extends StatefulWidget {
  const CGameCard({Key? key}) : super(key: key);

  @override
  State<CGameCard> createState() => _CGameCardState();
}

class _CGameCardState extends State<CGameCard> {
  WebViewController? _webViewController;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Soccer>(
        future: WebService().getSoccer(),
        builder: (context, snapshot) {
          var url = html.window.location.href;
          if (kDebugMode) {
            //как я понял первую задачу:
            //нужно было при запуске запускать ссылку и если это ссылка кидает
            //на google.com то нужно открывать экран мобильного приложения
            //который я сверстал и получаю данные через апи
            //а если нет то перекидывать на сайт.
            //что я пытался сделать:
            //сначала попробовал запустить ссылку через webView потом получить
            //ссылку которая открылась и сравнить для того чтобы выбрать что отображать
            //но ссылку не получилось получить, также пытался попробовать через launch
            //тоже не получилось получить, что я имею в итоге, это просто проверка на ссылку
            print('SoccerData: ${snapshot.data?.teams}');
            print('SoccerDataError: ${snapshot.error}');
            print('current url $url');
            print('launch url ${launch('https://www.thesportsdb.com/')}');
          }
          if (!snapshot.hasData ||
              snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.white));
          } else {
            return Stack(
              children: [
                url == 'https://www.thesportsdb.com/'
                    ? WebView(
                        backgroundColor: Colors.white,
                        initialUrl: 'https://www.thesportsdb.com/',
                        javascriptMode: JavascriptMode.unrestricted,
                        onWebViewCreated:
                            (WebViewController webViewController) {
                          _webViewController = webViewController;
                        },
                      )
                    : ListView.separated(
                        itemBuilder: (_, index) {
                          final soccer = snapshot.data?.teams.match[index];
                          return Container(
                            decoration: BoxDecoration(
                                color: Palette.mineShaftLight,
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Palette.mineShaft,
                                        borderRadius: BorderRadius.circular(3)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 7),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(Assets.cup),
                                        const SizedBox(width: 13),
                                        Text(
                                          '${soccer?.league}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Inter'),
                                        ),
                                        const Spacer(),
                                        if (soccer != null)
                                          Text(
                                            DateFormat('dd.MM')
                                                .format(soccer.date),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Inter'),
                                          )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Center(
                                    child: Text(
                                      '${soccer?.time}',
                                      style: const TextStyle(
                                          color: Palette.silver,
                                          fontSize: 15,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 18),
                                          child: Text(
                                            '${soccer?.homeTeam}',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: 'Inter'),
                                          ),
                                        ),
                                        const VerticalDivider(
                                          thickness: 2,
                                          color: Palette.emperor,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 18),
                                          child: Text(
                                            '${soccer?.awayTeam}',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: 'Inter'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Palette.mineShaft,
                                        borderRadius: BorderRadius.circular(3)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 7),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          '${soccer?.homeGoals}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Inter'),
                                        ),
                                        Text(
                                          '${soccer?.awayGoals}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Inter'),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(height: 16),
                        itemCount: snapshot.data?.teams.match.length ?? 1),
              ],
            );
          }
        });
  }
}
