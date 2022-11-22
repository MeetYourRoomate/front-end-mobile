import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/property_request.dart';
import 'package:provider/provider.dart';

class RequestsPage extends StatefulWidget {
  const RequestsPage({super.key});

  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  final String defaulImage =
      "https://firebasestorage.googleapis.com/v0/b/meet-your-roommate-c7ed7.appspot.com/o/common%2FdefaultImage.jpeg?alt=media&token=d428210c-db58-4f65-b801-05605fea18d6";
  @override
  Widget build(BuildContext context) {
    final requestProvider = Provider.of<PropertyRequestProvider>(context);
    print(requestProvider.listRequestStudent.length);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Property Requests",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          requestProvider.listRequestStudent.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: requestProvider.listRequestStudent.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      //requestProvider.listRequestStudent[index].rentalOffer!.property!.assets!.isNotEmpty?requestProvider.listRequestStudent[index].rentalOffer!.property!.assets!.first.imageUrl?requestProvider.listRequestStudent[index].rentalOffer!.property!.assets!.first.imageUrl
                                      image: NetworkImage(requestProvider
                                              .listRequestStudent[index]
                                              .rentalOffer!
                                              .property!
                                              .assets!
                                              .isNotEmpty
                                          ? requestProvider
                                              .listRequestStudent[index]
                                              .rentalOffer!
                                              .property!
                                              .assets!
                                              .first
                                              .imageUrl!
                                          : defaulImage),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 100,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          requestProvider
                                              .listRequestStudent[index]
                                              .rentalOffer!
                                              .property!
                                              .tittle!,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          requestProvider
                                              .listRequestStudent[index]
                                              .message!,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          requestProvider
                                              .listRequestStudent[index]
                                              .rentalOffer!
                                              .price
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),
                      );
                    }),
                  ),
                )
              : const Center(
                  child: Text("No requests"),
                )
        ],
      ),
    );
  }
}
