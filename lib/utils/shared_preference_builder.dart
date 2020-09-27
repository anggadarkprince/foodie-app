import 'package:flutter/material.dart';
import 'package:foodie/utils/shared_storage.dart';

class SharedPreferencesBuilder<T> extends StatelessWidget {
	final String pref;
	final String prefDefault;
	final AsyncWidgetBuilder<T> builder;
	
	const SharedPreferencesBuilder({
		Key key,
		@required this.pref,
		@required this.builder,
		this.prefDefault,
	}) : super(key: key);
	
	@override
	Widget build(BuildContext context) {
		return FutureBuilder<T>(
			future: SharedStorage().getData(pref, prefDefault),
			builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
				return this.builder(context, snapshot);
			});
	}  
}