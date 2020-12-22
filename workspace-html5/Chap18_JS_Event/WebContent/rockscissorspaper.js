/**
 * 
 */
/* 
	크로스 브라우징 고려해 구현 이벤트 리스너 등록함수
	el : 이벤트가 발생한 HTML 태그 요소
	ev : 이벤트
	handler : 이벤트 핸들러 함수
*/	

//함수 구현
function addListener(el, ev, handler) {
	//Chrome, FireFox 등등 웹 브라우저의 경우
	if(el.addEventListener) {
		//원하는 요소에 메서드로 함수에 등록하는 것
		//(이벤트명, 콜백함수로 이벤트가 발생하면 실행, 이벤트 전파 사용여부)
		el.addEventListener(ev, handler, false);
	}
	else { // IE 웹 브라우저의 경우
		el.attachEvent('on' + ev, handler);
	}
};

//함수 호출
addListener(window, 'load', init);
		
//load 이벤트 발생시 수행할 핸들러 함수임.
function init() {
	var gameElement = document.getElementById("game");	
	addListener(gameElement, 'click', playRockScissorsPaper);
};

//크로스 브라우징 고려해 구현
function getEventSource(evt) {
	if(evt.target) {
		return evt.target;
	}
	else {  // IE의 경우
		return window.event.srcElement;
	}
}

function Player(p) {
	if(!p) {
		p = 0;   //가위 바위 보 중 기본값 설정
	}
	
	this.point = p;
};

Player.prototype.toString = function() {
	switch(this.point) {
		case 0:
			return "가위";
		case 1:
			return "바위";
		case 2:
			return "보";
	}
};

function playRockScissorsPaper(evt) {
	var source = getEventSource(evt);
	
	var player = new Player();
	
	switch(source.id) {
		case 'btnScissors':
			player.point = 0;
			break;
		case 'btnRock':
			player.point = 1;
			break;
		case 'btnPaper':
			player.point = 2;
			break;
		default:
			return;
	}
	
	var computer = new Player(Math.floor(Math.random() * 3));
	
	var resultElement = document.getElementById("result");
	
	if(computer.point == player.point) {  //같은 걸 냈을때
		resultElement.innerHTML = "플레이어 : " + player + 
		" vs 컴퓨터 : " + computer + " => 비겼습니다!!!";
	}
	else {
		//서로 다른 걸 냈을 때
		/* 		0 + 1 = 1 (바위)			0   사용자 승
				1 + 1 = 2 (보)			1   사용자 승
				2 + 1 = 3 (가위)			2   사용자 승
		*/	
		//0, 1, 2 중 하나에 1을 더함 => 1~3 까지가 됨 => 3으로 나눈 나머지 값
		if( (player.point + 1) % 3 == computer.point) {
			resultElement.innerHTML = "플레이어 : " + player + 
		" vs 컴퓨터 : " + computer + " => 졌습니다!!!";
		}
		else {
			resultElement.innerHTML = "플레이어 : " + player + 
		" vs 컴퓨터 : " + computer + " => 이겼습니다!!!";
		}
		
		
		
	}
	
};






