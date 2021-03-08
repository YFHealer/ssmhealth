
function isSuccess(response){
	if(typeof(response) == 'string'){
		return response;
	}
	if(typeof(response) == 'object' && response && (response.status == 1 ||response.status == "success")){
		return true;
	}
	
	return false;
}

function getResult(response){
	if(typeof(response) == 'object' && response && response.hasOwnProperty('result')){
		return response.result;
	}
	
	if(typeof(response) == 'string'){
		return response;
	}
	return "";
}

function getMessage(response){
	if(typeof(response) == 'object' && response && response.hasOwnProperty('message')){
		return response.message;
	}
	
	if(typeof(response) == 'string'){
		return response;
	}
	return "";
}

function stringToArray(s, delimiterRegex){
	if(typeof s == 'string'){
		s == $.trim(s);
		if(s.length == 0){
			return [];
		}else{
			var exp = delimiterRegex||",";
			return s.split(exp);
		}
	}
	return null;
}

function hideAllSelect(selects){
	var ret = [];
	var items = selects || $("select");
	items.each(function(i, item){
		item = $(item);
		if(item.css("visibility") != "hidden"){
			item.css("visibility", "hidden");
			ret.push(item);
		}
	});
	return $(ret);
}

function showAllSelect(selects){
	var ret = [];
	var items = selects || $("select");
	items.each(function(i, item){
		item = $(item);
		if(item.css("visibility") != "visible"){
			item.css("visibility", "visible");
			ret.push(item);
		}
	});
	return $(ret);
}

function trigerAll(_self, trigerItemName){
	var cbs = document.getElementsByName(trigerItemName);
	if(cbs && cbs.length > 0){
		if(_self.checked){
			for(var i=0;i<cbs.length;i++){
				cbs[i].checked = true;
			}
		}else{
			for(var i=0;i<cbs.length;i++){
				cbs[i].checked = false;
			}
		}
	}
}

/**
 * conf.container 
 * conf.title 
 * conf.url
 * conf.successFunc 
 * conf.errorFunc
 * conf.completeFunc
 * @param conf
 */
