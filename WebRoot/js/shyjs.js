function RemoveSqlChar(str) {
    return str.replace('#', '^').replace('%', '^').replace('/', '^').replace('@', '^').replace('\'', '^');
}

function getFix(num) {
    return num.toFixed(2);
}

function checkPost(post) {
    var reg = /^[0-9]\d{5}$/;
    var flag = reg.test(post);
    if (flag) {
        return true;
    } else {
        return false;
    }
}
function checkPhone(phone) {
    //var reg = /^((((13[5-9]{1})|(15[0,1,2,7,8,9]{1})|(188)){1}\d{1})|((134[0-8]{1}){1})){1}\d{7}$/;
    var reg = /^1[0-9]{10}$/;
    var flag = reg.test(phone);
    if (flag) {
        return true;
    } else {
        return false;
    }
}
function checkEmail(email) {
    var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
    var flag = reg.test(email);
    if (flag) {
        return true;
    } else {
        return false;
    }
}
function checkSFZ(num) {
    var len = num.length, re;
    if (len == 15)
        re = new RegExp(/^(\d{6})()?(\d{2})(\d{2})(\d{2})(\d{3})$/gi);
    else if (len == 18)
        re = new RegExp(/^(\d{6})()?(\d{4})(\d{2})(\d{2})(\d{3})(\d|x)$/gi);
    else {
        // alert("输入的数字位数不对！");
        return false;
    }
    var a = num.match(re);
    if (a != null) {
        if (len == 15) {
            var D = new Date("19" + RegExp.$3 + "/" + RegExp.$4 + "/" + RegExp.$5);
            var B = D.getYear() == RegExp.$3 && (D.getMonth() + 1) == RegExp.$4 && D.getDate() == RegExp.$5;
        }
        else {
            var D = new Date(RegExp.$3 + "/" + RegExp.$4 + "/" + RegExp.$5);
            var B = D.getFullYear() == RegExp.$3 && (D.getMonth() + 1) == RegExp.$4 && D.getDate() == RegExp.$5;
        }
        if (!B) {
            //    alert("输入的身份证号 " + a[0] + " 里出生日期不对！"); 
            return false;
        }
    }
    else {
        return false
    }
    return true
}
function ltrim(s) {
    return s.replace(/(^\s*)/, "");
}
//去右空格;   
function rtrim(s) {
    return s.replace(/(\s*$)/, "");
}
//去左右空格;   
function trim(s) {
    //s.replace(/(^\s*)|(\s*$)/, "");  
    return rtrim(ltrim(s));

}
function getParam(paramName) {
    paramValue = "";
    isFound = false;
    if (this.location.search.indexOf("?") == 0 && this.location.search.indexOf("=") > 1) {
        arrSource = unescape(this.location.search).substring(1, this.location.search.length).split("&");
        i = 0;
        while (i < arrSource.length && !isFound) {
            if (arrSource[i].indexOf("=") > 0) {
                if (arrSource[i].split("=")[0].toLowerCase() == paramName.toLowerCase()) {
                    paramValue = arrSource[i].split("=")[1];
                    isFound = true;
                }
            }
            i++;
        }
    }
    return paramValue;
}
function SelectNum() {
    var strWhere = "1,";
    for (var i = 2; i < 12; i++) {
        if ($("#keyWords" + i).val() == "*") {
            strWhere += "$,";
        } else {
            strWhere += $("#keyWords" + i).val() + ",";
        }
        window.location.href = "iPhoneCardList.aspx?num=" + strWhere;
    }

}

function ajaxChuli(str) {
    var arr = str.split('#');
    if (arr.length > 1) {
        for (var i = 0; i < arr.length - 1; i++) {
            var tmpArr = arr[i].split(';');
            if (tmpArr[1] == "0") {
                //$("select#" + tmpArr[0] + " option").remove();
                if (tmpArr[3] == "") {
                    $("select#" + tmpArr[0] + " option[value='" + tmpArr[2] + "']").attr('selected', 'true');
                } else {
                    $("select#" + tmpArr[0] + " option").remove();

                    //dropShi;0;;#dropQu;0;-1%请选择所在区县#dropShi;0;-1%请选择所在市

                    var tttArr = tmpArr[3].split('%');

                    if (tttArr.length == 1) {
                        $("select#" + tmpArr[0] + "").append("<option Selected value='" + tmpArr[2] + "'>" + tmpArr[3] + "</option>");
                    } else {

                        for (var g = 0; g < tttArr.length - 1; g++) {
                            $("select#" + tmpArr[0] + "").append("<option value='" + tttArr[g].split(',')[0] + "'>" + tttArr[g].split(',')[1] + "</option>");
                        }
                    }

                }
            } else if (tmpArr[1] == "1") {
                $("#" + tmpArr[0] + "").val(tmpArr[2]);
            } else if (tmpArr[1] == "5") {
                $("#" + tmpArr[0] + "").html(tmpArr[2]);
            } else if (tmpArr[1] == "2") {
                $("#" + tmpArr[0] + "").val(tmpArr[2]);

                $(".Environment input").each(function () {
                    if ($(this).attr("value")) {
                        $(this).attr("checked", false);
                    }
                });

                var arrEnvironment = $("#" + tmpArr[0] + "").val().split(',');
                for (var g = 0; g < arrEnvironment.length - 1; g++) {
                    $(".Environment input").each(function () {
                        if ($(this).attr("value") == arrEnvironment[g]) {
                            $(this).attr("checked", true);
                        }
                    });
                }

            } else if (tmpArr[1] == "3") {
                $("select#" + tmpArr[0] + " option").remove();
                $("#" + tmpArr[0] + "").hide();
            } else if (tmpArr[1] == "4") {
                $("#" + tmpArr[0] + "").show();
            }
        }
    }
}

