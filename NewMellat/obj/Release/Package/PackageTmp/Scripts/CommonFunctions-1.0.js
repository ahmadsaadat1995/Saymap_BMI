Date.prototype.toISOString = function () {
//debugger;
    return this.getUTCFullYear()
      + '-' + pad(this.getUTCMonth() + 1, 2)
      + '-' + pad(this.getUTCDate(), 2)
      + 'T' + pad(this.getUTCHours(), 2)
      + ':' + pad(this.getUTCMinutes(), 2)
      + ':' + pad(this.getUTCSeconds(), 2)
      + '.' + String((this.getUTCMilliseconds() / 1000).toFixed(3)).slice(2, 5)
      + 'Z';

};
Date.prototype.toISODateString = function (h, m) {
//debugger;
    if (h == null)
        h = 0;
    if (m == null)
        m = 0
    return this.getUTCFullYear()
      + '-' + pad(this.getUTCMonth() + 1, 2)
      + '-' + pad(this.getUTCDate(), 2)
      + 'T' + pad(h,2)
      + ':' + pad(m, 2)
      + ':' + "00"
      + '.' + "000"
      + 'Z';

};
function getISODateString(y,m,d,h, min)
{
  if (h == null)
        h = 0;
    if (min == null)
        min = 0
    return y
      + '-' + pad(m, 2)
      + '-' + pad(d, 2)
      + 'T' + pad(h,2)
      + ':' + pad(min, 2)
      + ':' + "00"
      + '.' + "000"
      + 'Z';


}
function minutesBetween(first, second) {
    var one; 
    var two;
	
	if(first[first.length-1] == "Z")
	{
		var f = first.split('T')[0].split('-');
		
		var s = second.split('T')[0].split('-');
		
		var fTime = first.split('T')[1].split(':')
		var sTime = second.split('T')[1].split(':')
	    
	    one = new Date(Number(f[0]), Number(f[1]), Number(f[2]),Number(fTime[0]),Number(fTime[1]));
     
	    two = new Date(Number(s[0]), Number(s[1]), Number(s[2]),Number(sTime[0]),Number(sTime[1]));
		
	}
	else
{
    var f = new Date(first);
    var s = new Date(second);
    // Copy date parts of the timestamps, discarding the time parts.
    one = new Date(f.getFullYear(), f.getMonth(), f.getDate(),f.getHour(),f.getMinute());
     
    two = new Date(s.getFullYear(), s.getMonth(), s.getDate(),s.getHour(),s.getMinute());
}
    // Do the math.
    var millisecondsPerMinutes = 1000 * 60 ;
    var millisBetween = two.getTime() - one.getTime();
    var minutes = millisBetween / millisecondsPerMinutes;

    // Round down.
    return Math.floor(minutes);
}

function daysBetween(first, second) {
    var one; 
    var two;
	
	if(first[first.length-1] == "Z")
	{
		var f = first.split('T')[0].split('-');
		
		var s = second.split('T')[0].split('-');
	    one = new Date(Number(f[0]), Number(f[1]), Number(f[2]));
     
	    two = new Date(Number(s[0]), Number(s[1]), Number(s[2]));
		
	}
	else
{
    var f = new Date(first);
    var s = new Date(second);
    // Copy date parts of the timestamps, discarding the time parts.
    one = new Date(f.getFullYear(), f.getMonth(), f.getDate());
     
    two = new Date(s.getFullYear(), s.getMonth(), s.getDate());
}
    // Do the math.
    var millisecondsPerDay = 1000 * 60 * 60 * 24;
    var millisBetween = two.getTime() - one.getTime();
    var days = millisBetween / millisecondsPerDay;

    // Round down.
    return Math.floor(days);
}
function pad(val, len) {
    var strVal = val.toString();
    while (strVal.length < len) {
        strVal = "0" + strVal;
    }
    return strVal;

}

function gDateValue(pdate,h,m) {
    //debugger;
    var dateParts = pdate.split('/');

    var jd = $.calendars.newDate(Number(dateParts[0]), Number(dateParts[1]), Number(dateParts[2]), 'persian', 'fa');
    if(h == null)
    	return jd.toJSDate().toISODateString();
    return jd.toJSDate().toISODateString(h,m);
}
function pDateValue(gdate) {
   // debugger;
    var d = gdate.split('T')[0].split('-');
    var jd = $.calendars.instance('gregorian').newDate(Number(d[0]), Number(d[1]), Number(d[2])).toJD();
    var date = $.calendars.instance('persian').fromJD(jd);
    return date.formatYear() + "/" + date.month() + "/" + date.day() + " " + date.calendar().regionalOptions['fa'].dayNames[date.dayOfWeek()];
}