function CustomForm(conf){
	
	var form = null;
	var inited = false;
	var hideItems = null;
	
	this.show = function(){
		if($.browser.msie && $.browser.version=="6.0"){
			hideItems = hideAllSelect();
		}
		if(inited == false || form == null){
			init.call(this, conf);
		}else{
			form.dialog("open");
		}
	};
	this.close = function(){
		if(form!=null){
			form.dialog("close");
		}
		if($.browser.msie && $.browser.version=="6.0"){
			showAllSelect(hideItems);
		}
	};
	
	this.destroy = function(){
		if(form!=null){
			if(typeof conf.beforeDestroy == 'function'){
				conf.beforeDestroy.call();
			}
			form.dialog("destroy");
			if(conf.destroy){
				conf.destroy.call(this);
			}
			if($.browser.msie && $.browser.version=="6.0"){
				showAllSelect(hideItems);
			}
			inited = false;
		}
	};
	
	this.getForm = function(){
		return form;
	};
	
	var init = function(conf){
		var container = $(conf.container);
		var isAjax = false;
		if(typeof conf.url == 'string'){
			isAjax = true;
	    	container.empty();
		}
		container.hide();
		var cf = this;
		
		if(typeof conf.data == 'undefined'){
        	conf.data = {};
        }
		if(typeof conf.title == 'undefined'){
        	conf.title = "";
        }
		if(typeof conf.cache == 'undefined'){
        	conf.cache = false;
        }
		if(typeof conf.buttons == 'undefined'){
        	conf.buttons = [{
        		text: conf.okLabel || "确认", 
        		click: function() { 
        			var form = container.find("form");
        			if(form && form.length>0){
        				if(typeof conf.onSubmit == 'function'){
        					
        					var func = function(){
        						var hasError = false;
            					$(form).find(".isrequired").each(function(){
            						var tr = $(this).closest("tr");
            						if(!checkFormField(tr)){
            							alert("*标注内容均必填");
            							hasError = true;
            							return false;
            						}
            					})
            					if(hasError){
            						return false;
            					}
            					ajax_post(form.attr("action"), form.serialize(), 
            							$.proxy(conf.successFunc, cf), 
            							$.proxy(conf.errorFunc, cf), 
            							$.proxy(conf.completeFunc, cf));
        					}
        					
            				if( conf.onSubmit.call(this, form, func) == true){
            					//check required input|radio|checkbox|select field
            					func.call(this);
            				}
            			}
        			}else{
        				if(conf.successFunc){
        					conf.successFunc.call(cf);
        				};
        			}
        		} 
        	}, {
        		text: conf.cancelLabel || "关闭", 
        		click: function() { 
        			if(conf.cache){
        				cf.close(); 
        			}else{
        				cf.destroy(); 
        			}
        		} 
        	}];
        }
		
		var success = false;
		var successFunc = function(result) {
        	if(isSuccess(result) == true){
        		var html = getResult(result);
        		container.html("<div style='height:100%'>"+html+"</div>");
        		success = true;
            }else{
            	var message = getMessage(result);
            	$("<span class='loadingError'>"+message+"</span>").appendTo(container.empty());
            }
        };
        
        var errorFunc = function(jqXHR, textStatus, errorThrown) {
        	if(typeof conf.errorMsg == "undefined"){
        		conf.errorMsg = "加载失败";
        	}
        	
	         $("<span class='loadingError'>"+conf.errorMsg+"</span>").appendTo(container.empty());
	     };
	     
	    var height = "auto";
     	if(typeof(conf.height) != "undefined"){
     		height = conf.height;
     	}
     	var fixedSize = true;;
     	 if(height == "auto"){
     		fixedSize = false;
     	 }
	     
	     var showPanel = function(){
        	form = container.dialog($.extend({
        		modal: true,
        		dialogClass: "no-close",
        		autoOpen:false,
        		close: function(event, ui) {
        			if(conf.cache){
        				cf.close(); 
        			}else{
        				cf.destroy(); 
        			}
        		},
                resizable: true,
                height:height
        	},conf));
        	if(conf.resizable != true){
        		$(form).dialog( "option", "resizable", false );
        	}
        	$(form).dialog("open");
        }
	     
	    var completeFunc = function(){
        	if(typeof(conf.callback)=="function"){
        		conf.callback.call(this, form);
			}
			if(!fixedSize){
				showPanel.call(this);
			}
        	if(success == true && conf.cache){
        		inited = true;
        	}
        	if(success == true && typeof(conf.aftershow) == "function"){
     	     	conf.aftershow.call(this, form);
     	 	}
        };
        
        if(fixedSize){
        	showPanel.call(this);
        }
        
        if(isAjax){
        	ajax_post(conf.url, conf.data, successFunc, errorFunc, completeFunc);
        }else{
        	completeFunc.call();
        }
	};
}

function checkFormField(tr){
	if($(tr).find("input[type='text']").length >0 && isNull($(tr).find("input[type='text']").val())){
		return false;
	}
	
	if($(tr).find("select").length >0 && isNull($(tr).find("select").val())){
		return false;
	}
	if($(tr).find("input[type='textarea']").length >0 && isNull($(tr).find("input[type='textarea']").text())){
		return false;
	}
	
	if($(tr).find("input[type='radio']").length >0 && isNull($(tr).find("input[type='radio']:checked"))){
		return false;
	}
	
	if($(tr).find("input[type='checkbox']").length >0 && isNull($(tr).find("input[type='checkbox']:checked"))){
		return false;
	}
	return true;
}

function showProcessingDialog(container){
	if(typeof container == 'undefined'){
		container = $(document.body);
	}
	loading = $("<div><div class='loading'/></div>").appendTo(container);
	$(loading).dialog({
		modal:true,
		appendTo: container,
		height : 32,
		width : 64,
		dialogClass : 'loadingDialog',
		resizable : false,
		draggable : false
	}); 
	
	return loading;
}

function loadHomeContent(url, errorMsg){
	loadContent("#home_content", url, errorMsg);
}

function loadContent(container, url, errorMsg, callback){
	container = $(container);
	ajax_post(url, {}, function(result){
		if(isSuccess(result)){
			var html = getResult(result);
        	container.html(html);
        	if(typeof callback == 'function'){
        		callback.call(this,result);
			}
		}else{
			var message = getMessage(result);
        	$("<span class='loadingError'>"+message+"</span>").appendTo(container.empty());
        }
	}, function(){
		if(isNull(errorMsg)){
			errorMsg = "加载失败";
		}
		$("<span class='loadingError'>"+errorMsg+"</span>").appendTo(container.empty());
	}, null, container);
}

