import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vk_tech_donation/pages/detail-complete.dart';
import 'package:vk_tech_donation/widgets/card.dart';
import 'package:vk_tech_donation/widgets/post.dart';

class NewsFeed extends StatelessWidget {
  dynamic donation;

  NewsFeed({this.donation});

  ScrollController controller = ScrollController(initialScrollOffset: 450);

  List<Widget> _mail(BuildContext context) {
    return [
      Post(
        who: "Ярослав Зотов",
        avatarPath: "assets/image/avatar-1.png",
        photoPath: "assets/image/post-1.jpg",
        text: "А мы опять кодим:) Подписывайте на мою инсту @panda.developer",
      ),
      Post(
        who: donation.author,
        avatarPath: "assets/image/avatar-3.jpg",
        text: donation.post,
        content: GestureDetector(
          onTap: () => Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (_) => DetailCompletePage(
                donation: donation,
              ),
            ),
          ),
          child: DonationCard(
            donation: this.donation,
          ),
        ),
      ),
      Post(
          who: "Вездекод | Хакатон ВКонтакте",
          avatarPath: "assets/image/avatar-2.jpg",
          photoPath: "assets/image/post-2.png",
          text:
              "Обжигающий лидерборд «Вездекода» уже в вашей ленте новостей!\n\nПо итогам заданий «Хотфикс.Веб» и VK Kitten Contest рейтинги команд изменились таким образом: команды NekoMantica и Bepis поменялись на лидерских позициях, а «Смешарики» прочно закрепились на третьем месте.\n\nКстати, 1028 тестов в «Хотфикс.Веб» прошли автоматически, а остальные наши отважные тестировщики проверили вручную — выражаем ребятам большой респект 🤟🏻\n\nВ прикреплённом документе — полный список и рейтинг всех команд.\n\nБаллы на ваших счетах пополнятся в 20:00 по московскому времени. На них можно приобрести мерч VK или действия для команды. Заходите в магазин с веб-версии и изучайте каталог."),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.all(15.0),
          child: SvgPicture.asset(
            "assets/svg/camera.svg",
          ),
        ),
        title: Container(
          margin: EdgeInsets.only(top: 6.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "Новости",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 6),
                          SvgPicture.asset(
                            "assets/svg/chevron-down.svg",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4.5),
                    Container(
                      width: 100,
                      height: 2,
                      decoration: BoxDecoration(
                        color: Color(0xFF3F8AE0),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 34),
              Text(
                "Новости",
                style: TextStyle(
                  color: Color(0xFF818C99),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: SvgPicture.asset("assets/svg/notification.svg"),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            controller: controller,
            child: Column(
              children: _mail(context),
            ),
          ),
        ),
      ),
    );
  }
}
