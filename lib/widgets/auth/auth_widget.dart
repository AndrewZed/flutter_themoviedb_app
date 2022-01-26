import 'package:flutter/material.dart';
import 'package:flutter_themoviedb_app/theme/app_button_style.dart';

class AuthWidget extends StatefulWidget {
  AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Войти в свою учетную запись'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _HeaderWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(fontSize: 16, color: Colors.black);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          _FormWidget(),
          const SizedBox(height: 25),
          Text(
              'Чтобы пользоваться правкой и возможностями рейтинга TMDB,'
              'а также получить персональные рекомендации, необходимо войти в свою учётную запись.'
              'Если у вас нет учётной записи, её регистрация является бесплатной и простой.'
              ' Нажмите здесь, чтобы начать.',
              style: textStyle),
          const SizedBox(height: 5),
          TextButton(
            style: AppButtonStyle.linkButton,
            onPressed: () {},
            child: Text('Регистрация'),
          ),
          const SizedBox(height: 25),
          Text(
              'Если Вы зарегистрировались, но не получили письмо для подтверждения, '
              'нажмите здесь, чтобы отправить письмо повторно.',
              style: textStyle),
          TextButton(
            style: AppButtonStyle.linkButton,
            onPressed: () {},
            child: Text('Подтвердить email'),
          ),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  _FormWidget({Key? key}) : super(key: key);

  @override
  __FormWidgetState createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? errorText;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;

    if (login == 'admin' && password == 'admin') {
      errorText = null;
      print('open app');

      Navigator.of(context).pushReplacementNamed('/main_screen');
    } else {
      errorText = 'Неверный логин или пароль';
    }
    setState(() {});
  }

  void _resetPassword() {
    print('сбросить пароль');
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
      fontSize: 16,
      color: Color(0xFF212529),
    );
    final color = const Color(0xFF01B4E4);
    final textFieldDecorator = InputDecoration(
      border:
          OutlineInputBorder(borderSide: BorderSide(color: color, width: 0.0)),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      isCollapsed: true,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          Text(
            errorText!,
            style: TextStyle(
              color: Colors.red,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 20)
        ],
        Text(
          'Имя пользователя',
          style: textStyle,
        ),
        const SizedBox(height: 5),
        TextField(
          controller: _loginTextController,
          decoration: textFieldDecorator,
        ),
        const SizedBox(height: 20),
        Text(
          'Пароль',
          style: textStyle,
        ),
        const SizedBox(height: 5),
        TextField(
          controller: _passwordTextController,
          decoration: textFieldDecorator,
          obscureText: true,
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            TextButton(
              onPressed: _auth,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(color),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                ),
              ),
              child: Text('Войти'),
            ),
            const SizedBox(
              width: 30,
            ),
            TextButton(
              onPressed: _resetPassword,
              style: AppButtonStyle.linkButton,
              child: Text('Сбросить пароль'),
            ),
          ],
        )
      ],
    );
  }
}