function emptyVerify(Id, Msg) {
    if ($("#" + Id).val() == "") {
        alert(Msg);
        $("#" + Id).css("background-color", "#FFFFCC");
        return false;
    }
    $("#" + Id).css("background-color", "#FFFFFF");
    return true;
}

function nullVerify(Id, Msg) {
    if ($("#" + Id).val() == null) {
        alert(Msg);
        $("#" + Id).css("background-color", "#FFFFCC");
        return false;
    }
    $("#" + Id).css("background-color", "#FFFFFF");
    return true;
}

function equalVerify(Id, Msg, str) {
    if ($("#" + Id).val() == str) {
        alert(Msg);
        $("#" + Id).css("background-color", "#FFFFCC");
        return false;
    }
    $("#" + Id).css("background-color", "#FFFFFF");
    return true;
}
function floatVerify(Id, Msg) {
    var t = parseFloat($("#" + Id).val());
    if (t) {
        $("#" + Id).css("background-color", "#FFFFFF");
        return true;
    } else {
        alert(Msg);
        $("#" + Id).css("background-color", "#FFFFCC");
        return false;
    }
}
function floatEmptyVerify(Id, Msg) {
    if ($("#" + Id).val() == "") {
        $("#" + Id).css("background-color", "#FFFFFF");
        return true;
    } else {
        var t = parseFloat($("#" + Id).val());
        if (t) {
            $("#" + Id).css("background-color", "#FFFFFF");
            return true;
        } else {
            alert(Msg);
            $("#" + Id).css("background-color", "#FFFFCC");
            return false;
        }
    }
}
function intVerify(Id, Msg) {
    var t = parseInt($("#" + Id).val());
    if (t == $("#" + Id).val()) {
        $("#" + Id).css("background-color", "#FFFFFF");
        return true;
    } else {
        alert(Msg);
        $("#" + Id).css("background-color", "#FFFFCC");
        return false;
    }
}
function intEmptyVerify(Id, Msg) {
    if ($("#" + Id).val() == "") {
        $("#" + Id).css("background-color", "#FFFFFF");
        return true;
    } else {
        var t = parseInt($("#" + Id).val());
        if (t == $("#" + Id).val()) {
            $("#" + Id).css("background-color", "#FFFFFF");
            return true;
        } else {
            alert(Msg);
            $("#" + Id).css("background-color", "#FFFFCC");
            return false;
        }
    }
}

function emailEmptyVerify(Id, Msg) {
    if ($("#" + Id).val() == "") {
        $("#" + Id).css("background-color", "#FFFFFF");
        return true;
    } else {
        var t = parseInt($("#" + Id).val());
        var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
        var flag = reg.test($("#" + Id).val());
        if (flag) {
            $("#" + Id).css("background-color", "#FFFFFF");
            return true;
        } else {
            alert(Msg);
            $("#" + Id).css("background-color", "#FFFFCC");
            return false;
        }
    }
}

function emailVerify(Id, Msg) {
    var t = parseInt($("#" + Id).val());
    var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
    var flag = reg.test($("#" + Id).val());
    if (flag) {
        $("#" + Id).css("background-color", "#FFFFFF");
        return true;
    } else {
        alert(Msg);
        $("#" + Id).css("background-color", "#FFFFCC");
        return false;
    }
}

function postEmptyVerify(Id, Msg) {
    if ($("#" + Id).val() == "") {
        $("#" + Id).css("background-color", "#FFFFFF");
        return true;
    } else {
        var t = parseInt($("#" + Id).val());
        var reg = /^[0-9]\d{5}$/;
        var flag = reg.test($("#" + Id).val());
        if (flag) {
            $("#" + Id).css("background-color", "#FFFFFF");
            return true;
        } else {
            alert(Msg);
            $("#" + Id).css("background-color", "#FFFFCC");
            return false;
        }
    }
}

function postVerify(Id, Msg) {
    var t = parseInt($("#" + Id).val());
    var reg = /^[0-9]\d{5}$/;
    var flag = reg.test($("#" + Id).val());
    if (flag) {
        $("#" + Id).css("background-color", "#FFFFFF");
        return true;
    } else {
        alert(Msg);
        $("#" + Id).css("background-color", "#FFFFCC");
        return false;
    }
}


