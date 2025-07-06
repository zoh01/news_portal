import 'package:news_portal/utils/constants/image_strings.dart';

import '../domain/models/slider_model.dart';

List<SliderModel> getSliders() {
  List<SliderModel> slider = [];

  SliderModel sliderModel = new SliderModel();

  sliderModel.image = ZohImages.science;
  sliderModel.text = "Science";
  slider.add(sliderModel);
  sliderModel = new SliderModel();

  sliderModel.image = ZohImages.technology;
  sliderModel.text = "Technology";
  slider.add(sliderModel);
  sliderModel = new SliderModel();

  sliderModel.image = ZohImages.business;
  sliderModel.text = "Business";
  slider.add(sliderModel);
  sliderModel = new SliderModel();

  sliderModel.image = ZohImages.sport;
  sliderModel.text = "Sport";
  slider.add(sliderModel);
  sliderModel = new SliderModel();

  sliderModel.image = ZohImages.entertainment;
  sliderModel.text = "Entertainment";
  slider.add(sliderModel);
  sliderModel = new SliderModel();

  return slider;
}