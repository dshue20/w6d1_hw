document.addEventListener("DOMContentLoaded", function(){
    const canvas = document.getElementById("mycanvas");
    canvas.width = 500;
    canvas.height = 500;
    ctx = canvas.getContext('2d');
    // rectangle
    ctx.fillStyle = 'blue';
    ctx.fillRect(50,50,50,100);
    // circle
    ctx.beginPath();
    ctx.arc(200, 200, 100, 0, 2 * Math.PI);
    ctx.lineWidth = 5;
    ctx.stroke();
    ctx.fillStyle = 'green';
    ctx.fill();
    // triangle
    ctx.beginPath();
    ctx.moveTo(400,400);
    ctx.lineTo(450,450);
    ctx.lineTo(350,450);
    ctx.fillStyle = 'red';
    ctx.fill();
});
