--	private String productId;  //상품 아이디
--	private String pname;  //상품명
--	private int unitPrice;  //상품 가격
--	private String description;  //상품 설명
--	private String manufacturer;  //제조사
--	private String category;  //분류
--	private long numberOfStock;  //재고 수
--	private String condition;  //신상품 or 중고품 or 재생품
--	private String filename;  //제품 이미지
--	private int quantity;  //장바구니에 담은 갯수

-- product 테이블 생성
drop table if exists product;
create table product(
	productId		varchar(10)		not null,
	pname			varchar(20),
	unitPrice		integer,
	description		varchar(200),
	manufacturer	varchar(20),
	category		varchar(20),
	numberOfStock	long,
	conditions		varchar(20),
	filename		varchar(200),
	primary key(productId)
)default charset=utf8mb4;

--	Product phone = new Product("P1234", "iPhone 12 Pro Max", 1490000);
--	phone.setDescription("6.7-inch, 2778*1284-pixel, OLED Super Retina XDR display, cameras");
--	phone.setCategory("Smart Phone");
--	phone.setManufacturer("Apple");
--	phone.setUnitPrice(1490000);
--	phone.setCondition("New");
--	phone.setNumberOfStock(7000);
--	phone.setFilename("iphone-12-pro-max-gold-hero.jpg");

insert into product values("P1234", "iPhone 12 Pro Max", 1490000,
"6.7-inch, 2778*1284-pixel, OLED Super Retina XDR display, cameras",
"Apple", "Smart Phone", 7000, "New", "iphone-12-pro-max-gold-hero.jpg");

--	Product notebook = new Product("P1235", "LG 울트라 기어", 1930000);
--	notebook.setDescription("15-inch, 1920*1080-pixel, IPS LED display, 10세대 인텔 코어 i7-10510U 프로세서");
--	notebook.setCategory("Notebook");
--	notebook.setManufacturer("LG");
--	notebook.setUnitPrice(1930000);
--	notebook.setCondition("Refurblished");
--	notebook.setNumberOfStock(5000);
--	notebook.setFilename("usp_0103.jpg");;

insert into product values("P1235", "LG 울트라 기어", 1930000,
"15-inch, 1920*1080-pixel, IPS LED display, 10세대 인텔 코어 i7-10510U 프로세서",
"LG", "Notebook", 5000, "Refurblished", "usp_0103.jpg");

--	Product tablet = new Product("P1236", "갤럭시 탭 S7+", 1149500);
--	tablet.setDescription("12-inch, 2800*1752-pixel, Super AMOLED display, Octa-Core 프로세서");
--	tablet.setCategory("Tablet");
--	tablet.setManufacturer("Samsung");
--	tablet.setUnitPrice(1149500);
--	tablet.setCondition("Old");
--	tablet.setNumberOfStock(3000);
--	tablet.setFilename("b008b623-6fe8-4191-82bd-d988db87e6e6.jpg");

insert into product values("P1236", "갤럭시 탭 S7+", 1149500,
"12-inch, 2800*1752-pixel, Super AMOLED display, Octa-Core 프로세서",
"Samsung", "Tablet", 3000, "Old", "b008b623-6fe8-4191-82bd-d988db87e6e6.jpg");

select * from product;








