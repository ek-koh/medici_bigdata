db.orders.find().forEach(
	function(order) {
		cnt = Math.floor(Math.random()*5) + 1
		for(i = 0; i < cnt; i++) {
			item = db.items.findOne({_id: Math.floor(Math.random()*26) + 1})
			db.orders.update(
				{
					_id: order._id
				},
				{
					$addToSet: 
					{
						order_items: 
						{
							name: item.name,
							price: item.price, 
							quantity:Math.floor(Math.random()*3) + 1
						}
					}
				}
			)
		}
	}
)