import 'package:flutter/material.dart';

class SquareCardButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget icon;
  final VoidCallback onTap;

  const SquareCardButton(
      {Key key,
      @required this.title,
      @required this.subtitle,
      @required this.icon,
      this.onTap})
      : super(key: key);

  Widget _buildIcon(BuildContext context) {
    var themeData = IconTheme.of(context).copyWith(
      size: 48,
      color: Colors.grey[600],
    );

    return IconTheme(data: themeData, child: icon);
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 16.0,
        margin: const EdgeInsets.all(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(16.0),
          hoverColor: Colors.transparent,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIcon(context),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
