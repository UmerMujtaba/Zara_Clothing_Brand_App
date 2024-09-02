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
  final String? selectedOption;
  final List<String>? options;
  final ValueChanged<String?>? onOptionChanged;

  CheckOutGestureDetector({
    super.key,
    this.name,
    this.icon,
    this.onTap,
    this.selectedOption,
    this.options,
    this.onOptionChanged,
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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
              child: DropdownButton<String>(
                value: selectedOption,
                icon: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                onChanged: onOptionChanged,
                items: options?.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ])),
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
