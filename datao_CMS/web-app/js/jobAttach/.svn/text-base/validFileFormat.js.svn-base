
//校验上传附件格式
function validFileFormat(value,name){
	  var start = value.lastIndexOf(".");
	  var format = value.substring(start+1).toUpperCase();
	  if(format!="TXT"&&format!="PDF"&&format!="DOC"&&format!="DOCX"&&format!="XLS"&&format!="XLSX"){
		  discovery_error1(name);
		  show_message1(name,"请上传txt, doc,docx, pdf, xls,xlsx格式的文件");
		  return false;
	  }
	  return true;
}
function discovery_error1(name){
	$("input[name='"+name+"']").parents("div .form-group").removeClass("has-success").removeClass("has-error").addClass("has-warning")
}

function show_message1(name,message){
	$("#"+$("input[name='"+name+"']").attr("aria-describedby")).removeClass("sr-only").addClass("help-block").text(message);
}