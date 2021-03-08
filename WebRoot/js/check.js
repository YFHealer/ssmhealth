jQuery.extend({
	checkstr : function(str, checkType) {
		var result = true;
		switch (checkType) {
		case 'odd_number':
			var testStr = testArr['number'];
			var reg = RegExp(testStr, 'g');
			result = reg.test(str);
			if (true == result) {
				var num = parseInt(str) % 2;
				if (1 == num) {
					result = true;
				} else {
					result = false;
				}
			} else {
				result = false;
			}
			break;
		case 'even_number':
			var testStr = testArr['number'];
			var reg = RegExp(testStr, 'g');
			result = reg.test(str);
			if (true == result) {
				var num = parseInt(str) % 2;
				if (num == 0) {
					result = true;
				} else {
					result = false;
				}
			} else {
				result = false;
			}
			break;
		case 'decimal_point':
			var testStr = testArr['positive_float'];
			var reg = RegExp(testStr, 'g');
			var s1 = reg.test(str);
			testStr = testArr['negative_float'];
			reg = RegExp(testStr, 'g');
			var s2 = reg.test(str);
			if (true == s1) {
				result = true;
			} else if (true == s2) {
				result = true;
			} else {
				result = false;
				;
			}
			break;
		case 'decimal_point_number':
			var testStr = testArr['positive_float'];
			var reg = RegExp(testStr, 'g');
			var s1 = reg.test(str);
			testStr = testArr['negative_float'];
			reg = RegExp(testStr, 'g');
			var s2 = reg.test(str);
			if (true == s1) {
				result = true;
			} else if (true == s2) {
				result = true;
			} else {
				result = false;
			}
			if (true == result) {
				var strArr = str.split('.');
				return strArr[1].length;
			}
			break;
		case 'id_card':
			if (18 == str.length) {
				var wi = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1 ];// 加权因子
				var valideCode = [ 1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2 ];// 血压验证位值.10代表X

				var year = str.substring(6, 10);
				var month = str.substring(10, 12);
				var day = str.substring(12, 14);
				var temp_date = new Date(year, parseFloat(month) - 1,
						parseFloat(day));
				if (temp_date.getFullYear() != parseFloat(year)
						|| temp_date.getMonth() != parseFloat(month) - 1
						|| temp_date.getDate() != parseFloat(day)) {
					result = false;
					break;
				}

				var sum = 0;
				if (str[17].toLowerCase() == 'x') {
					str[17] = 10;
				}
				for ( var i = 0; i < 17; i++) {
					sum += wi[i] * parseInt(str[i]);
				}
				valCodePosition = sum % 11;
				if (str[17] != valideCode[valCodePosition]) {
					result = false;
					break;
				}

				result = true;
			} else {
				result = false;
			}
			break;
		case 'prime_number':
			var strArr = testArr[checkType].split(',');
			var len = strArr.length;
			result = false;
			var num = parseInt(str);
			for ( var i = 0; i < len; i++) {
				if (num == strArr[i]) {
					result = true;
					break;
				}
			}
			break;
		case 'composite_number':
			var strArr = testArr[checkType].split(',');
			var len = strArr.length;
			result = false;
			var num = parseInt(str);
			for ( var i = 0; i < len; i++) {
				if (num == strArr[i]) {
					result = true;
					break;
				}
			}
			break;
		default:
			var testStr = testArr[checkType];
			var reg = RegExp(testStr, 'g');
			result = reg.test(str);
			break;
		}
		return result;
	}
});

/*
 * definition
 */
var testArr={};
testArr['positive_int']='^[1-9]\\d*$';
testArr['vmname']='^[a-zA-Z_-][\\w\\s\\-]{2,44}$';
testArr['commonname']='^[a-zA-Z_-][\\w\\-]{2,44}$';
testArr['letter'] = '^[a-zA-Z]+$';
testArr['username'] = '^[0-9a-zA-Z_]+$';
testArr['qq'] = '^[0-9]\\d*$';
testArr['email'] = '^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.[a-zA-Z]+([-.][a-zA-Z]+)*$';
testArr['ip'] = '^\\d+\\.\\d+\\.\\d+\\.\\d+$';
testArr['tel'] = '^(\\(\\d{3,4}\\)|\\d{3,4}-|\\s)?\\d{7,8}(-\\d{1,4})?$';
//\\+?(\\d+(\\s*\\-?\\s*))+
testArr['mobile'] = '^([0\\+]?86)?[0 -]?1[3458]\\d{9}$';
//\\+?(\\d+(\\s*\\-?\\s*))+
//testArr['mobile'] = '[0-9]\\d*$';
testArr['postcode'] = '^[1-9]\\d{5}(?!\\d)$';
//^([0-9a-zA-Z]+(\\s*\\-?\\s*))+$
testArr['number'] = '^-?[0-9]\\d*$';
testArr['positive_number'] = '^[1-9]\\d*$';
testArr['positive_number_float'] = '^(([1-9]+[0-9]*.{1}[0-9]+)|([0].{1}[1-9]+[0-9]*)|([1-9][0-9]*)|([0][.][0-9]+[1-9]*)|(0))$';
testArr['negative_number'] = '^-[1-9]\\d*$';
testArr['zh_cn'] = '[\\u4e00-\\u9fa5]';
testArr['prime_number'] = '2,3,5,7,11,13,17,19,23,29,31';
testArr['composite_number'] = '1,4,5,8,9,10,12,14,15,16,18,20,21,22,24,25,26,27,28,30,32,33,34,35';
testArr['positive_float'] = '^[0-9]\\d*\\.\\d*|0\\.\\d*[1-9]\\d*$';
testArr['negative_float'] = '^-([1-9]\\d*\\.\\d*|0\\.\\d*[1-9]\\d*)$';
testArr['is_url'] = '[a-zA-z]+://[^\\s]*';