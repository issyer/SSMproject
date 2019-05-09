/**
 * 
 */
/*  登录页面验证码的js*/
$(function(){
	var show_num = [];
	draw(show_num);

	$("#canvas").on('click',function(){
		draw(show_num);
	})
	$(".btn").on('click',function(){
		var val = $(".input-val").val().toLowerCase();
		var num = show_num.join("");
		var form = document.getElementById('test_form');
		if(val==''){
			alert('请输入验证码！');
		}else if(val == num){
			//alert('提交成功！');
			form.submit();
			$(".input-val").val('');
			draw(show_num);

		}else{
			alert('验证码错误！请重新输入！');
			$(".input-val").val('');
			draw(show_num);
		}
	})
})

function draw(show_num) {
	var canvas_width=$('#canvas').width();
	var canvas_height=$('#canvas').height();
	var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
	var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
	canvas.width = canvas_width;
	canvas.height = canvas_height;
	var sCode = "A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
	var aCode = sCode.split(",");
	var aLength = aCode.length;//获取到数组的长度
	
	for (var i = 0; i <= 3; i++) {
		var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
		var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
		var txt = aCode[j];//得到随机的一个内容
		show_num[i] = txt.toLowerCase();
		var x = 10 + i * 20;//文字在canvas上的x坐标
		var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
		context.font = "bold 23px 微软雅黑";

		context.translate(x, y);
		context.rotate(deg);

		context.fillStyle = randomColor();
		context.fillText(txt, 0, 0);

		context.rotate(-deg);
		context.translate(-x, -y);
	}
	for (var i = 0; i <= 5; i++) { //验证码上显示线条
		context.strokeStyle = randomColor();
		context.beginPath();
		context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
		context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
		context.stroke();
	}
	for (var i = 0; i <= 30; i++) { //验证码上显示小点
		context.strokeStyle = randomColor();
		context.beginPath();
		var x = Math.random() * canvas_width;
		var y = Math.random() * canvas_height;
		context.moveTo(x, y);
		context.lineTo(x + 1, y + 1);
		context.stroke();
	}
}

function randomColor() {//得到随机的颜色值
	var r = Math.floor(Math.random() * 256);
	var g = Math.floor(Math.random() * 256);
	var b = Math.floor(Math.random() * 256);
	return "rgb(" + r + "," + g + "," + b + ")";
}


/*  Main2选中框的js*/
function sltAll(field)
{
	    var ctrl= document.getElementById("head");
       var field = document.getElementsByName(field)
       //如果obj被选中，则全选
       if (ctrl.checked){
          //循环设置所有复选框为选中状态
          for(var i = 0; i < field.length; i++)
       	   field[i].checked = true;
       }else{//取消obj选中状态，则全不选
          //循环设置所有复选框为未选中状态
          for(var i = 0; i < field.length; i++)
       	   field[i].checked = false;
       }       
}


/*  Main1开门的js*/
function opendoor(){
    $.post("Open",{"id":"open"},function(data){
    	location.href="Main1.jsp";
         	 
       },"text"); 
	
}



/*  Main3的js*/
function change(phone){
	   $.post("GetUser",{"id":phone},function(data){
		location.href="Main3.jsp";
     	 
    },"text"); 
  
 }
 function pass(phone){
    $.post("GetPassUser",{"passid":phone},function(data){
 	location.href="Main3.jsp";
      	 
     },"text"); 
   
  }
 function unpass(phone){
	   $.post("GetUnPassUser",{"unpassid":phone},function(data){
		 location.href="Main3.jsp";
   	 
  },"text"); 

 }
 function wait(phone){
	   $.post("GetWaitUser",{"wait":phone},function(data){
		 location.href="Main3.jsp";
    	 
   },"text"); 
 
  }
 var rows = document.getElementsByTagName('tr');//取得行
 for(var i=0 ;i<rows.length; i++)
 {
     rows[i].onmouseover = function(){//鼠标移上去,添加一个类'hilite'
         this.className += 'hilite';
     }
     rows[i].onmouseout = function(){//鼠标移开,改变该类的名称
         this.className = this.className.replace('hilite','');
     }
 }




function showfiles() {
    flag = 'showfiles'
    window.open('showfiles.do','_blank');
};

function applyleave() {
    window.location.href="change.do?change=qingjia";
};

function resign() {
    window.location.href="change.do?change=resign";
};
function shownotices() {
    window.location.href="change.do?change=showtitle";
};

function changedesk() {
    window.location.href="change.do?change=deskchange";
};

function appeal() {
    window.location.href="change.do?change=appeal";
};

function changepassword() {
    window.location.href="change.do?change=passwordchange";
};

function shixi() {
    window.location.href="change.do?change=shixiapply";
};

function showprocess() {
    window.location.href="change.do?change=showprocesstitle";
};

function showpowermanage() {
    window.location.href="adminchange.do?change=powermanage";
};

function shownoticemanage() {
    window.location.href="adminchange.do?change=noticemanage";
};

function showprocessmanage() {
    window.location.href="adminchange.do?change=processmanage";
};