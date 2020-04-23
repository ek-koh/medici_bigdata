itemDocs = []
for (i = 0; i < 26; i++) {
	itemDocs.push(
		{
			_id: i + 1,
			name: String.fromCharCode(65 + i),
			price: Math.floor(Math.random()*10)*1000 + 5000
		}
	)
}
db.items.insert(itemDocs)


lastDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
calendar = []
for (m = 0; m < 12; m++) {
  	for (i = 1; i <= lastDays[m]; i++) {
    	calendar.push(new Date(2019, m, i))
	}
}

orderDocs = []
for (i = 0; i < calendar.length; i++) {
		orderDocs.push(
			{
				date: calendar[i+1],
				order_items: []
			}
		)
	}
db.orders.insert(orderDocs)


/*
[ 문제 1]. 월별 매출 현황을 출력하십시오.
*/
db.q1.drop()
db.orders.aggregate(
	{$unwind: "$order_items"},
	{$project: {
		order_items: 1,
		month: {"$month": "$date"}
	}},
	{$group: {_id: "$month",
			  amount: {$sum: {"$multiply": ["$order_items.price", "$order_items.quantity"]}}}
	},
	{$sort: {_id: 1}},
	{$out: "q1"}
)
db.q1.find()


/*
[ 문제 2]. 분기별 매출현황을 출력하십시오.
*/
db.q2.drop()
db.q1.aggregate(
	{$project: {
		quarter: {
		   	$switch: {
		    	branches: [
		        	{case: {$lte: ["$_id", 3]}, then: "1Q"},
		        	{case: {$lte: ["$_id", 6]}, then: "2Q"},
		        	{case: {$lte: ["$_id", 9]}, then: "3Q"}
		      	],
		      	default: "4Q"
		   }
		}, 
		amount: 1,
		_id: 0
	}},
	{$group: {_id: "$quarter", 
			  amount: {$sum: "$amount"}}},
	{$sort: {_id: 1}},
	{$out: "q2"}
)
db.q2.find()


/*
[ 문제 3]. 주문 항목별 매출을 출력하십시오. (주문항목명을 함께 출력합니다.)
*/
db.q3.drop()
db.orders.aggregate(
	{$unwind: "$order_items"},
	{$project: {
		order_items: 1
	}},
	{$group: {_id: "$order_items.name",
			  amount: {$sum: {"$multiply": ["$order_items.price", "$order_items.quantity"]}}}
	},
	{$sort: {amount: -1}},
	{$out: "q3"}
)
db.q3.find()

/*
[ 문제 4]. 3번 문제에 이어 주문 항목별 매출 순위 Top 5를 출력하십시오.
*/
db.q4.drop()
db.q3.aggregate(
	{$limit: 5},
	{$out: "q4"}
)
db.q4.find()

/*
[ 문제 5]. 주문 항목별 판매건수를 출력하십시오. (주문항목명을 함께 출력합니다.)
*/
db.q5.drop()
db.orders.aggregate(
	{$unwind: "$order_items"},
	{$project: {
		order_items: 1
	}},
	{$group: {_id: "$order_items.name",
			  count: {$sum: "$order_items.quantity"}}
	},
	{$sort: {count: -1}},
	{$out: "q5"}
)
db.q5.find()