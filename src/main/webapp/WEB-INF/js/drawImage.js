function drawTriangle(){
	var canvas=document.getElementById("viewexitsonmenu");
	var ctx=canvas.getContext("2d");
	ctx.beginPath();
	ctx.moveTo(0, 2);
	ctx.lineTo(10, 2);
	ctx.lineTo(5, 10);
	ctx.fillStyle="gray";
	ctx.fill();
	ctx.closePath();
}