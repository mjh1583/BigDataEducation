function checkAddProduct() {
	
	/*addProduct에 설정한 id값을 통하여 getElementById()를 이용해서 가져옴*/
	var productId = document.getElementById("productId");
	var pname = document.getElementById("pname");
	var unitPrice = document.getElementById("unitPrice");
	var numberOfStock = document.getElementById("numberOfStock");
	
	/* check() 함수 : 정규표현식(regExp), 유효성 검사하는 부분(e), 오류 발생 시 알려줄 메세지(msg)
	   3개 매개변수를 활용하여 패턴이 맞는지 검증하는 내부 함수 */
	function check(regExp, e, msg) {
		if(regExp.test(e.value)) {
			return true;
		}
		
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	
	//상품 아이디(코드) 체크 부분
	if(!check(/^P[0-9]{4,11}$/, productId, "[상품 코드]\nP와 숫자를 조합하여 5에서 12자까지 입력하세요.\n" + 
	   "첫 글자는 반드시 P로 시작해주세요.")) {
		
		return false;  /* 체크가 안되면 더 이상 진행이 안되게 막는다. */
	}
	
	//상품명 길이 체크
	if(pname.value.length < 4 || pname.value.length > 12) {
		alert("[상품명]\n최소 4자에서 최대 12자까지 입력해주세요.");
		
		pname.select();
		pname.focus();
		return false;
	}
	
	//상품 가격 체크
	if(unitPrice.value.length == 0 || isNaN(unitPrice.value)) {
		alert("[상품가격]\n숫자만 입력해주세요.");
		
		unitPrice.select();
		unitPrice.focus();
		return false;
	}
	
	//상품 가격의 음수 여부 체크
	if(unitPrice.value < 0) {
		alert("[상품가격]\n음수를 입력할 수 없습니다.");
		
		unitPrice.select();
		unitPrice.focus();
		return false;
	}
	
	//재고 수 체크하는 부분
	if(numberOfStock.value.length == 0 || isNaN(numberOfStock.value)) {
		alert("[재고 수량]\n숫자만 입력해주세요.");
		
		numberOfStock.select();
		numberOfStock.focus();
		return false;
	}
	
	//재고 수의 음수여부 체크
	if(numberOfStock.value < 0) {
		alert("[재고 수량]\n음수를 입력할 수 없습니다.");
		
		numberOfStock.select();
		numberOfStock.focus();
		return false;
	}
	
	document.newProduct.submit();
} 