function pDateValueFull(gdate,offset) {

   if(gdate == null)
   return "";
    var d = gdate.split('T')[0].split('-');
    var t =gdate.split('T')[1].split(':');
    var h = Number(t[0]);
    var m = Number(t[1]);
    var jd = $.calendars.instance('gregorian').newDate(Number(d[0]), Number(d[1]), Number(d[2])).toJD();
    var date = $.calendars.instance('persian').fromJD(jd);
    if(offset != null)
    {
    	//debugger;
    	 var tMin = m+210;
    	 h += Math.floor(tMin/60);
    	 m = tMin%60;	
    }
    return date.formatYear() + "/" + pad(date.month(),2) + "/" + pad(date.day(),2)+ " "+pad(h,2)+ ":" +pad(m,2);
}


function pDateValueShort(gdate,offset) {
   // debugger;
   if(gdate == null)
   return "";
    var d = gdate.split('T')[0].split('-');
    var jd = $.calendars.instance('gregorian').newDate(Number(d[0]), Number(d[1]), Number(d[2])).toJD();
    var date = $.calendars.instance('persian').fromJD(jd);
    if(offset != null)
    date.add(offset,'d');
    return date.formatYear() + "/" + pad(date.month(),2) + "/" + pad(date.day(),2);
}

function loadQueryRequest(list, callback, query)
{
    var loadAction = function () {
        var clientContext = SP.ClientContext.get_current();
        var web = clientContext.get_web();
        var oList = web.get_lists().getById(list);


        var camlQuery = new SP.CamlQuery();
        camlQuery.set_viewXml(query);
         var collListItem = oList.getItems(camlQuery);

        clientContext.load(collListItem);

        clientContext.executeQueryAsync(function () {
            var listItemEnumerator = collListItem.getEnumerator();

            while (listItemEnumerator.moveNext()) {
                var oListItem = listItemEnumerator.get_current();
                callback(oListItem);
            }

        }, function () { });
    };
    SP.SOD.executeFunc('sp.js', 'SP.ClientContext', loadAction);
}
function loadRequest(url, callback,async) {
	if(async == null)
		async = true;
    $.ajax({
        url: url,
        type: "GET",
        async : async,
        headers: {
            "accept": "application/json;odata=verbose",
        },
        success: callback,
        error: function (error) {
            alert(JSON.stringify(error));
        }
    });

}
function loadRestRequest(url, callback) {
var async = true;
var res = null;
	if(callback == null)
	{
		async = false;
		callback = function(data){
			if(data.d != null)
				res =  data.d;
			else
				res  = data;
		}
	}
    $.ajax({
        url: url,
        type: "GET",
        async : async,
        headers: {
            "accept": "application/json;odata=verbose",
        },
        success: callback,
        error: function (error) {
            alert(JSON.stringify(error));
        }
    });
    return res;

}

function loadRestCamlRequest(url,camlQuery, callback) {
var async = true;
var res = null;
	if(callback == null)
	{
		async = false;
		callback = function(data){
			res =  data.d;
		}
	}
    $.ajax({
        url: url + '/GetItems(query=@v1)?@v1={"ViewXml":"'+ camlQuery  +'"}',
        type: "POST",
        async : async,
        headers: {
            "accept": "application/json;odata=verbose",
            "content-type": "application/json;odata=verbose",
            "X-RequestDigest": $("#__REQUESTDIGEST").val()
        },
        success: callback,
        error: function (error) {
            alert(JSON.stringify(error));
        }
    });
    return res;

}


function addNewItem(url, data, successCallback, errorCallback,async,absolute) {
	if(absolute == null)
		absolute = false
	if(async == null)
		async = true;
    if (successCallback == null)
        successCallback = function (data) {
            console.log(data);
        }
    if (errorCallback == null)
        errorCallback = function (error) {
            alert(JSON.stringify(error));
        }
    $.ajax({
        url: (absolute?"":_spPageContextInfo.webAbsoluteUrl) + url,
        type: "POST",
        async : async,
        headers: {
            "accept": "application/json;odata=verbose",
            "X-RequestDigest": $("#__REQUESTDIGEST").val(),
            "content-Type": "application/json;odata=verbose"
        },
        data: JSON.stringify(data),
        success: successCallback
        ,
        error: errorCallback
    }
    );
}
function updateItem(url, data, successCallback, errorCallback,async,absolute) {

	if(absolute == null)
		absolute = false;
	if(async == null)
		async = true;

    if (successCallback == null)
        successCallback = function (data) {
            console.log(data);
        }
    if(errorCallback == null)
        errorCallback = function (error) {
            alert(JSON.stringify(error));
        }
    $.ajax({
        url: (absolute?"":_spPageContextInfo.webAbsoluteUrl) + url,
        type: "POST",
        async : async,
        headers: {
            "accept": "application/json;odata=verbose",
            "X-RequestDigest": $("#__REQUESTDIGEST").val(),
            "content-Type": "application/json;odata=verbose",
            "X-HTTP-Method": "MERGE",
            "If-Match": "*"
        },
        data: JSON.stringify(data),
        success: successCallback,
        error: errorCallback
    });
}

