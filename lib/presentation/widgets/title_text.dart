part of 'widgets.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    required this.text,
    required this.iconLeft,
    this.iconRight,
    this.onTap,
    super.key,
  });

  final String text;
  final IconData iconLeft;
  final IconData? iconRight;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            iconLeft,
            color: const Color.fromARGB(255, 46, 225, 196),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: const TextStyle(
              color: Color.fromARGB(255, 46, 225, 196),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.start,
          ),
          const Spacer(),
          Icon(
            iconRight,
            color: const Color.fromARGB(255, 46, 225, 196),
          ),
        ],
      ),
    );
  }
}
