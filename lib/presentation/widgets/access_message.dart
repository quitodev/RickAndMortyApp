part of 'widgets.dart';

class AccessMessage extends StatelessWidget {
  const AccessMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 32),
      body: Center(
        child: SingleChildScrollView(
          child: ColoredBox(
            color: const Color.fromARGB(255, 32, 32, 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 47, 47, 47),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(150.0),
                    ),
                    border: Border.all(
                      color: const Color.fromARGB(255, 219, 219, 219),
                      width: 3,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 72,
                ),
                const Text(
                  '¡Access denied!',
                  style: TextStyle(
                    color: Color.fromARGB(255, 46, 225, 196),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(
                  width: 200,
                  child: Text(
                    'To be logged in, press the button below...',
                    style: TextStyle(
                      color: Color.fromARGB(255, 46, 225, 196),
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 32, 32, 32),
                    backgroundColor: const Color.fromARGB(255, 46, 225, 196),
                  ),
                  onPressed: () async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    preferences.setBool('isLoggedIn', true).then((value) =>
                        Navigator.pushReplacementNamed(context, '/'));
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
