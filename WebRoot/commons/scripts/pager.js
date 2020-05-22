
/**
 * Class Pager
 * @author kim
 * @version build 2006-11-01
 * @version build 2007-06-25 add en version
 * @version build 2008-03-10 add reg pattern to void input not integer value
 * @useage
 * 1.import this file
 * 2.coding as following...
 *   var pager = new Pager(document.forms[0], 692, 20, 3);
 *   pager.addHiddenInputs("id", "45");
 *   document.write(pager.toString());
 */
 
 /**
  * constructor
  * @param form a form object
  * @param recordCount record count
  * @param pageSize page size
  * @param currentPage current page
  * @param lang default is zh_CN
  */
function Pager(form, recordCount, pageSize, currentPage, lang) {
    this.form = form;
    this.recordCount = recordCount;
    this.pageSize = pageSize;
    this.currentPage = currentPage;
    this.lang = lang || "cn";
    this._hiddenInputNameAndValues = [];
}
/**
 * to buile a html hidden input element
 * @param name element name and id
 * @param value element value
 */
Pager.prototype.addHiddenInputs = function (name, value) {
	this._hiddenInputNameAndValues[this._hiddenInputNameAndValues.length] = new Array(name, value);
};

/**
 * go to a specific page
 * @param the page
 */
Pager.prototype.gotoPage = function(page) {
	this.form.requestPage.value = page;
	this.form.submit();
};

/**
 * pager string
 */
Pager.prototype.toString = function (){
	var pager = this;
	var pagerStrings = [];

	//BUG FIX:   kim at 2006/11/02 12:50	
	//IMPORTANT: Math.ceil return double in Java but return integer in Javascript
	//OLD CODE:   var pageCount = parseInt(Math.ceil((this.recordCount + this.pageSize - 1) / this.pageSize));
	var pageCount = Math.ceil(this.recordCount / this.pageSize);

	var previousPage = this.currentPage - 1;
	var firstPage = 1;
	var nextPage = this.currentPage + 1;
	var lastPage = pageCount;
	
	switch (this.lang) {
		case "cn":
			pagerStrings[pagerStrings.length] = '<div class="fenye"><p>共<a href="#" style="color: #abd3ff;">' + this.recordCount + '</a>条记录&nbsp;&nbsp;';
			pagerStrings[pagerStrings.length] = '每页显示<a href="#" style="color: #abd3ff;">' + this.pageSize + '</a>条&nbsp;&nbsp;&nbsp;';
			pagerStrings[pagerStrings.length] = '分<a href="#" style="color: #abd3ff;">' + pageCount + '</a>页&nbsp;&nbsp; ';
			if (this.currentPage == 1 || pageCount <= 1) {
				pagerStrings[pagerStrings.length] = '<a href="#" class="fenye-bg" style="line-height:18px;">首页</a><a href="#">上一页</a>';
			} else {
				pagerStrings[pagerStrings.length] = '<a href="#" class="fenye-bg" style="line-height:18px;" onclick="pager.gotoPage(1);">首页</a> <a href="#" onclick="pager.gotoPage(' + previousPage + ');">上一页</a>';
			}
			if (this.currentPage == pageCount || pageCount <= 1) {
				pagerStrings[pagerStrings.length] = '<a href="#"> 下一页</a>  <a href="#" class="fenye-bg" style="line-height:18px;">末页</a>';
			} else {
				pagerStrings[pagerStrings.length] = '<a href="#" onclick="pager.gotoPage(' + nextPage + ');">下一页</a> <a href="#" class="fenye-bg" style="line-height:18px;" onclick="pager.gotoPage(' + lastPage + ');">末页</a>';
			}
			pagerStrings[pagerStrings.length] = '<input  name="pager.requestPage" type="text" id="requestPage" size="4" maxlength="6" value="' + this.currentPage + '" onchange="this.value = isInteger(this.value) ? this.value : 1" /> ';
			pagerStrings[pagerStrings.length] = '<input style ="width: 45px;color:white" name="buttonsubmitPage" type="submit" class="fenye-btn" id="buttonsubmitPage" value="转到" onclick="this.form.requestPage.value = isInteger(this.form.requestPage.value) ? this.form.requestPage.value : 1" /></p></div>';
			break;
		default:
			pagerStrings[pagerStrings.length] = 'Total <span style="color:#FF0000"> ' + this.recordCount + ' </span> ';
			pagerStrings[pagerStrings.length] = 'Page <span style="color:#FF0000"> ' + pageCount + ' </span> of ';
			pagerStrings[pagerStrings.length] = '<span style="color:#FF0000"> ' + this.pageSize + ' </span> ';
			if (this.currentPage == 1 || pageCount <= 1) {
				pagerStrings[pagerStrings.length] = '<span style="color:#CCCCCC;"> [First Page] [Previous Page] </span>';
			} else {
				pagerStrings[pagerStrings.length] = '<span style="cursor:pointer;text-decoration: underline;" onclick="pager.gotoPage(1);"> [First Page] </span> <span style="cursor:pointer;text-decoration: underline;" onclick="pager.gotoPage(' + previousPage + ');"> [Previous Page] </span> ';
			}
			if (this.currentPage == pageCount || pageCount <= 1) {
				pagerStrings[pagerStrings.length] = '<span style="color:#CCCCCC;"> [Next Page] [Last Page] </span>';
			} else {
				pagerStrings[pagerStrings.length] = '<span style="cursor:pointer;text-decoration: underline;" onclick="pager.gotoPage(' + nextPage + ');"> [Next Page] </span> <span style="cursor:pointer;text-decoration: underline;" onclick="pager.gotoPage(' + lastPage + ');"> [Last Page] </span> ';
			}
			pagerStrings[pagerStrings.length] = ' <input style="text-align:center;border: 1px solid #CCCCCC;" name="pager.requestPage" type="text" id="requestPage" size="4" maxlength="6" value="' + this.currentPage + '" onchange="this.value = isInteger(this.value) ? this.value : 1" /> ';
			pagerStrings[pagerStrings.length] = '<input name="buttonsubmitPage" type="submit" id="buttonsubmitPage" value="go" onclick="this.form.requestPage.value = isInteger(this.form.requestPage.value) ? this.form.requestPage.value : 1" />';
			break;
	}
	var _hiddenInputStrings = [];
	for (var i = 0; i < this._hiddenInputNameAndValues.length; i++){
		_hiddenInputStrings[_hiddenInputStrings.length] = '<input name="' + this._hiddenInputNameAndValues[i][0] + '" type="hidden" id="' + this._hiddenInputNameAndValues[i][0] + '" value="' + this._hiddenInputNameAndValues[i][1] + '" />';
	}
	pagerStrings[pagerStrings.length] = _hiddenInputStrings.join("").toString();
	return pagerStrings.join("").toString();
};

