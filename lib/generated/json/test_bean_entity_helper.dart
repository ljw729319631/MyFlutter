import 'package:flutter_my_app/test_bean_entity.dart';

testBeanEntityFromJson(TestBeanEntity data, Map<String, dynamic> json) {
	if (json['status'] != null) {
		data.status = json['status']?.toString();
	}
	if (json['message'] != null) {
		data.message = json['message']?.toString();
	}
	if (json['data'] != null) {
		data.data = new TestBeanData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> testBeanEntityToJson(TestBeanEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	data['message'] = entity.message;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

testBeanDataFromJson(TestBeanData data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = new TestBeanDataTitle().fromJson(json['title']);
	}
	if (json['content'] != null) {
		data.content = new List<TestBeanDataContent>();
		(json['content'] as List).forEach((v) {
			data.content.add(new TestBeanDataContent().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> testBeanDataToJson(TestBeanData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.title != null) {
		data['title'] = entity.title.toJson();
	}
	if (entity.content != null) {
		data['content'] =  entity.content.map((v) => v.toJson()).toList();
	}
	return data;
}

testBeanDataTitleFromJson(TestBeanDataTitle data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> testBeanDataTitleToJson(TestBeanDataTitle entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	return data;
}

testBeanDataContentFromJson(TestBeanDataContent data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['value'] != null) {
		data.value = json['value']?.toString();
	}
	return data;
}

Map<String, dynamic> testBeanDataContentToJson(TestBeanDataContent entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['value'] = entity.value;
	return data;
}