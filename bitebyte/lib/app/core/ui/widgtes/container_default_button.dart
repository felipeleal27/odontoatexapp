import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerDefaultButton extends StatefulWidget {
  final String text;
  final Function()? onTap;
  final bool? circularProgressIndicator;
  const ContainerDefaultButton(
      {super.key,
      required this.text,
      required this.onTap,
      required this.circularProgressIndicator});

  @override
  State<ContainerDefaultButton> createState() => _ContainerDefaultButtonState();
}

class _ContainerDefaultButtonState extends State<ContainerDefaultButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.circularProgressIndicator != null &&
              widget.circularProgressIndicator!
          ? null
          : () {
              widget.onTap == null ? null : widget.onTap!();
            },
      child: Observer(
        builder: (_) {
          return Container(
            width: size.width.w,
            height: size.height.h / 22,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 30, 90, 140),
                  Colors.black,
                  Colors.blue,
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Center(
              child: widget.circularProgressIndicator == null ||
                      !widget.circularProgressIndicator!
                  ? const Text(
                      'ENTRAR',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                      color: Colors.white,
                    )),
            ),
          );
        },
      ),
    );
  }
}
