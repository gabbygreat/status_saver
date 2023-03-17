import '../utils/utils.dart';

class AnimatedSwitch extends StatefulWidget {
  final double size;
  final bool? initialValue;
  final Function(bool) onTap;
  const AnimatedSwitch({
    super.key,
    this.size = 50,
    this.initialValue,
    required this.onTap,
  });

  @override
  State<AnimatedSwitch> createState() => _AnimatedSwitchState();
}

class _AnimatedSwitchState extends State<AnimatedSwitch> {
  late bool isOn = false;

  @override
  void initState() {
    super.initState();
    isOn = widget.initialValue ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        isOn = !isOn;
        widget.onTap(isOn);
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: widget.size,
        width: widget.size * 2,
        alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.size),
          color: isOn ? Theme.of(context).primaryColor : Colors.grey,
        ),
        child: CircleAvatar(
          radius: widget.size / 2,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
