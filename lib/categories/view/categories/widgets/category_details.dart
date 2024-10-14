import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/sources/view/widgets/sources_tabs.dart';
import 'package:new_app/sources/view_model/sources_states.dart';
import 'package:new_app/sources/view_model/sources_view_model.dart';
import 'package:new_app/shared/widget/error_indicator.dart';
import 'package:new_app/shared/widget/loading_indicator.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails(this.categoryId, {super.key});
  final String categoryId;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  final viewModel=SourcesViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.categoryId);
  }
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SourcesViewModel>(context);
    return BlocProvider(
      create:(context) =>viewModel,
      
      child:BlocBuilder<SourcesViewModel,SourcesStates>(
        builder: (context,state){
        if(state is GetSourcesLoading){
        return const LoadingIndicator();
        }
        else if(state is GetSourcesError){
          return ErrorIndicator(
            onPressed:(_)=>viewModel.getSources(widget.categoryId),
            errorMessage:state.errorMessage,);
        }
        else if (state is GetSourcesSuccess){
        return SourcesTabs(sources:state.sources);}
        else{
          return const SizedBox();
        }
      })
    );
    // FutureBuilder(
    //   future: APIService.getSources(widget.categoryId),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const LoadingIndicator();
    //     } else if (snapshot.hasError || snapshot.data?.status != "ok") {
    //       return ErrorIndicator(onPressed: (_)=>APIService.getSources(widget.categoryId),sourceId: widget.categoryId,);
    //     } else {
    //       final sources = snapshot.data?.sources ?? [];
    //       return SourcesTabs(sources: sources);
    //     }
    //   },
    // );
  }
}