function ajax_post(url, data, successFunc, errorFunc, completeFunc, container){
	var pd= showProcessingDialog(container);
	$.ajax({
        type: "POST",
        dataType: "html",
        cache: false,
        url: url,
        data: data,
        success: function(result, textStatus, jqXHR) {
        	pd.dialog("destroy");
        	if(successFunc){
        		try{
        			result = $.parseJSON(result);
                }catch(e){}
            	if(isSuccess(result) && typeof result=='string' && jqXHR.getResponseHeader("Location")){
            		window.location.href = jqXHR.getResponseHeader("Location");
            	}else{
            		successFunc.call(this , result);
            	}
        	}
        },
        error: function(jqXHR, textStatus, errorThrown) {
        	pd.dialog("destroy");
        	if(errorFunc){
        		errorFunc.call();
        	}else{
        		alert("服务器异常！");
        	}
        },
        complete : function(){
        	if(completeFunc){
        		completeFunc.call();
        	}
        }
    });
}

function countTableColumns(table){
    var cols = 0;
    var row = table.find("tr");
    if(row.length > 0){
    	row.first().children().each(function(index, el){
			var cs = $(el).attr("colspan");
			if(cs){
				cols += parseInt(cs);
			}else{
				cols++;
			}
	    });
    }
    
    return cols;
}

function buildAreaTree(treeContainer, url, initially_open, uiConf, eventConf){
	/*select_limit, initially_select*/
	if(typeof uiConf == "undefined"){
		uiConf = {};
	}
	var _eventConf = eventConf || {};
	if( typeof initially_open != 'object' || !initially_open || !(initially_open instanceof Array) ){
		initially_open = [];
	}
	
	var tree = $(treeContainer).bind("loaded.jstree", function (event, data) {
		if( initially_open.length==0 ){
			openRoot();
		}
	}).jstree({
		"plugins" : [
            "themes", "json_data", "ui"
        ],
        "core" : {
        	"initially_open" : initially_open
        },
        "ui" : uiConf,
        "json_data" : {
        	"ajax" : {
        		"dataType": "html",
        		"url" : url,
        		"data" : function (n) {
                    return {
                        "dqdm" : n.attr ? n.attr("id").replace("node_","") : ""
                    };
                },
                "success": function (resp, textStatus, jqXHR) {
                	var ret = [];
                	try{
                		resp = $.parseJSON(resp);
                    }catch(e){}
                    if(isSuccess(resp) && typeof resp=='string' && jqXHR.getResponseHeader("Location")){
                		window.location.href = jqXHR.getResponseHeader("Location");
                    }else{
                    	if(isSuccess(resp) == true){
                        	var results = getResult(resp);
                        	results.sort(function(r1, r2){
                        		return r1.dqdm>r2.dqdm? 1 : -1;
                        	});
                        	for(var i=0;i<results.length;i++){
                        		var result = results[i];
                        		ret.push({
                        			"data" : result["name"],
                        			"state": "closed",
                        			"attr": {
                    			    	"id": result["dqdm"]
                    				},
                    				"metadata": {
                    					"display" : result["displayName"]
                    				}
                        		});
                        	}
                        }else{
                        	alert(getMessage(resp));
                        }
                    }
                    return ret;
                }
        	}
        }
	}).bind("dblclick.jstree", function (event, data) {
		if(typeof _eventConf.dblclick == 'function'){
			_eventConf.dblclick.call(this, event, data);
		}
	}).bind("click.jstree", function (event, data) {
		if(typeof _eventConf.click == 'function'){
			_eventConf.click.call(this, event, data);
		}
	});
	
	function openRoot(){
		var rootChildren = tree.jstree("_get_children", -1);
		if(rootChildren.length == 1){
			rootChildren.each(function(i,val){
				var nodes = $(val).find("li.jstree-closed");
				if(nodes.length == 1){
					tree.jstree("open_node", nodes);
				}
			});
		}
	}
	
	return (new function(){
		this.getJstree = function(){
			return tree;
		};
		
		this.getSelected = function(){
			return tree.jstree('get_selected');
		};
		
		this.getNodeText = function(node){
			return tree.jstree("get_text", node);
		};
		
		this.getNodeDisplay = function(node){
			return $.jstree._reference(this.getNodeId(node))._get_node (node).data().display;
		};
		
		this.getNodeId = function(node){
			return $(node).attr("id");
		};
		
		this.saveSelected = function(){
			tree.jstree("save_selected");
		};
		
		this.clearSelection = function(){
			tree.jstree("deselect_all");
		};
		
		this.reselect = function(keepCurrent){
			if(keepCurrent != true){
				tree.jstree("deselect_all");
			}
			tree.jstree("reselect");
		};
		
		this.destroy = function(){
			tree.jstree("destroy");
		};
		
	}());
}

