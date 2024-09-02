import 'package:flutter/material.dart';

class RandomGestureDetector extends StatelessWidget {
  final String? name;
  final IconData? icon;
  final Function()? onTap;

  RandomGestureDetector({
    super.key,
    this.name,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          color: Theme.of(context).colorScheme.secondary,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              Text(name!,
                  style: TextStyle(
                    fontFamily: 'TenorSans',
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  )),
            ],
          )),
    );
  }
}

class CheckOutGestureDetector extends StatelessWidget {
  final String? name;
  final IconData? icon;
  final Function()? onTap;

  CheckOutGestureDetector({
    super.key,
    this.name,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
              borderRadius: BorderRadius.circular(50)),
          // color: Theme.of(context).colorScheme.secondary,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(name!,
                    style: TextStyle(
                      fontFamily: 'TenorSans',
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          )),
    );
  }
}

class AddAddressGestureDetector extends StatelessWidget {
  final String? name;
  final IconData? icon;
  final Function()? onTap;

  AddAddressGestureDetector({
    super.key,
    this.name,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            padding: EdgeInsets.all(40),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)),
            // color: Theme.of(context).colorScheme.secondary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                Text(name!,
                    style: TextStyle(
                      fontFamily: 'TenorSans',
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    )),
              ],
            )),
      ),
    );
  }
}