function deleteItem(url,data,successCallback, errorCallback,async) {

	if(async == null)
		async = false;

 	 if (successCallback == null)
        successCallback = function (data) {
            console.log(data);
     }
    
 	 if(errorCallback == null)
        errorCallback = function (error) {
            alert(JSON.stringify(error));
     }
    $.ajax({
        url: _spPageContextInfo.webAbsoluteUrl + url,
        async:async,
        type: "POST",
        headers: {
			    "Accept": "application/json;odata=verbose",
                "X-Http-Method": "DELETE",
                "X-RequestDigest": $("#__REQUESTDIGEST").val(),
                "If-Match": "*"
                },
        success: successCallback,
        error: errorCallback
    });
}

function getQueryStringValue(qname) {
    var index = location.href.toLowerCase().indexOf(qname.toLowerCase() + '=')
    if (index> -1) {
    	index = index + qname.length +1;
        var val = location.href.substring(index);
        return val.split("&")[0];
    }
    return "";
}
function getCurrentRowId(tr)
{
    return tr.attr("iid").split(',')[1].split(',')[0];
}
function getValueFromRow(tr,colunmIndex)
{
   // debugger;
    return tr.find('.ms-vb2').eq(colunmIndex).text();
}
function getLookupIdFromRow(tr, colunmIndex) {
    return tr.find('.ms-vb2').eq(colunmIndex).find('a').attr('href').split('ID=')[1].split('&')[0];
}

function dialogOpener(url, title, dialogResultCallback, width, height) {
    if (url.length < 2)
        return;
    var Option = {
        url: url,
        allowMaximize : false
    };

    if (width != null)
        Option.width = width;
    if (height != null)
        Option.height = height;

    if (title != null)
        Option.title = title;
    if (dialogResultCallback != null)
        Option.dialogReturnValueCallback = dialogResultCallback;

    SP.SOD.execute('sp.ui.dialog.js', 'SP.UI.ModalDialog.showModalDialog', Option);
}
function getSearchQuery() {
    return "<View><Query>" + $('input[name$="HiddenFieldQuery"]').val() + "</Query></View>";
}
var validateReqFields = [];
function initValidation()
{
//debugger;
	var saveButton = $('input[name$="IOSaveItem"]');
	var saveScriptEval = saveButton.attr("onclick");
	saveButton.attr("onclick","");
	saveButton.click(function(){
		//debugger;
		if(checkAllValidation())
			eval( "function x(){"+saveScriptEval+"} x();");	
	});
	
}
function checkAllValidation()
{
	var ret = true;
	$.each(validateReqFields,function(index,item){
		var res = checkRequireValidation(item);
		if(!res)
		{	
			item.field.find('td.ms-formbody span.ms-formvalidation').remove();
			item.field.find('td.ms-formbody span:first').append('<span class="ms-formvalidation ms-csrformvalidation" ><span role="alert">'+(item.message == "" || item.message == null?"نمی‌توانید این را خالی بگذارید.":item.message)+   '<br></span></span>');
		}
		else
		{
			item.field.find('td.ms-formbody span.ms-formvalidation').remove();
		}
		ret = ret && res;
		
		
	});
	return ret;
}
function addRequireValidation(valItem)
{
	validateReqFields[validateReqFields.length] = valItem; 
	valItem.field.find('nobr').append("<span title=\"این یک فیلد الزامی است.\" class=\"ms-accentText\"> *</span>");
 
}
function checkRequireValidation(valItem)
{
	switch(valItem.field[0].FieldType)
	{
		case "SPFieldChoice":
		case "SPFieldText": 
			if(valItem.field.find('input').val() == "" || valItem.field.find('input').val() == null)
				return false;
			return true;
		case "SPFieldDateTime":
			if(valItem.field.find('input[id$="DateTimeFieldDate"]').val() == "" || valItem.field.find('input[id$="DateTimeFieldDate"]').val() == null)
				return false;
			return true;
		case "SPFieldLookup":
			if(valItem.field.find('select').val() == "" || valItem.field.find('select').val() == "0")
				return false;
			return true;
		case "SPFieldLookupFieldWithPickerMulti":
		case "SPFieldLookupFieldWithPicker":
			if(valItem.field.find('div[role="textbox"] span' ).length == 0 )
				return false;
			return true;
		case "SPFieldNote":
			if(valItem.field.find('textarea').val() == "" || valItem.field.find('textarea').val() == null)
				return false;
			return true;
		case "SPFieldBrandysoft.SharePoint.LookupPro.CascadedLookup":
						return true;
		
		
		
		
		

	}
	return true;
}
function overrideSave(callback)
{
	var saveEval = $('input[id$="diidIOSaveItem"]').attr('onclick');
	$('input[id$="diidIOSaveItem"]').attr('onclick','');
	$('input[id$="diidIOSaveItem"]').click(function(){
	//debugger;
		if(!checkAllValidation())
			return;
		if(!callback())
			return;
		eval("function x(){"+saveEval+"}x();");
		
	});
	

}
function overrideCancel(callback)
{
	var saveEval = $('input[id$="diidIOGoBack"]').attr('onclick');
	$('input[id$="diidIOSaveItem"]').attr('onclick','');
	$('input[id$="diidIOSaveItem"]').click(function(){
		if(!callback())
			return;
		eval("function x(){"+saveEval+"}x();");
		
	});
}