function AreaSelectPanel(inputEl, hiddenEl, panelConf, treeUrl, treeUiConf){
	
	inputEl = $(inputEl);
	hiddenEl = $(hiddenEl);
	var hiddenName = hiddenEl.attr("name");
	var cachedPanel = AreaSelectPanel.prototype.panelMap[hiddenName];
	if(cachedPanel){
		cachedPanel.precheck(inputEl, hiddenEl);
	}
	
	var dialog = null;
	var tree = null;
	
	this.show = function(initially_open){
		var panel = this.panelMap[hiddenName];
		if(panel){
			panel.getTree().reselect();
			panel.getDialog().dialog("open");
		}else{
			var container = inputEl.parent();
			var treePanelId = getTreePanelId(hiddenName);
			el = $("#"+treePanelId);
			if(el.length == 0){
				container.append("<div id='"+treePanelId+"' style='display:hidden'><div>");
			}
			el = $("#"+treePanelId);
			
			var uiConf = treeUiConf || {};
			uiConf['initially_select'] = stringToArray(hiddenEl.val());
			tree = buildAreaTree(el, treeUrl, initially_open, uiConf);
			dialog = buildDialog.call(this, el);
			
			this.panelMap[hiddenName] = this;
		}
	};
	
	this.getDialog = function(){
		return dialog;
	};
	
	this.getTree = function(){
		return tree;
	};
	
	this.precheck = function(newInput, newHidden){
		if(hiddenEl[0] != newHidden[0] || 
				inputEl[0] != newInput[0]){
			this.panelMap[hiddenName] = null;
			tree.destroy();
			dialog.dialog("destroy");
		}
	};
	
	var getTreePanelId = function(inputName){
		return "tp__" + inputName;
	};
	
	var buildDialog = function(dContent){
		var panel = this;
		var conf = panelConf || {};
		dialog = dContent.dialog({
			modal: true,
	        width: 300,
	        title: conf.title || "",
	        height: 360,
	        close : function(){
	        	$(this).dialog("close");
	        }, 
	        buttons : [{
        		text: conf.clearLabel || "清除", 
        		click: function() { 
		        	var val = "";
		        	var ids = "";
		        	inputEl.val(val);
		    		hiddenEl.val(ids);
		    		tree.clearSelection();
		    		tree.saveSelected();
		        	$(this).dialog("close");
        		}
        	}, {
        		text: conf.okLabel || "Ok", 
        		click: function() { 
        			var selectedNodes = tree.getSelected();
		        	var val = "";
		        	var ids = "";
		        	if(selectedNodes){
		        		selectedNodes.each(function(i, node){
		        			if(val != ""){
		        				val += "\n";
		        			}
		        			val += tree.getNodeDisplay(node);
		        			
		        			if(ids != ""){
		        				ids += ",";
		        			}
		        			ids += tree.getNodeId(node);
		        		});
		        	}
		        	inputEl.val(val);
		    		hiddenEl.val(ids);
		    		tree.saveSelected();
		        	$(this).dialog("close");
        		}
        	}, {
        		text: conf.cancelLabel || "Cancel", 
        		click: function() { 
        			$(this).dialog("close");
        		} 
        	}]
		});
		
		return dialog;
	};
	
}
AreaSelectPanel.prototype.panelMap = {};


