function checkText(objId, objName, minLen, maxLen, reg){
	var obj = $("#"+objId).val();
	var span = objId+"Span";
	//console.info(span);
	var $span = $("#"+span);
	if(obj==null || obj.length==0){
		$span.html("<img src='images/ck/Error.gif' height='15px' width='15px'></img>" +
		"<font color='white'>数据项[" + objName + "]不能为空</font>");
		return false;
	}else if(obj.length < minLen || obj.length > maxLen){
		$span.html("<img src='images/ck/Error.gif' height='15px' width='15px'></img>" +
		"<font color='white'>数据项[" + objName + "]不合规范</font>");
		return false;
	}else if (!reg.test(obj)) {
		switch (objId) {
		case 'uname':
			$span.html("<img src='images/ck/Error.gif' height='15px' width='15px'></img>" +
			"<font color='white'>用户名必须由6-18位的字母数字下划线组成,并且以字母开头</font>");
			break;
		case 'password':
			$span.html("<img src='images/ck/Error.gif' height='15px' width='15px'></img>" +
			"<font color='white'>密码必须由6-15位的字母数字下划线组成</font>");
			break;
		case 'realname':
			$span.html("<img src='images/ck/Error.gif' height='15px' width='15px'></img>" +
			"<font color='white'>真实姓名必须由2-6个汉字组成</font>");
			break;
		case 'email':
			$span.html("<img src='images/ck/Error.gif' height='15px' width='15px'></img>" +
			"<font color='white'>邮箱格式不正确，请输入正确的邮箱</font>");
			break;
		case 'age':
			$span.html(
				"<img src='images/ck/Error.gif' height='15px' width='15px'></img>" +
				"<font color='white'>年龄不符合规范，年龄必须由2-3位的数字组成</font>");
			break;
		case 'securityCode':
			$span.html(
				"<img src='images/ck/Error.gif' height='15px' width='15px'></img>" +
				"<font color='red'>验证码输入格式错误[验证码只能为四位]</font>");
			break;
		case 'phone':
			$span.html(
				"<img src='images/ck/Error.gif' height='15px' width='15px'></img>" +
				"<font color='red'>电话格式输入不正确，必须为11位的数字</font>");
			break;
		case 'roomID':
			$span.html(
				"<img src='images/ck/Error.gif' height='15px' width='15px'></img>" +
				"<font color='red'>房间号格式输入错误，由2-3位数字或字母组成</font>");
			break;
		case 'identityNumber':
			$span.html(
				"<img src='images/ck/Error.gif' height='15px' width='15px'></img>" +
				"<font color='red'>身份证输入格式错误，由15-18位数字或字母组成</font>");
			break;
		}
		return false;
	} else {
		$span.html("<img src='images/ck/right.jpg' height='15px' width='15px'></img>");
		return true;
	}
}

function checkUname() {
	var unameReg = /^[a-zA-Z]\w{5,17}$/ig;
	return checkText("uname", "用户名", 6, 18, unameReg);
}

function checkPwd() {
	var pwdReg = /^\w{6,15}$/ig;
	return checkText("password", "密码", 6, 15, pwdReg) && checkRePwd();
}

function checkRePwd() {
	var pwd = $("#password").val();
	var repwd = $("#repwd").val();
	console.info(pwd);
	console.info(repwd);
	var $span = $("#repwdSpan");
	if (repwd == null || repwd.length == 0) {
		$span.html("<img src='images/ck/Error.gif' height='15px' width='15px'></img>" +
		"<font color='white'>[确认密码]不能为空</font>");
		return false;
	} else if (repwd != pwd) {
		$span.html("<img src='images/ck/Error.gif' height='15px' width='15px'></img>" +
		"<font color='white'>[密码]和[确认密码]不一致</font>");
		return false;
	} else {
		$span.html("<img src='images/ck/right.jpg' height='15px' width='15px'></img>");
		return true;
	}
}

function checkRealname() {
	var realnameReg = /^[\u4E00-\u9FA5]{2,6}$/ig;
	return checkText("realname", "真实姓名", 2, 6, realnameReg);
}
function checkPhone() {
	var phoneReg = /^1[3458]\d{9}$/ig;
	return checkText("phone", "电话", 11, 11, phoneReg);
}
function checkIdentityNumber() {
	var identityNumberReg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/ig;
	return checkText("identityNumber", "身份证", 15, 18, identityNumberReg);
}
function checkRoomID() {
	var roomIDReg = /^\w{2,3}$/ig;
	return checkText("roomID", "房间号", 2, 3, roomIDReg);
}

function checkAge() {
	var ageReg = /^[1-9]\d{1,2}$/ig;
	return checkText("age", "年龄", 2, 3, ageReg);
}


function checkEmail() {
	var emailReg = /^\w{4,20}@\w{2,10}(\.[a-zA-Z]{2,4}){1,2}$/ig;
	return checkText("email", "邮箱", 5, 30, emailReg);
}

function checkCode(){
	var codeReg =/^\w{4}$/ig;
	return checkText("securityCode","验证码",4,4,codeReg);
}


function checkForm() {
	var unameflag = checkUname();
	var pwdflag = checkPwd();
	var repwdflag = checkRePwd();
	var realnameflag = checkRealname();
	//var emailflag = checkEmail();
	//var ageflag = checkAge();

	//return unameflag && pwdflag && repwdflag && realnameflag && emailflag && ageflag;
	return unameflag && pwdflag && repwdflag && realnameflag;
}

function checkUpdate(){
	var unameflag = checkUname(); 
	var realnameflag = checkRealname();
	return unameflag && realnameflag;
}

function checkloginPwd() {
	var pwdReg = /^\w{6,15}$/ig;
	return checkText("password", "密码", 6, 15, pwdReg);
}


function ckLogin(){
	var unameflag = checkUname();
	
	var pwdflag = checkloginPwd();
	
	var codeflag = checkCode();
	
	return unameflag && pwdflag && codeflag;
}

function checkForm2(){
	var unameflag = checkRealname();
	var phoneflag = checkPhone();
	var identityNumflag = checkIdentityNumber();
	var roomIdflag = checkRoomID();
	var emailflag = checkEmail();
	return unameflag && phoneflag && identityNumflag && roomIdflag && emailflag;
}