function isInteger(value) {
	return /^[-\+]?\d+$/.test(value)
}

function checkAll(e) {
	for (var i = e.form.elements.length - 1; i > 0; i--) {
		if (e.form.elements[i].type == "checkbox" && e.form.elements[i].disabled == false) {
			e.form.elements[i].checked = e.checked;
		}
	}
}

function confirmDeleteAll(form) {
	var checkedCount = 0;
	if (!form.pks) {
		return;
	}
	if(!form.pks.length) {
		if (form.pks.checked == true) {
			checkedCount = 1;
		}
	}
	for (var i = 0; i < form.pks.length; i++) {
		if (form.pks[i].checked == true) {
			checkedCount++;
		}
	}
	if (checkedCount == 0) {
		alert("\u8bf7\u81f3\u5c11\u9009\u62e9\u4e00\u4e2a\u5220\u9664\u9879\uff01");
	} else {
		if(confirm("\u786e\u5b9a\u8981\u5220\u9664\u6240\u6709\u9009\u4e2d\u7684\u9879\u5417\uff1f")) {
			form.method.value = "delete";
			form.submit();
		}
	}
}

function confirmUpdateAll(form){
	var checkedCount = 0;
	if (!form.pks) {
		return;
	}
	if(!form.pks.length) {
		if (form.pks.checked == true) {
			checkedCount = 1;
		}
	}
	for (var i = 0; i < form.pks.length; i++) {
		if (form.pks[i].checked == true) {
			checkedCount++;
		}
	}
	if (checkedCount == 0) {
		alert("\u8BF7\u9009\u62E9\u81F3\u5C11\u4E00\u9879");
	} else {
		if(confirm("\u786E\u8BA4\u5BA1\u6838\u6240\u6709\u9009\u9879")) {
			form.method.value = "updateAll";
			form.submit();
		}
	}
}
function confirmAuditAll(form){
	var checkedCount = 0;
	if (!form.pks) {
		return;
	}
	if(!form.pks.length) {
		if (form.pks.checked == true) {
			checkedCount = 1;
		}
	}
	for (var i = 0; i < form.pks.length; i++) {
		if (form.pks[i].checked == true) {
			checkedCount++;
		}
	}
	if (checkedCount == 0) {
		alert("\u8BF7\u9009\u62E9\u81F3\u5C11\u4E00\u9879");
	} else {
		if(confirm("\u786E\u8BA4\u5BA1\u6838")) {
			form.method.value = "auditAll";
			form.submit();
		}
	}
}

function confirmDelete(msg, page, queryString) {
	msg  = msg  || "\u786e\u5b9a\u5220\u9664\u8fd9\u6761\u4fe1\u606f\u5417\uff1f";
	page = page || "?";
	page = page.indexOf("?") != -1 ? page : (page + "?");
	if(confirm(msg)){
		location.href = page + "method=delete&" + queryString;
		return true;
	}
	else{
		return false;
	}
}
function confirmUpdate(msg, page, queryString) {
	//msg  = msg  || "\u786e\u5b9a\u4fee\u6539\u8fd9\u6761\u4fe1\u606f\u5417\uff1f";
	page = page || "?";
	page = page.indexOf("?") != -1 ? page : (page + "?");
	location.href = page  + "method=edit&" + queryString;
}

function doNeedMethod(msg, page, method, queryString) {
	//msg  = msg  || "\u786e\u5b9a\u4fee\u6539\u8fd9\u6761\u4fe1\u606f\u5417\uff1f";
	page = page || "?";
	page = page.indexOf("?") != -1 ? page : (page + "?");
	location.href = page  + "method=" + method + "&" + queryString;
}

//-->