function isNull(value) {
    if (typeof(value) == "undefined" ||null == value|| "" == $.trim(value) || value == "null" || value.length == 0) {
        return true;
    } else {
        return false;
    }
}

function showPrompt(title, text, value, callback){
	var finished = false;
	var ret = null;
	
	var container = $("<div></div>").appendTo($(document.body));
	var cf = null;
	cf = new CustomForm({
		container : container,
		title : title || "",
		width : 360,
		open: function(event, ui){
			container.html("<div style='padding: 5px 0;'><B>"+text+"</b></div><div style='padding: 5px 0;'><textarea style='width:320px;height:80px;resize:none'></textarea>"+(value||"")+"</div>");
		},
		successFunc : function(){
			ret = cf.getForm().find("textarea").val();
			cf.destroy();
		},
		destroy : function(){
			finished = true;
		}
	});
	cf.show();
	
	var interval_val = null;
	interval_val = window.setInterval(function(){
		if(finished == true){
			container.remove();
			window.clearInterval(interval_val);
			if(typeof callback == "function"){
				callback.call(this, ret);
			}
		}
	}, 200);
	
}

function toTimestamp(date){
	if(date){
		return date.format("yyyy-MM-dd hh:mm:ss");
	}
	
	return "";
}

Date.prototype.format = function(fmt)   
{ 
  var o = {
    "M+" : this.getMonth()+1,
    "d+" : this.getDate(),
    "h+" : this.getHours(),
    "m+" : this.getMinutes(),
    "s+" : this.getSeconds(),
    "S"  : this.getMilliseconds()
  };   
  if(/(y+)/.test(fmt)){
	  fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
  }
  for(var k in o){
	  if(new RegExp("("+ k +")").test(fmt)) {
		  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
	  }
  }
  return fmt;   
}

$.fn.selectReadOnly=function(){
    var tem=$(this).children('option').index($("option:selected"));
    $(this).change(function(){
          $(this).children('option').eq(tem).attr("selected",true); 
    });
}

$.fn.hasScrollBar = function() {
    return this.get(0).scrollHeight > this.height();
}

function showValidUserNameAndPassword(callback){
	var finished = false;
	var username = null;
	var password = null;
	var container = $("<div></div>").appendTo($(document.body));
	var cf = null;
	cf = new CustomForm({
		container : container,
		title : "此操作需要验证，请输入您的用户名和密码",
		width : 360,
		open: function(event, ui){
			container.html("<table>" +
			"<tr class='control-group'><td class='control-label'><label for=\"vusername\">用户名：</label></td><td class='control-item'><input id='vusername' type='text' name='vusername'/></td></tr>" +
			"<tr class='control-group'><td class='control-label'><label for=\"vpassword\">密码：</label></td><td class='control-item'><input id='vpassword' type='password' name='vpassword'/></td></tr></table>");
		},
		successFunc : function(){
			var form = cf.getForm();
			username = form.find("#vusername").val();
			password = form.find("#vpassword").val();
			cf.destroy();
		},
		destroy : function(){
			finished = true;
		}
	});
	cf.show();
	
	var interval_val = null;
	interval_val = window.setInterval(function(){
		if(finished == true){
			container.remove();
			window.clearInterval(interval_val);
			if(typeof callback == "function"){
				callback.call(this, username,password);
			}
		}
	}, 200);
}

function fixTableHeader(table, conf){
	var tableWrapper = table.parent();
	table.fixedHeaderTable(conf);
	var head = tableWrapper.find(".fht-thead");
 	if(head.length > 0){
 		var wrapper = head.first().parent();
 		wrapper.layout({
 			north__resizable : false,
 			north__closable : false,
 			north__slidable : false,
 			north__size : wrapper.find(".fht-thead").height(),
 			north__paneSelector : ".fht-thead",
 			north__spacing_open : 0,
 			
 			south__resizable : false,
 			south__closable : false,
 			south__slidable : false,
 			south__size : wrapper.find(".fht-tfoot").height(),
 			south__paneSelector : ".fht-tfoot",
 			
 			center__paneSelector : ".fht-tbody",
 			
 			onresize_end : function(){
				table.fixedHeaderTable("resizeBody");
			}
 		});
 	}
	table.fixedHeaderTable('show', 1000);
}