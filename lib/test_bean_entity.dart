import 'package:flutter_my_app/generated/json/base/json_convert_content.dart';

/**
 * {
		"status": "0000",
		"message": "success",
		"data": {
		"title": {
		"id": "001",
		"name" : "白菜"
		},
		"content": [
		{
		"id": "001",
		"value":"你好 白菜"
		},
		{
		"id": "002",
		"value":"你好 萝卜"
		}
		]
		}
		}
		————————————————
		版权声明：本文为CSDN博主「BCZCB」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
		原文链接：https://blog.csdn.net/zhoubaicai/java/article/details/92666654
 */

class TestBeanEntity with JsonConvert<TestBeanEntity> {
	String status;
	String message;
	TestBeanData data;
}

class TestBeanData with JsonConvert<TestBeanData> {
	TestBeanDataTitle title;
	List<TestBeanDataContent> content;
}

class TestBeanDataTitle with JsonConvert<TestBeanDataTitle> {
	String id;
	String name;
}

class TestBeanDataContent with JsonConvert<TestBeanDataContent> {
	String id;
	String value;
}