function phoneEmptyVerify(Id, Msg) {
    if ($("#" + Id).val() == "") {
        $("#" + Id).css("background-color", "#FFFFFF");
        return true;
    } else {
        var t = parseInt($("#" + Id).val());
        var reg = /^1[0-9]{10}$/;
        var flag = reg.test($("#" + Id).val());
        if (flag) {
            $("#" + Id).css("background-color", "#FFFFFF");
            return true;
        } else {
            alert(Msg);
            $("#" + Id).css("background-color", "#FFFFCC");
            return false;
        }
    }
}

function phoneVerify(Id, Msg) {
    var t = parseInt($("#" + Id).val());
    var reg = /^1[0-9]{10}$/;
    var flag = reg.test($("#" + Id).val());
    if (flag) {
        $("#" + Id).css("background-color", "#FFFFFF");
        return true;
    } else {
        alert(Msg);
        $("#" + Id).css("background-color", "#FFFFCC");
        return false;
    }
}
function SFZEmptyVerify(Id, Msg) {
    if ($("#" + Id).val() == "") {
        $("#" + Id).css("background-color", "#FFFFFF");
        return true;
    } else {
        var len = $("#" + Id).val().length, re;
        if (len == 15)
            re = new RegExp(/^(\d{6})()?(\d{2})(\d{2})(\d{2})(\d{3})$/gi);
        else if (len == 18)
            re = new RegExp(/^(\d{6})()?(\d{4})(\d{2})(\d{2})(\d{3})(\d|x)$/gi);
        else {
            alert(Msg);
            $("#" + Id).css("background-color", "#FFFFCC");
            return false;
        }
        var a = $("#" + Id).val().match(re);
        if (a != null) {
            if (len == 15) {
                var D = new Date("19" + RegExp.$3 + "/" + RegExp.$4 + "/" + RegExp.$5);
                var B = D.getYear() == RegExp.$3 && (D.getMonth() + 1) == RegExp.$4 && D.getDate() == RegExp.$5;
            }
            else {
                var D = new Date(RegExp.$3 + "/" + RegExp.$4 + "/" + RegExp.$5);
                var B = D.getFullYear() == RegExp.$3 && (D.getMonth() + 1) == RegExp.$4 && D.getDate() == RegExp.$5;
            }
            if (!B) {
                alert(Msg);
                $("#" + Id).css("background-color", "#FFFFCC");
                return false;
            }
        }
        else {
            alert(Msg);
            $("#" + Id).css("background-color", "#FFFFCC");
            return false;
        }
        $("#" + Id).css("background-color", "#FFFFFF");
        return true;
    }
}
function SFZVerify(Id, Msg) {
    var len = $("#" + Id).val().length, re;
    if (len == 15)
        re = new RegExp(/^(\d{6})()?(\d{2})(\d{2})(\d{2})(\d{3})$/gi);
    else if (len == 18)
        re = new RegExp(/^(\d{6})()?(\d{4})(\d{2})(\d{2})(\d{3})(\d|x)$/gi);
    else {
        alert(Msg);
        $("#" + Id).css("background-color", "#FFFFCC");
        return false;
    }
    var a = $("#" + Id).val().match(re);
    if (a != null) {
        if (len == 15) {
            var D = new Date("19" + RegExp.$3 + "/" + RegExp.$4 + "/" + RegExp.$5);
            var B = D.getYear() == RegExp.$3 && (D.getMonth() + 1) == RegExp.$4 && D.getDate() == RegExp.$5;
        }
        else {
            var D = new Date(RegExp.$3 + "/" + RegExp.$4 + "/" + RegExp.$5);
            var B = D.getFullYear() == RegExp.$3 && (D.getMonth() + 1) == RegExp.$4 && D.getDate() == RegExp.$5;
        }
        if (!B) {
            alert(Msg);
            $("#" + Id).css("background-color", "#FFFFCC");
            return false;
        }
    }
    else {
        alert(Msg);
        $("#" + Id).css("background-color", "#FFFFCC");
        return false;
    }
    $("#" + Id).css("background-color", "#FFFFFF");
    return true;
}

function ltrim(s) {
    return s.replace(/(^\s*)/, "");
}
//去右空格;   
function rtrim(s) {
    return s.replace(/(\s*$)/, "");
}
//去左右空格;   
function trim(s) {
    //s.replace(/(^\s*)|(\s*$)/, "");  
    return rtrim(ltrim(s));

}
function getParam(paramName) {
    paramValue = "";
    isFound = false;
    if (this.location.search.indexOf("?") == 0 && this.location.search.indexOf("=") > 1) {
        arrSource = unescape(this.location.search).substring(1, this.location.search.length).split("&");
        i = 0;
        while (i < arrSource.length && !isFound) {
            if (arrSource[i].indexOf("=") > 0) {
                if (arrSource[i].split("=")[0].toLowerCase() == paramName.toLowerCase()) {
                    paramValue = arrSource[i].split("=")[1];
                    isFound = true;
                }
            }
            i++;
        }
    }
    return paramValue;
}
function setParam(url, paramName, getValue, setValue) {
    var a = url.split("&" + paramName + "=" + getValue);
    var str1 = "&" + paramName + "=" + getParam(paramName);
    var str2 = "&" + paramName + "=" + setValue;
    url = url.split(str1)[0] + str2 + url.split(str1)[1];
    return url;
}