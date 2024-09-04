
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:what_we_eat/app/models/GetProductBycategoryIdModel.dart';

Future<dynamic> buildShowModalBottomSheet({ required BuildContext context, required GetProductByCategoryIdModel? productByCategoryIdModel, required int index}) {
  return showModalBottomSheet(
      barrierLabel: 'Coca‑Cola Original',
      barrierColor: Colors.black.withOpacity(0.5),
      showDragHandle: true,
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      elevation: 10,
      shape: const Border.symmetric(
        horizontal: BorderSide.none,
        vertical: BorderSide(color: Colors.grey),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
            initialChildSize: 0.7,
            minChildSize: 0.7,
            maxChildSize: 1,
            expand: false,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: CachedNetworkImage(
                           imageUrl:  productByCategoryIdModel?.products?[index].imageUrl ?? "",
                            placeholder: (context, url) =>  LoadingAnimationWidget.inkDrop(color: Colors.grey, size: 20,),
                            errorWidget: (context, url, error) => const Icon(Icons.error , color: Colors.red,),
                            width: context.width * 0.8,
                            height: context.height * 0.3,
                          )
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            productByCategoryIdModel?.products?[index].name ?? "",
                            style: Theme.of(context).textTheme.titleLarge,
                          ).paddingOnly(top: 10),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.search,color: Colors.green,)).paddingOnly(top: 10),
                        ],
                      ),
                      Row(
                        children: [
                          Badge(
                            backgroundColor: productByCategoryIdModel?.products?[index].categoryId == 1 ? Colors.green : Colors.red,
                            label: Text(
                              productByCategoryIdModel?.products?[index].categoryName ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ).paddingOnly(top: 10,right: 10),
                          Badge(
                            backgroundColor: Colors.blue,
                            label: Text(
                              'Authentic',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.white,
                            ),),
                          ).paddingOnly(top: 10),
                        ],
                      ),
                      Text(
                        productByCategoryIdModel?.products?[index].description ?? "",
                        style: Theme.of(context).textTheme.bodySmall,
                      ).paddingOnly(top: 10),
                      RichText(text: TextSpan(
                        children: [
                          TextSpan(
                            text: '৳ ${productByCategoryIdModel?.products?[index].price ?? ""}',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.green,
                            ),
                          ),
                          TextSpan(
                            text: "/ ${productByCategoryIdModel!.products?[index].unit_size} ${productByCategoryIdModel.products?[index].unit_type}",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          TextSpan(
                            text: ' (Approx.)',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey,
                            ),

                          )
                        ],
                      )).paddingOnly(top: 10),
                      Text(
                        'Available in ${productByCategoryIdModel.products?[index].unit_size} ${productByCategoryIdModel.products?[index].unit_type}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ).paddingOnly(top: 10),
                      const Divider().paddingOnly(top: 10),
                      Text(
                        'Product Details',
                        style: Theme.of(context).textTheme.titleLarge,
                      ).paddingOnly(top: 10),
                      RichText(text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Manufacturer: ',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                            text: productByCategoryIdModel?.products?[index].brandName ?? "",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      )).paddingOnly(top: 10),
                      RichText(text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Bar Code: ',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                            text: productByCategoryIdModel?.products?[index].barCode ?? "",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      )).paddingOnly(top: 10),
                      RichText(text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Category: ',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                            text: '${productByCategoryIdModel.products?[index].Product_Category}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      )).paddingOnly(top: 10),
                      RichText(text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Sub Category: ',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                            text: '${productByCategoryIdModel.products?[index].Product_Category}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      )).paddingOnly(top: 10),
                      RichText(text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Country: ',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                            text: productByCategoryIdModel.products?[index].countryName ?? "",
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: productByCategoryIdModel.products?[index].categoryId == 1 ? Colors.green : Colors.red,
                            ),

                          ),
                        ],
                      )).paddingOnly(top: 10),
                      DataTable(
                          headingRowColor: WidgetStateProperty.all(Colors.grey.shade200),
                          columnSpacing: context.width * 0.1,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          columns: const [
                            DataColumn(label: Text('Nutrition Facts')),
                            DataColumn(label: Text('Per 100 ml')),
                            DataColumn(label: Text('Per Serving')),
                          ],
                          rows:  [
                            DataRow(cells: [
                              const DataCell(Text('calories')),
                              DataCell(Text('${productByCategoryIdModel.products?[index].nutrition?.calories ?? "0"} g')),
                              //subtraction of 100 ml from 320 ml
                              DataCell(Text('${productByCategoryIdModel?.products?[index].nutrition?.calories ?? "0"} g')),
                            ]),
                            DataRow(cells: [
                              const DataCell(Text('fat')),
                              DataCell(Text('${productByCategoryIdModel?.products?[index].nutrition?.fat ?? "0"} g')),
                              DataCell(Text('${productByCategoryIdModel?.products?[index].nutrition?.fat ?? "0"} g')),
                            ]),
                            DataRow(cells: [
                              const DataCell(Text('protein')),
                              DataCell(Text('${productByCategoryIdModel?.products?[index].nutrition?.protein ?? "0"} g')),
                              DataCell(Text('${productByCategoryIdModel?.products?[index].nutrition?.protein ?? "0"} g')),
                            ]),
                            DataRow(cells: [
                              const DataCell(Text('carbohydrates')),
                              DataCell(Text('${productByCategoryIdModel?.products?[index].nutrition?.carbohydrates ?? "0"} g')),
                              DataCell(Text('${productByCategoryIdModel?.products?[index].nutrition?.carbohydrates ?? "0"} g')),
                            ]),

                          ]
                      ).paddingOnly(top: 10,bottom: 10),
                      RichText(text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Ingredients: ',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                            text: productByCategoryIdModel?.products?[index].ingredients ?? "",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      )).paddingOnly(top: 10),



                    ],
                  ).paddingAll(20),
                ),
              );
            });
      });
}