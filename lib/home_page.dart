
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/Internet_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<InternetCubit, InternetState>(
          listener: (context, state) {
             if(state == InternetState.gained){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('Internet Connected')
                  )
              );
            }
             else if(state == InternetState.lost){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text('Internet Not Connected')
                  )
              );
            }
          },
          builder: (context, state) {
            if(state == InternetState.gained){
              return const Text('Connected');
            }
            else if(state == InternetState.lost){
              return const Text('Not Connected');
            }
            else{
              return const Text('Loading...');
            }
          },
        ),
      ),
    );
  }
}
