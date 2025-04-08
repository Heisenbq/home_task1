import 'package:flutter/material.dart';
import 'package:home_task/resources/app_colors.dart';
import 'package:home_task/resources/app_images.dart';
import 'package:home_task/widgets/action_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 24,
        title: Text(
          'Детали документа',
          style: TextStyle(fontSize: 15, color: Colors.black54),
        ),
        backgroundColor: AppColors.background,
      ),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.only(right: 10, left: 10),
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back, color: Colors.black, size: 28),
                    SizedBox(width: 24),
                    Text(
                      "Новый документ",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Divider(color: Colors.black26, thickness: 1),
              SizedBox(height: 5),
              Image.asset(AppImages.healImage, height: 115, fit: BoxFit.cover),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: DocumentDetailsContent(),
              ),
              Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: SizedBox(
                  width: double.infinity,
                  child: ActionButton(
                    text: "Добавить в медкарту",
                    fontColor: Colors.white,
                    backgroundColor: Color(0xFF1A5DD0),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: SizedBox(
                  width: double.infinity,
                  child: ActionButton(
                    text: "Удалить",
                    fontColor: Color(0xFF1A5DD0),
                    backgroundColor: Colors.black12,
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class DocumentDetailsContent extends StatelessWidget {
  const DocumentDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoWithIcon(icon: Icons.person, text: 'Ирина'),
        SizedBox(height: 25),
        InfoWithIcon(
          icon: Icons.calendar_today,
          text: '22 мая (вт), 16:00',
          subText: 'Дата получения документа',
        ),
        SizedBox(height: 25),
        InfoWithIcon(
          icon: Icons.local_hospital,
          text: 'Клиника "Фомина"',
          subText: 'Бульвар Прервинский д. 4',
        ),
        SizedBox(height: 25),
        InfoWithIcon(icon: Icons.healing, text: "Стоматолог"),
        SizedBox(height: 25),
        TextInfo(),
      ],
    );
  }
}

class TextInfo extends StatelessWidget {
  const TextInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            color: AppColors.yellowTextBackground,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            "Клиника прислала документ после приёма. Чтобы добавить"
            " его в медкарту и посмотреть содержание, нужно будет указать"
            " дату рождения пациента. Это проверка для безопасности данных.",
            style: TextStyle(fontSize: 15),
          ),
        ),
        Positioned(
          right: -20,
          bottom: -20,
          child: Icon(
            Icons.info_outline_rounded,
            size: 74,
            color: Color(0xFFF9D2AE),
          ),
        ),
      ],
    );
  }
}

class InfoWithIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final String? subText;

  const InfoWithIcon({
    super.key,
    required this.icon,
    required this.text,
    this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey, size: 28),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text, style: TextStyle(fontSize: 16)),
            if (subText != null)
              Text(
                subText!,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
          ],
        ),
      ],
    );
  }
}
