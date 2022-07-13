extends Control
var count: int = 0
var timer = 0
var clock: int = 0
var counter = 0
var multiplier = 1
var reset = 0
var requirement: int = 100000
var upgrade = 0
var upgrade2 = 0
var upgrade3 = 0
var upgrade4 = 0
var upgrade5 = 0
var upgrade6 = 0
var upgrade7 = 0
var upgrade8 = 0
var upgrade9 = 0
var upgrade10 = 0
var upgrade11 = 0
var upgrade12 = 0
var items = 0
var items2 = 0
var items3 = 0
var items4 = 0
var items5 = 0
var items6 = 0
var items7 = 0
var items8 = 0
var items9 = 0
var items10 = 0
var items11 = 0
var items12 = 0
var itemcounter: int = 1
var itemcounter2: int = 2
var itemcounter3: int = 5
var itemcounter4: int = 10
var itemcounter5: int = 25
var itemcounter6: int = 50
var itemcounter7: int = 150
var itemcounter8: int = 1000
var itemcounter9: int = 5000
var itemcounter10: int = 25000
var itemcounter11: int = 100000
var itemcounter12: int = 500000
var price: int = 100
var price2: int = 250
var price3: int = 1000
var price4: int = 2500
var price5: int = 10000
var price6: int = 25000
var price7: int = 100000
var price8: int = 1000000
var price9: int = 10000000
var price10: int = 100000000
var price11: int = 1000000000
var price12: int = 10000000000
var K = 1000
var M = 1000000
var B = 1000000000
var T = 1000000000000
var Q = 1000000000000000
var power = 1
var power_req : int = 3000
var power_lvl = 1
var x = 0
var close = 0
var data = {
	count = count,
	clock = clock,
	counter = counter,
	multiplier = multiplier,
	reset = reset,
	requirement = requirement,
	upgrade = upgrade,
	upgrade2 = upgrade2,
	upgrade3 = upgrade3,
	upgrade4 = upgrade4,
	upgrade5 = upgrade5,
	upgrade6 = upgrade6,
	upgrade7 = upgrade7,
	upgrade8 = upgrade8,
	upgrade9 = upgrade9,
	upgrade10 = upgrade10,
	upgrade11 = upgrade11,
	upgrade12 = upgrade12,
	items = items,
	items2 = items2,
	items3 = items3,
	items4 = items4,
	items5 = items5,
	items6 = items6,
	items7 = items7,
	items8 = items8,
	items9 = items9,
	items10 = items10,
	items11 = items11,
	items12 = items12,
	itemcounter = itemcounter,
	itemcounter2 = itemcounter2,
	itemcounter3 = itemcounter3,
	itemcounter4 = itemcounter4,
	itemcounter5 = itemcounter5,
	itemcounter6 = itemcounter6,
	itemcounter7 = itemcounter7,
	itemcounter8 = itemcounter8,
	itemcounter9 = itemcounter9,
	itemcounter10 = itemcounter10,
	itemcounter11 = itemcounter11,
	itemcounter12 = itemcounter12,
	price = price,
	price2 = price2,
	price3 = price3,
	price4 = price4,
	price5 = price5,
	price6 = price6,
	price7 = price7,
	price8 = price8,
	price9 = price9,
	price10 = price10,
	price11 = price11,
	price12 =  price12,
	power = power,
	power_req = power_req,
	power_lvl = power_lvl,
	close = close
	}
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	# Create a timer node
	timer = Timer.new()

	# Set timer interval
	timer.set_wait_time(1.0)

	# Set it as repeat
	timer.set_one_shot(false)

	# Connect its timeout signal to the function you want to repeat
	timer.connect("timeout", self, "_on_timer_timeout")

	# Add to the tree as child of the current node
	add_child(timer)
	
	timer.start()

	var file = File.new()
	if file.file_exists("user://save.txt"):
		file.open("user://save.txt", File.READ)
		data = parse_json(file.get_line())
		count = data.count
		clock = data.clock
		counter = data.counter
		multiplier = data.multiplier
		reset = data.reset
		requirement = data.requirement
		upgrade = data.upgrade
		upgrade2 = data.upgrade2
		upgrade3 = data.upgrade3
		upgrade4 = data.upgrade4
		upgrade5 = data.upgrade5
		upgrade6 = data.upgrade6
		upgrade7 = data.upgrade7
		upgrade8 = data.upgrade8
		upgrade9 = data.upgrade9
		upgrade10 = data.upgrade10
		upgrade11 = data.upgrade11
		upgrade12 = data.upgrade12
		items = data.items
		items2 = data.items2
		items3 = data.items3
		items4 = data.items4
		items5 = data.items5
		items6 = data.items6
		items7 = data.items7
		items8 = data.items8
		items9 = data.items9
		items10 = data.items10
		items11 = data.items11
		items12 = data.items12
		itemcounter = data.itemcounter
		itemcounter2 = data.itemcounter2
		itemcounter3 = data.itemcounter3
		itemcounter4 = data.itemcounter4
		itemcounter5 = data.itemcounter5
		itemcounter6 = data.itemcounter6
		itemcounter7 = data.itemcounter7
		itemcounter8 = data.itemcounter8
		itemcounter9 = data.itemcounter9
		itemcounter10 = data.itemcounter10
		itemcounter11 = data.itemcounter11
		itemcounter12 = data.itemcounter12
		price = data.price
		price2 = data.price2
		price3 = data.price3
		price4 = data.price4
		price5 = data.price5
		price6 = data.price6
		price7 = data.price7
		price8 = data.price8
		price9 = data.price9
		price10 = data.price10
		price11 = data.price11
		price12 =  data.price12
		power = data.power
		power_req = data.power_req
		power_lvl = data.power_lvl
		close = data.close

	if upgrade == 1:
		$buttons/music.set_text("Hummer")
		if multiplier >= 20000:
			$musiclabel.set_text(str(stepify(0.00005*multiplier,0.1)) + "M/sec - Cost: 10K")
		elif multiplier >= 20:
			$musiclabel.set_text(str(stepify(0.05*multiplier,0.1)) + "K/sec - Cost: 10K")
		elif multiplier < 20:
			$musiclabel.set_text(str(stepify(50*multiplier,0.1)) + "/sec - Cost: 10K")
		$buttons/music.set_disabled(true)
	if upgrade == 2:
		$buttons/music.set_text("Whistler")
		if multiplier >= 1000:
			$musiclabel.set_text(str(stepify(multiplier,0.1)) + "M/sec - Cost: 500K")
		elif multiplier < 1000:
			$musiclabel.set_text(str(stepify(multiplier,0.1)) + "K/sec - Cost: 500K")
		$buttons/music.set_disabled(true)
	if upgrade == 3:
		$buttons/music.set_text("Singer")
		if multiplier >= 400:
			$musiclabel.set_text(str(stepify(0.035*multiplier,0.1)) + "M/sec - Cost: 2.5B")
		elif multiplier < 400:
			$musiclabel.set_text(str(stepify(2.5*multiplier,0.1)) + "K/sec - Cost: 2.5B")
		$buttons/music.set_disabled(true)
	if upgrade == 4:
		$buttons/music.set_text("Musician")
		if multiplier >= 200:
			$musiclabel.set_text(str(stepify(0.035*multiplier,0.1)) + "M/sec - Cost: 10B")
		elif multiplier < 200:
			$musiclabel.set_text(str(stepify(5*multiplier,0.1)) + "K/sec - Cost: 10B")
		$buttons/music.set_disabled(true)
	if upgrade == 5:
		$buttons/music.set_text("Composer")
		$musiclabel.set_text("COMPLETED")
		$buttons/music.set_disabled(true)

	if upgrade2 == 1:
		$buttons/catering.set_text("Egg Breaker")
		if multiplier >= 1000/15:
			$cateringlabel.set_text(str(stepify(0.0015*multiplier,0.1)) + "K/sec - Cost: 6K")
		elif multiplier < 1000/15:
			$cateringlabel.set_text(str(stepify(15*multiplier,0.1)) + "/sec - Cost: 6K")
		$buttons/catering.set_disabled(true)
	if upgrade2 == 2:
		$buttons/catering.set_text("Caterer")
		if multiplier >= 100/3:
			$cateringlabel.set_text(str(stepify(0.03*multiplier,0.1)) + "K/sec - Cost: 22.5K")
		elif multiplier < 100/3:
			$cateringlabel.set_text(str(stepify(30*multiplier,0.1)) + "/sec - Cost: 22.5K")
		$buttons/catering.set_disabled(true)
	if upgrade2 == 3:
		$buttons/catering.set_text("Cook")
		if multiplier >= 5000:
			$cateringlabel.set_text(str(stepify(0.0002*multiplier,0.1)) + "M/sec - Cost: 300K")
		elif multiplier >= 5:
			$cateringlabel.set_text(str(stepify(0.2*multiplier,0.1)) + "K/sec - Cost: 300K")
		elif multiplier < 5:
			$cateringlabel.set_text(str(stepify(200*multiplier,0.1)) + "/sec - Cost: 300K")
		$buttons/catering.set_disabled(true)
	if upgrade2 == 4:
		$buttons/catering.set_text("Chef")
		if multiplier >= 1000/3:
			$cateringlabel.set_text(str(stepify(0.003*multiplier,0.1)) + "M/sec - Cost: 9M")
		elif multiplier < 1000/3:
			$cateringlabel.set_text(str(stepify(3*multiplier,0.1)) + "K/sec - Cost: 9M")
		$buttons/catering.set_disabled(true)
	if upgrade2 == 5:
		$buttons/catering.set_text("Master Chef")
		$cateringlabel.set_text("COMPLETED")
		$buttons/catering.set_disabled(true)

	if upgrade3 == 1:
		$buttons/computer.set_text("Dummy")
		if multiplier >= 125:
			$computerlabel.set_text(str(stepify(0.008*multiplier,0.1)) + "K/sec - Cost: 4.8K")
		elif multiplier < 125:
			$computerlabel.set_text(str(stepify(8*multiplier,0.1)) + "/sec - Cost: 4.8K")
		$buttons/computer.set_disabled(true)
	if upgrade3 == 2:
		$buttons/computer.set_text("User")
		if multiplier >= 1000/30:
			$computerlabel.set_text(str(stepify(0.03*multiplier,0.1)) + "K/sec - Cost: 36K")
		elif multiplier < 1000/30:
			$computerlabel.set_text(str(stepify(30*multiplier,0.1)) + "/sec - Cost: 36K")
		$buttons/computer.set_disabled(true)
	if upgrade3 == 3:
		$buttons/computer.set_text("Power User")
		if multiplier >= 500:
			$computerlabel.set_text(str(stepify(0.002*multiplier,0.1)) + "M/sec - Cost: 5M")
		elif multiplier < 500:
			$computerlabel.set_text(str(stepify(2*multiplier,0.1)) + "K/sec - Cost: 5M")
		$buttons/computer.set_disabled(true)
	if upgrade3 == 4:
		$buttons/computer.set_text("Computer Wizard")
		if multiplier >= 10000/75:
			$computerlabel.set_text(str(stepify(0.0075*multiplier,0.1)) + "M/sec - Cost: 37.5M")
		elif multiplier < 10000/75:
			$computerlabel.set_text(str(stepify(7.5*multiplier,0.1)) + "K/sec - Cost: 37.5M")
		$buttons/computer.set_disabled(true)
	if upgrade3 == 5:
		$buttons/computer.set_text("Hacker")
		$computerlabel.set_text("COMPLETED")
		$buttons/computer.set_disabled(true)

	if upgrade4 == 1:
		$buttons/sports.set_text("Gymnast")
		if multiplier >= 1000000/35:
			$sportslabel.set_text(str(stepify(0.000035*multiplier,0.1)) + "M/sec - Cost: 42K")
		elif multiplier >= 1000/35:
			$sportslabel.set_text(str(stepify(0.035*multiplier,0.1)) + "K/sec - Cost: 42K")
		elif multiplier < 1000/35:
			$sportslabel.set_text(str(stepify(35*multiplier,0.1)) + "/sec - Cost: 42K")
		$buttons/sports.set_disabled(true)
	if upgrade4 == 2:
		$buttons/sports.set_text("Athlete")
		if multiplier >= 1000/300:
			$sportslabel.set_text(str(stepify(0.003*multiplier,0.1)) + "K/sec - Cost: 750K")
		elif multiplier < 1000/300:
			$sportslabel.set_text(str(stepify(300*multiplier,0.1)) + "/sec - Cost: 750K")
		$buttons/sports.set_disabled(true)
	if upgrade4 == 3:
		$buttons/sports.set_text("Footballer")
		if multiplier >= 100000/75:
			$sportslabel.set_text(str(stepify(0.00075*multiplier,0.1)) + "M/sec - Cost: 3.75M")
		elif multiplier >= 1000/750:
			$sportslabel.set_text(str(stepify(0.75*multiplier,0.1)) + "K/sec - Cost: 3.75M")
		elif multiplier < 1000/750:
			$sportslabel.set_text(str(stepify(750*multiplier,0.1)) + "/sec - Cost: 3.75M")
		$buttons/sports.set_disabled(true)
	if upgrade4 == 4:
		$buttons/sports.set_text("Boxer")
		if multiplier >= 250:
			$sportslabel.set_text(str(stepify(0.004*multiplier,0.1)) + "M/sec - Cost: 40M")
		elif multiplier < 250:
			$sportslabel.set_text(str(stepify(4*multiplier,0.1)) + "K/sec - Cost: 40M")
		$buttons/sports.set_disabled(true)
	if upgrade4 == 5:
		$buttons/sports.set_text("Champion")
		$healthlabel.set_text("COMPLETED")
		$buttons/sports.set_disabled(true)

	if upgrade5 == 1:
		$buttons/science.set_text("Nerd")
		if multiplier >= 10000:
			$sciencelabel.set_text(str(stepify(0.0001*multiplier,0.1)) + "M/sec - Cost: 250K")
		elif multiplier >= 10:
			$sciencelabel.set_text(str(stepify(0.1*multiplier,0.1)) + "K/sec - Cost: 250K")
		elif multiplier < 10:
			$sciencelabel.set_text(str(stepify(100*multiplier,0.1)) + "/sec - Cost: 250K")
		$buttons/science.set_disabled(true)
	if upgrade5 == 2:
		$buttons/science.set_text("Inventor")
		if multiplier >= 10000/4:
			$sciencelabel.set_text(str(stepify(0.0004*multiplier,0.1)) + "M/sec - Cost: 2M")
		elif multiplier >= 1000/400:
			$sciencelabel.set_text(str(stepify(0.4*multiplier,0.1)) + "K/sec - Cost: 2M")
		elif multiplier < 1000/400:
			$sciencelabel.set_text(str(stepify(400*multiplier,0.1)) + "/sec - Cost: 2M")
		$buttons/science.set_disabled(true)
	if upgrade5 == 3:
		$buttons/science.set_text("Theorist")
		if multiplier >= 400:
			$sciencelabel.set_text(str(0.0025*multiplier) + "M/sec - Cost: 25M")
		elif multiplier < 400:
			$sciencelabel.set_text(str(2.5*multiplier) + "K/sec - Cost: 25M")
		$buttons/science.set_disabled(true)
	if upgrade5 == 4:
		$buttons/science.set_text("Mad Scientist")
		if multiplier >= 1000/9:
			$sciencelabel.set_text(str(0.009*multiplier) + "M/sec - Cost: 180M")
		elif multiplier < 1000/9:
			$sciencelabel.set_text(str(9*multiplier) + "K/sec - Cost: 180M")
		$buttons/science.set_disabled(true)
	if upgrade5 == 5:
		$buttons/science.set_text("Alchemist")
		$sciencelabel.set_text("COMPLETED")
		$buttons/science.set_disabled(true)

	if upgrade6 == 1:
		$buttons/health.set_text("Intern")
		if multiplier >= 100000/6:
			$healthlabel.set_text(str(stepify(0.00006*multiplier,0.1)) + "M/sec - Cost: 300K")
		elif multiplier >= 1000/60:
			$healthlabel.set_text(str(stepify(0.06*multiplier,0.1)) + "K/sec - Cost: 300K")
		elif multiplier < 1000/60:
			$healthlabel.set_text(str(stepify(60*multiplier,0.1)) + "/sec - Cost: 300K")
		$buttons/health.set_disabled(true)
	if upgrade6 == 2:
		$buttons/health.set_text("Assistant")
		if multiplier >= 10000:
			$healthlabel.set_text(str(stepify(0.0001*multiplier,0.1)) + "M/sec - Cost: 1M")
		elif multiplier >= 10:
			$healthlabel.set_text(str(stepify(0.1*multiplier,0.1)) + "K/sec - Cost: 1M")
		elif multiplier < 10:
			$healthlabel.set_text(str(stepify(100*multiplier,0.1)) + "/sec - Cost: 1M")
		$buttons/health.set_disabled(true)
	if upgrade6 == 3:
		$buttons/health.set_text("Nurse")
		if multiplier >= 4000:
			$healthlabel.set_text(str(stepify(0.00025*multiplier,0.1)) + "M/sec - Cost: 5M")
		elif multiplier >= 4:
			$healthlabel.set_text(str(stepify(0.25*multiplier,0.1)) + "K/sec - Cost: 5M")
		elif multiplier < 4:
			$healthlabel.set_text(str(stepify(250*multiplier,0.1)) + "/sec - Cost: 5M")
		$buttons/health.set_disabled(true)
	if upgrade6 == 4:
		$buttons/health.set_text("Practitioner")
		if multiplier >= 1000:
			$healthlabel.set_text(str(stepify(0.001*multiplier,0.1)) + "M/sec - Cost: 40M")
		elif multiplier < 1000:
			$healthlabel.set_text(str(stepify(multiplier,0.1)) + "K/sec - Cost: 40M")
		$buttons/health.set_disabled(true)
	if upgrade6 == 5:
		$buttons/health.set_text("Surgeon")
		$healthlabel.set_text("COMPLETED")
		$buttons/health.set_disabled(true)

	if upgrade7 == 1:
		$buttons/acting.set_text("Clown")
		if multiplier >= 1000000/65:
			$actinglabel.set_text(str(stepify(0.000035*multiplier,0.1)) + "M/sec - Cost: 780K")
		elif multiplier >= 1000/65:
			$actinglabel.set_text(str(stepify(0.065*multiplier,0.1)) + "K/sec - Cost: 780K")
		elif multiplier < 1000/65:
			$actinglabel.set_text(str(stepify(65*multiplier,0.1)) + "/sec - Cost: 780K")
		$buttons/acting.set_disabled(true)
	if upgrade7 == 2:
		$buttons/acting.set_text("Actor")
		if multiplier >= 10000/8:
			$actinglabel.set_text(str(stepify(0.0008*multiplier,0.1)) + "M/sec - Cost: 20M")
		elif multiplier >= 1000/800:
			$actinglabel.set_text(str(stepify(0.8*multiplier,0.1)) + "K/sec - Cost: 20M")
		elif multiplier < 1000/800:
			$actinglabel.set_text(str(stepify(800*multiplier,0.1)) + "/sec - Cost: 20M")
		$buttons/acting.set_disabled(true)
	if upgrade7 == 3:
		$buttons/acting.set_text("Starring")
		if multiplier >= 10000/25:
			$actinglabel.set_text(str(stepify(0.0025*multiplier,0.1)) + "M/sec - Cost: 125M")
		elif multiplier < 10000/25:
			$actinglabel.set_text(str(stepify(2.5*multiplier,0.1)) + "K/sec - Cost: 125M")
		$buttons/acting.set_disabled(true)
	if upgrade7 == 4:
		$buttons/acting.set_text("Director")
		if multiplier >= 1000/7:
			$actinglabel.set_text(str(stepify(0.007*multiplier,0.1)) + "M/sec - Cost: 700M")
		elif multiplier < 1000/7:
			$actinglabel.set_text(str(stepify(7*multiplier,0.1)) + "K/sec - Cost: 700M")
		$buttons/acting.set_disabled(true)
	if upgrade7 == 5:
		$buttons/acting.set_text("Producer")
		$actinglabel.set_text("COMPLETED")
		$buttons/acting.set_disabled(true)

	if upgrade8 == 1:
		$buttons/killing.set_text("Amateur")
		if multiplier >= 100000/15:
			$killinglabel.set_text(str(stepify(0.00015*multiplier,0.1)) + "M/sec - Cost: 3.75M")
		elif multiplier >= 1000/150:
			$killinglabel.set_text(str(stepify(0.15*multiplier,0.1)) + "K/sec - Cost: 3.75M")
		elif multiplier < 1000/150:
			$killinglabel.set_text(str(stepify(150*multiplier,0.1)) + "/sec - Cost: 3.75M")
		$buttons/killing.set_disabled(true)
	if upgrade8 == 2:
		$buttons/killing.set_text("Sniper")
		if multiplier >= 10000/4:
			$killinglabel.set_text(str(stepify(0.0004*multiplier,0.1)) + "M/sec - Cost: 40M")
		elif multiplier >= 1000/400:
			$killinglabel.set_text(str(stepify(0.4*multiplier,0.1)) + "K/sec - Cost: 40M")
		elif multiplier < 1000/400:
			$killinglabel.set_text(str(stepify(400*multiplier,0.1)) + "/sec - Cost: 40M")
		$killinglabel.set_text("400/sec - Cost: 20M")
		$buttons/killing.set_disabled(true)
	if upgrade8 == 3:
		$buttons/killing.set_text("Assassin")
		if multiplier >= 10000/7:
			$killinglabel.set_text(str(stepify(0.0007*multiplier,0.1)) + "M/sec - Cost: 70M")
		elif multiplier >= 1000/700:
			$killinglabel.set_text(str(stepify(0.7*multiplier,0.1)) + "K/sec - Cost: 70M")
		elif multiplier < 1000/700:
			$killinglabel.set_text(str(stepify(700*multiplier,0.1)) + "/sec - Cost: 70M")
		$buttons/killing.set_disabled(true)
	if upgrade8 == 4:
		$buttons/killing.set_text("Ninja")
		if multiplier >= 1000/7:
			$killinglabel.set_text(str(stepify(0.007*multiplier,0.1)) + "M/sec - Cost: 1.4B")
		elif multiplier < 1000/7:
			$killinglabel.set_text(str(stepify(7*multiplier,0.1)) + "K/sec - Cost: 1.4B")
		$buttons/killing.set_disabled(true)
	if upgrade8 == 5:
		$buttons/killing.set_text("The Professional")
		$killinglabel.set_text("COMPLETED")
		$buttons/killing.set_disabled(true)

	if upgrade9 == 1:
		$buttons/business.set_text("Worker")
		if multiplier >= 1000/30:
			$businesslabel.set_text(str(stepify(0.03*multiplier,0.1)) + "K/sec - Cost: 1.5M")
		elif multiplier < 1000/30:
			$businesslabel.set_text(str(stepify(30*multiplier,0.1)) + "/sec - Cost: 1.5M")
		$buttons/business.set_disabled(true)
	if upgrade9 == 2:
		$buttons/business.set_text("Manager")
		if multiplier >= 10000/7:
			$businesslabel.set_text(str(stepify(0.0007*multiplier,0.1)) + "M/sec - Cost: 70M")
		elif multiplier >= 1000/700:
			$businesslabel.set_text(str(stepify(0.7*multiplier,0.1)) + "K/sec - Cost: 70M")
		elif multiplier < 1000/700:
			$businesslabel.set_text(str(stepify(700*multiplier,0.1)) + "/sec - Cost: 70M")
		$buttons/business.set_disabled(true)
	if upgrade9 == 3:
		$buttons/business.set_text("Vice President")
		if multiplier >= 1000/3:
			$businesslabel.set_text(str(stepify(0.003*multiplier,0.1)) + "M/sec - Cost: 600M")
		elif multiplier < 1000/3:
			$businesslabel.set_text(str(stepify(3*multiplier,0.1)) + "K/sec - Cost: 600M")
		$buttons/business.set_disabled(true)
	if upgrade9 == 4:
		$buttons/business.set_text("CEO")
		if multiplier >= 1000/8:
			$businesslabel.set_text(str(stepify(0.008*multiplier,0.1)) + "M/sec - Cost: 3.2B")
		elif multiplier < 1000/8:
			$businesslabel.set_text(str(stepify(8*multiplier,0.1)) + "K/sec - Cost: 3.2B")
		$buttons/business.set_disabled(true)
	if upgrade9 == 5:
		$buttons/business.set_text("Founder")
		$businesslabel.set_text("COMPLETED")
		$buttons/business.set_disabled(true)

	if upgrade10 == 1:
		$buttons/legal.set_text("Clerk")
		if multiplier >= 1000/90:
			$legallabel.set_text(str(stepify(0.09*multiplier,0.1)) + "K/sec - Cost: 9M")
		elif multiplier < 1000/90:
			$legallabel.set_text(str(stepify(90*multiplier,0.1)) + "/sec - Cost: 9M")
		$buttons/legal.set_disabled(true)
	if upgrade10 == 2:
		$buttons/legal.set_text("Paralegal")
		if multiplier >= 10000/2:
			$legallabel.set_text(str(stepify(0.0002*multiplier,0.1)) + "M/sec - Cost: 40M")
		elif multiplier >= 1000/200:
			$legallabel.set_text(str(stepify(0.2*multiplier,0.1)) + "K/sec - Cost: 40M")
		elif multiplier < 1000/200:
			$legallabel.set_text(str(stepify(200*multiplier,0.1)) + "/sec - Cost: 40M")
		$buttons/legal.set_disabled(true)
	if upgrade10 == 3:
		$buttons/legal.set_text("Attorney")
		if multiplier >= 10000/4:
			$legallabel.set_text(str(stepify(0.0004*multiplier,0.1)) + "M/sec - Cost: 160M")
		elif multiplier >= 1000/400:
			$legallabel.set_text(str(stepify(0.4*multiplier,0.1)) + "K/sec - Cost: 160M")
		elif multiplier < 1000/400:
			$legallabel.set_text(str(stepify(400*multiplier,0.1)) + "/sec - Cost: 160M")
		$buttons/legal.set_disabled(true)
	if upgrade10 == 4:
		$buttons/legal.set_text("Prosecutor")
		if multiplier >= 10000/9:
			$legallabel.set_text(str(stepify(0.0009*multiplier,0.1)) + "M/sec - Cost: 720M")
		elif multiplier >= 1000/900:
			$legallabel.set_text(str(stepify(0.9*multiplier,0.1)) + "K/sec - Cost: 720M")
		elif multiplier < 1000/900:
			$legallabel.set_text(str(stepify(900*multiplier,0.1)) + "/sec - Cost: 720M")
		$buttons/legal.set_disabled(true)
	if upgrade10 == 5:
		$buttons/legal.set_text("Arbitrator")
		$legallabel.set_text("COMPLETED")
		$buttons/legal.set_disabled(true)

	if upgrade11 == 1:
		$buttons/military.set_text("Private")
		if multiplier >= 100000/8:
			$militarylabel.set_text(str(stepify(0.00008*multiplier,0.1)) + "M/sec - Cost: 16M")
		elif multiplier >= 1000/80:
			$militarylabel.set_text(str(stepify(0.08*multiplier,0.1)) + "K/sec - Cost: 16M")
		elif multiplier < 1000/80:
			$militarylabel.set_text(str(stepify(80*multiplier,0.1)) + "/sec - Cost: 16M")
		$buttons/military.set_disabled(true)
	if upgrade11 == 2:
		$buttons/military.set_text("Sergeant")
		if multiplier >= 10000/4:
			$militarylabel.set_text(str(stepify(0.0004*multiplier,0.1)) + "M/sec - Cost: 160M")
		elif multiplier >= 1000/400:
			$militarylabel.set_text(str(stepify(0.4*multiplier,0.1)) + "K/sec - Cost: 160M")
		elif multiplier < 1000/400:
			$militarylabel.set_text(str(stepify(400*multiplier,0.1)) + "/sec - Cost: 160M")
		$buttons/military.set_disabled(true)
	if upgrade11 == 3:
		$buttons/military.set_text("Lieutenant")
		if multiplier >= 1000000/35:
			$militarylabel.set_text(str(stepify(0.000035*multiplier,0.1)) + "M/sec - Cost: 1.2B")
		elif multiplier >= 1000/35:
			$militarylabel.set_text(str(stepify(0.035*multiplier,0.1)) + "K/sec - Cost: 1.2B")
		elif multiplier < 1000/35:
			$militarylabel.set_text(str(stepify(35*multiplier,0.1)) + "K/sec - Cost: 1.2B")
		$buttons/military.set_disabled(true)
	if upgrade11 == 4:
		$buttons/military.set_text("Colonel")
		if multiplier >= 1000/4.5:
			$militarylabel.set_text(str(stepify(0.0045*multiplier,0.1)) + "M/sec - Cost: 6.75B")
		elif multiplier < 1000/4.5:
			$militarylabel.set_text(str(stepify(4.5*multiplier,0.1)) + "K/sec - Cost: 6.75B")
		$buttons/military.set_disabled(true)
	if upgrade11 == 5:
		$buttons/military.set_text("General")
		$militarylabel.set_text("COMPLETED")
		$buttons/military.set_disabled(true)

	if upgrade12 == 1:
		$buttons/politics.set_text("Candidate")
		if multiplier >= 1000000/175:
			$politicslabel.set_text(str(stepify(0.000175*multiplier,0.1)) + "M/sec - Cost: 87.5M")
		elif multiplier >= 1000/175:
			$politicslabel.set_text(str(stepify(0.175*multiplier,0.1)) + "K/sec - Cost: 87.5M")
		elif multiplier < 1000/175:
			$politicslabel.set_text(str(stepify(175*multiplier,0.1)) + "/sec - Cost: 87.5M")
		$buttons/politics.set_disabled(true)
	if upgrade12 == 2:
		$buttons/politics.set_text("Mayor")
		if multiplier >= 1000000/475:
			$politicslabel.set_text(str(stepify(0.000475*multiplier,0.1)) + "M/sec - Cost: 475M")
		elif multiplier >= 1000/475:
			$politicslabel.set_text(str(stepify(0.475*multiplier,0.1)) + "K/sec - Cost: 475M")
		elif multiplier < 1000/475:
			$politicslabel.set_text(str(stepify(475*multiplier,0.1)) + "/sec - Cost: 475M")
		$buttons/politics.set_disabled(true)
	if upgrade12 == 3:
		$buttons/politics.set_text("Minister")
		if multiplier >= 1000/4.5:
			$politicslabel.set_text(str(stepify(0.0045*multiplier,0.1)) + "M/sec - Cost: 9B")
		elif multiplier < 1000/4.5:
			$politicslabel.set_text(str(stepify(4.5*multiplier,0.1)) + "K/sec - Cost: 9B")
		$buttons/politics.set_disabled(true)
	if upgrade12 == 4:
		$buttons/politics.set_text("President")
		if multiplier >= 1000/8.5:
			$politicslabel.set_text(str(stepify(0.0085*multiplier,0.1)) + "M/sec - Cost: 25B")
		elif multiplier < 1000/8.5:
			$politicslabel.set_text(str(stepify(8.5*multiplier,0.1)) + "K/sec - Cost: 25B")
		$buttons/politics.set_disabled(true)
	if upgrade12 == 5:
		$buttons/politics.set_text("King")
		$politicslabel.set_text("COMPLETED")
		$buttons/politics.set_disabled(true)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_add_pressed():
	count += power*multiplier
	if count < 1000:
		$quantity.set_text("Wealth: " + str(count))
	if count >= 1000:
		$quantity.set_text("Wealth: " + str(stepify(count/1000,0.1)) + "K")
	if count >= 1000000:
		$quantity.set_text("Wealth: " + str(stepify(count/1000000,0.1)) + "M")
	if count >= 1000000000:
		$quantity.set_text("Wealth: " + str(stepify(count/1000000000,0.1)) + "B")
	if count >= 1000000000000:
		$quantity.set_text("Wealth: " + str(stepify(count/1000000000000,0.1)) + "T")
	if count >= 1000000000000000:
		$quantity.set_text("Wealth: " + str(stepify(count/1000000000000000,0.1)) + "Q")

	if count >= power_req:
		$buttons/power.set_disabled(false)
	else:
		$buttons/power.set_disabled(true)

func _on_power_pressed():
	if count >= power_req:
		count -= power_req
		power += 1
		power_lvl += 1
		power_req *= 1.2
		$powerlabel.set_text("Current\nLevel: " + str(power_lvl) + "\nPower: " + str(stepify(power*multiplier,0.1)) + "\n\nNext\nLevel: " + str(power_lvl+1) + "\nNext Power: " + str(stepify((power+1)*multiplier,0.1)) + "\nCost: " + str(power_req))

func _on_timer_timeout():
	count += counter*multiplier
	$income.set_text("Income: " + str(stepify(counter*multiplier,0.01)) + "/sec")
	if count < 1000:
		$quantity.set_text("Wealth: " + str(int(count)))
	if count >= 1000:
		$quantity.set_text("Wealth: " + str(stepify(count/1000,0.1)) + "K")
	if count >= 1000000:
		$quantity.set_text("Wealth: " + str(stepify(count/1000000,0.1)) + "M")
	if count >= 1000000000:
		$quantity.set_text("Wealth: " + str(stepify(count/1000000000,0.1)) + "B")
	if count >= 1000000000000:
		$quantity.set_text("Wealth: " + str(stepify(count/1000000000000,0.1)) + "T")
	if count >= 1000000000000000:
		$quantity.set_text("Wealth: " + str(stepify(count/1000000000000000,0.1)) + "Q")
	
	if count >= power_req:
		$buttons/power.set_disabled(false)
	else:
		$buttons/power.set_disabled(true)
		
	if count > 999*Q or multiplier > 25000:
		if close == 0:
			$congrats.set_visible(true)

	$powerlabel.set_text("Current\nLevel: " + str(power_lvl) + "\nPower: " + str(stepify(power*multiplier,0.1)) + "\n\nNext\nLevel: " + str(power_lvl+1) + "\nNext Power: " + str(stepify((power+1)*multiplier,0.1)) + "\nCost: " + str(power_req))

	data.count = count
	data.clock = clock
	data.counter = counter
	data.multiplier = multiplier
	data.reset = reset
	data.requirement = requirement
	data.upgrade = upgrade
	data.upgrade2 = upgrade2
	data.upgrade3 = upgrade3
	data.upgrade4 = upgrade4
	data.upgrade5 = upgrade5
	data.upgrade6 = upgrade6
	data.upgrade7 = upgrade7
	data.upgrade8 = upgrade8
	data.upgrade9 = upgrade9
	data.upgrade10 = upgrade10
	data.upgrade11 = upgrade11
	data.upgrade12 = upgrade12
	data.items = items
	data.items2 = items2
	data.items3 = items3
	data.items4 = items4
	data.items5 = items5
	data.items6 = items6
	data.items7 = items7
	data.items8 = items8
	data.items9 = items9
	data.items10 = items10
	data.items11 = items11
	data.items12 = items12
	data.itemcounter = itemcounter
	data.itemcounter2 = itemcounter2
	data.itemcounter3 = itemcounter3
	data.itemcounter4 = itemcounter4
	data.itemcounter5 = itemcounter5
	data.itemcounter6 = itemcounter6
	data.itemcounter7 = itemcounter7
	data.itemcounter8 = itemcounter8
	data.itemcounter9 = itemcounter9
	data.itemcounter10 = itemcounter10
	data.itemcounter11 = itemcounter11
	data.itemcounter12 = itemcounter12
	data.price = price
	data.price2 = price2
	data.price3 = price3
	data.price4 = price4
	data.price5 = price5
	data.price6 = price6
	data.price7 = price7
	data.price8 = price8
	data.price9 = price9
	data.price10 = price10
	data.price11 = price11
	data.price12 = price12
	data.power = power
	data.power_req = power_req
	data.power_lvl = power_lvl
	data.close = close
	var file = File.new()
	file.open("user://save.txt", File.WRITE)
	file.store_line(to_json(data))
	file.close()

	if requirement >= 1000000000000:
		$resetlabel.set_text("Multiplier: " + str(stepify(multiplier,0.1)) + "\nRequriement: " + str(requirement/T) + "T")
	elif requirement >= 1000000:
		$resetlabel.set_text("Multiplier: " + str(stepify(multiplier,0.1)) + "\nRequriement: " + str(requirement/M) + "M")
	else:
		$resetlabel.set_text("Multiplier: " + str(stepify(multiplier,0.1)) + "\nRequriement: " + str(requirement))

	$owned.set_text("Owned: " + str(items))
	$owned2.set_text("Owned: " + str(items2))
	$owned3.set_text("Owned: " + str(items3))
	$owned4.set_text("Owned: " + str(items4))
	$owned5.set_text("Owned: " + str(items5))
	$owned6.set_text("Owned: " + str(items6))
	$owned7.set_text("Owned: " + str(items7))
	$owned8.set_text("Owned: " + str(items8))
	$owned9.set_text("Owned: " + str(items9))
	$owned10.set_text("Owned: " + str(items10))
	$owned11.set_text("Owned: " + str(items11))
	$owned12.set_text("Owned: " + str(items12))
	
	if price < K:
		$itemlabel.set_text(str(stepify(1*multiplier,0.1)) + "/sec - Cost: " + str(price))
	if price >= K:
		$itemlabel.set_text(str(stepify(1*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price/K,0.1)) + "K")
	if price >= M:
		$itemlabel.set_text(str(stepify(1*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price/M,0.1)) + "M")
	if price >= B:
		$itemlabel.set_text(str(stepify(1*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price/B,0.1)) + "B")
	if price >= T:
		$itemlabel.set_text(str(stepify(1*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price/T,0.1)) + "T")
	if price >= Q:
		$itemlabel.set_text(str(stepify(1*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price/Q,0.1)) + "Q")

	if price2 < K:
		$itemlabel2.set_text(str(stepify(2*multiplier,0.1)) + "/sec - Cost: " + str(price2))
	if price2 >= K:
		$itemlabel2.set_text(str(stepify(2*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price2/K,0.1)) + "K")
	if price2 >= M:
		$itemlabel2.set_text(str(stepify(2*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price2/M,0.1)) + "M")
	if price2 >= B:
		$itemlabel2.set_text(str(stepify(2*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price2/B,0.1)) + "B")
	if price2 >= T:
		$itemlabel2.set_text(str(stepify(2*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price2/T,0.1)) + "T")
	if price2 >= Q:
		$itemlabel2.set_text(str(stepify(2*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price2/Q,0.1)) + "Q")

	if price3 < K:
		$itemlabel3.set_text(str(stepify(4*multiplier,0.1)) + "/sec - Cost: " + str(price3))
	if price3 >= K:
		$itemlabel3.set_text(str(stepify(4*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price3/K,0.1)) + "K")
	if price3 >= M:
		$itemlabel3.set_text(str(stepify(4*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price3/M,0.1)) + "M")
	if price3 >= B:
		$itemlabel3.set_text(str(stepify(4*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price3/B,0.1)) + "B")
	if price3 >= T:
		$itemlabel3.set_text(str(stepify(4*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price3/T,0.1)) + "T")
	if price3 >= Q:
		$itemlabel3.set_text(str(stepify(4*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price3/Q,0.1)) + "Q")

	if price4 < K:
		$itemlabel4.set_text(str(stepify(7*multiplier,0.1)) + "/sec - Cost: " + str(price4))
	if price4 >= K:
		$itemlabel4.set_text(str(stepify(7*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price4/K,0.1)) + "K")
	if price4 >= M:
		$itemlabel4.set_text(str(stepify(7*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price4/M,0.1)) + "M")
	if price4 >= B:
		$itemlabel4.set_text(str(stepify(7*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price4/B,0.1)) + "B")
	if price4 >= T:
		$itemlabel4.set_text(str(stepify(7*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price4/T,0.1)) + "T")
	if price4 >= Q:
		$itemlabel4.set_text(str(stepify(7*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price4/Q,0.1)) + "Q")

	if price5 < K:
		$itemlabel5.set_text(str(stepify(10*multiplier,0.1)) + "/sec - Cost: " + str(price5))
	if price5 >= K:
		$itemlabel5.set_text(str(stepify(10*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price5/K,0.1)) + "K")
	if price5 >= M:
		$itemlabel5.set_text(str(stepify(10*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price5/M,0.1)) + "M")
	if price5 >= B:
		$itemlabel5.set_text(str(stepify(10*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price5/B,0.1)) + "B")
	if price5 >= Q:
		$itemlabel5.set_text(str(stepify(10*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price5/Q,0.1)) + "Q")

	if price6 < K:
		$itemlabel6.set_text(str(stepify(20*multiplier,0.1)) + "/sec - Cost: " + str(price6))
	if price6 >= K:
		$itemlabel6.set_text(str(stepify(20*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price6/K,0.1)) + "K")
	if price6 >= M:
		$itemlabel6.set_text(str(stepify(20*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price6/M,0.1)) + "M")
	if price6 >= B:
		$itemlabel6.set_text(str(stepify(20*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price6/B,0.1)) + "B")
	if price6 >= T:
		$itemlabel6.set_text(str(stepify(20*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price6/T,0.1)) + "T")
	if price6 >= Q:
		$itemlabel6.set_text(str(stepify(20*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price6/Q,0.1)) + "Q")

	if price7 < K:
		$itemlabel7.set_text(str(stepify(50*multiplier,0.1)) + "/sec - Cost: " + str(price7))
	if price7 >= K:
		$itemlabel7.set_text(str(stepify(50*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price7/K,0.1)) + "K")
	if price7 >= M:
		$itemlabel7.set_text(str(stepify(50*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price7/M,0.1)) + "M")
	if price7 >= B:
		$itemlabel7.set_text(str(stepify(50*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price7/B,0.1)) + "B")
	if price7 >= T:
		$itemlabel7.set_text(str(stepify(50*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price7/T,0.1)) + "T")
	if price7 >= Q:
		$itemlabel7.set_text(str(stepify(50*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price7/Q,0.1)) + "Q")

	if price8 < K:
		$itemlabel8.set_text(str(stepify(250*multiplier,0.1)) + "/sec - Cost: " + str(price8))
	if price8 >= K:
		$itemlabel8.set_text(str(stepify(250*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price8/K,0.1)) + "K")
	if price8 >= M:
		$itemlabel8.set_text(str(stepify(250*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price8/M,0.1)) + "M")
	if price8 >= B:
		$itemlabel8.set_text(str(stepify(250*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price8/B,0.1)) + "B")
	if price8 >= T:
		$itemlabel8.set_text(str(stepify(250*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price8/T,0.1)) + "T")
	if price8 >= Q:
		$itemlabel8.set_text(str(stepify(250*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price8/Q,0.1)) + "Q")

	if price9 < K:
		$itemlabel9.set_text(str(stepify(multiplier,0.1)) + "K/sec - Cost: " + str(price9))
	if price9 >= K:
		$itemlabel9.set_text(str(stepify(multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price9/K,0.1)) + "K")
	if price9 >= M:
		$itemlabel9.set_text(str(stepify(multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price9/M,0.1)) + "M")
	if price9 >= B:
		$itemlabel9.set_text(str(stepify(multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price9/B,0.1)) + "B")
	if price9 >= T:
		$itemlabel9.set_text(str(stepify(multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price9/T,0.1)) + "T")
	if price9 >= Q:
		$itemlabel9.set_text(str(stepify(multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price9/Q,0.1)) + "Q")

	if price10 < B:
		if multiplier < 200000:
			$itemlabel10.set_text(str(stepify(5*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price10/M,0.1)) + "M")
		else:
			$itemlabel10.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price10/M,0.1)) + "M")
	if price10 >= B:
		if multiplier < 200000:
			$itemlabel10.set_text(str(stepify(5*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price10/B,0.1)) + "B")
		else:
			$itemlabel10.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price10/B,0.1)) + "B")
	if price10 >= T:
		if multiplier < 200000:
			$itemlabel10.set_text(str(stepify(5*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price10/T,0.1)) + "T")
		else:
			$itemlabel10.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price10/T,0.1)) + "T")
	if price10 >= Q:
		if multiplier < 200000:
			$itemlabel10.set_text(str(stepify(5*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price10/Q,0.1)) + "Q")
		else:
			$itemlabel10.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price10/Q,0.1)) + "Q")

	if price11 < T:
		if multiplier < 50000:
			$itemlabel11.set_text(str(stepify(20*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price11/B,0.1)) + "B")
		else:
			$itemlabel11.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price11/B,0.1)) + "B")
	if price11 >= T:
		if multiplier < 50000:
			$itemlabel11.set_text(str(stepify(20*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price11/T,0.1)) + "T")
		else:
			$itemlabel11.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price11/T,0.1)) + "T")
	if price11 >= Q:
		if multiplier < 50000:
			$itemlabel11.set_text(str(stepify(20*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price11/Q,0.1)) + "Q")
		else:
			$itemlabel11.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price11/Q,0.1)) + "Q")

	if price12 < T:
		if multiplier < 10000:
			$itemlabel12.set_text(str(stepify(100*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price12/B,0.1)) + "B")
		else:
			$itemlabel12.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price12/B,0.1)) + "B")
	if price12 >= T:
		if multiplier < 10000:
			$itemlabel12.set_text(str(stepify(100*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price12/T,0.1)) + "T")
		else:
			$itemlabel12.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price12/T,0.1)) + "T")
	if price12 >= Q:
		if multiplier < 10000:
			$itemlabel12.set_text(str(stepify(100*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price12/Q,0.1)) + "Q")
		else:
			$itemlabel12.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price12/Q,0.1)) + "Q")

	clock += 1
	if clock < 60:
		$time.set_text("Time: " + str(clock) + "s")
	elif 3600 > clock:
		$time.set_text("Time: " + str(int(clock/60)) + "m " + str(clock%60) + "s" )
	elif 86400 > clock:
		$time.set_text("Time: " + str(int(clock/3600)) + "h " + str(int((clock%3600)/60)) + "m " + str(clock%60) + "s ")
	elif clock >= 86400:
		$time.set_text("Time: " + str(int(clock/86400)) + "D " + str(int(clock%86400)/3600) + "h " + str(int((clock%3600)/60)) + "m " + str(clock%60) + "s ")

	if count >= requirement:
		$buttons/reset.set_disabled(false)
	else:
		$buttons/reset.set_disabled(true)

	if upgrade == 0:
		if count >= 100:
			$buttons/music.set_disabled(false)
		else:
			$buttons/music.set_disabled(true)
	if upgrade == 1:
		if count >= 10000:
			$buttons/music.set_disabled(false)
		else:
			$buttons/music.set_disabled(true)
	if upgrade == 2:
		if count >= 500*K:
			$buttons/music.set_disabled(false)
		else:
			$buttons/music.set_disabled(true)
	if upgrade == 3:
		if count >= 2500*M:
			$buttons/music.set_disabled(false)
		else:
			$buttons/music.set_disabled(true)
	if upgrade == 4:
		if count >= 10*B:
			$buttons/music.set_disabled(false)
		else:
			$buttons/music.set_disabled(true)

	if upgrade2 == 0:
		if count >= 400:
			$buttons/catering.set_disabled(false)
		else:
			$buttons/catering.set_disabled(true)
	if upgrade2 == 1:
		if count >= 6000:
			$buttons/catering.set_disabled(false)
		else:
			$buttons/catering.set_disabled(true)
	if upgrade2 == 2:
		if count >= 22500:
			$buttons/catering.set_disabled(false)
		else:
			$buttons/catering.set_disabled(true)
	if upgrade2 == 3:
		if count >= 300*K:
			$buttons/catering.set_disabled(false)
		else:
			$buttons/catering.set_disabled(true)
	if upgrade2 == 4:
		if count >= 9*M:
			$buttons/catering.set_disabled(false)
		else:
			$buttons/catering.set_disabled(true)

	if upgrade3 == 0:
		if count >= 900:
			$buttons/computer.set_disabled(false)
		else:
			$buttons/computer.set_disabled(true)
	if upgrade3 == 1:
		if count >= 4800:
			$buttons/computer.set_disabled(false)
		else:
			$buttons/computer.set_disabled(true)
	if upgrade3 == 2:
		if count >= 36*K:
			$buttons/computer.set_disabled(false)
		else:
			$buttons/computer.set_disabled(true)
	if upgrade3 == 3:
		if count >= 5*M:
			$buttons/computer.set_disabled(false)
		else:
			$buttons/computer.set_disabled(true)
	if upgrade3 == 4:
		if count >= 37.5*M:
			$buttons/computer.set_disabled(false)
		else:
			$buttons/computer.set_disabled(true)

	if upgrade4 == 0:
		if count >= 3*K:
			$buttons/sports.set_disabled(false)
		else:
			$buttons/sports.set_disabled(true)
	if upgrade4 == 1:
		if count >= 42*K:
			$buttons/sports.set_disabled(false)
		else:
			$buttons/sports.set_disabled(true)
	if upgrade4 == 2:
		if count >= 750*K:
			$buttons/sports.set_disabled(false)
		else:
			$buttons/sports.set_disabled(true)
	if upgrade4 == 3:
		if count >= 3.75*M:
			$buttons/sports.set_disabled(false)
		else:
			$buttons/sports.set_disabled(true)
	if upgrade4 == 4:
		if count >= 40*M:
			$buttons/sports.set_disabled(false)
		else:
			$buttons/sports.set_disabled(true)

	if upgrade5 == 0:
		if count >= 8.4*K:
			$buttons/science.set_disabled(false)
		else:
			$buttons/science.set_disabled(true)
	if upgrade5 == 1:
		if count >= 250*K:
			$buttons/science.set_disabled(false)
		else:
			$buttons/science.set_disabled(true)
	if upgrade5 == 2:
		if count >= 2*M:
			$buttons/science.set_disabled(false)
		else:
			$buttons/science.set_disabled(true)
	if upgrade5 == 3:
		if count >= 25*M:
			$buttons/science.set_disabled(false)
		else:
			$buttons/science.set_disabled(true)
	if upgrade5 == 4:
		if count >= 180*M:
			$buttons/science.set_disabled(false)
		else:
			$buttons/science.set_disabled(true)

	if upgrade6 == 0:
		if count >= 25*K:
			$buttons/health.set_disabled(false)
		else:
			$buttons/health.set_disabled(true)
	if upgrade6 == 1:
		if count >= 300*K:
			$buttons/health.set_disabled(false)
		else:
			$buttons/health.set_disabled(true)
	if upgrade6 == 2:
		if count >= 1*M:
			$buttons/health.set_disabled(false)
		else:
			$buttons/health.set_disabled(true)
	if upgrade6 == 3:
		if count >= 5*M:
			$buttons/health.set_disabled(false)
		else:
			$buttons/health.set_disabled(true)
	if upgrade6 == 4:
		if count >= 40*M:
			$buttons/health.set_disabled(false)
		else:
			$buttons/health.set_disabled(true)

	if upgrade7 == 0:
		if count >= 90*K:
			$buttons/acting.set_disabled(false)
		else:
			$buttons/acting.set_disabled(true)
	if upgrade7 == 1:
		if count >= 780*K:
			$buttons/acting.set_disabled(false)
		else:
			$buttons/acting.set_disabled(true)
	if upgrade7 == 2:
		if count >= 20*M:
			$buttons/acting.set_disabled(false)
		else:
			$buttons/acting.set_disabled(true)
	if upgrade7 == 3:
		if count >= 125*M:
			$buttons/acting.set_disabled(false)
		else:
			$buttons/acting.set_disabled(true)
	if upgrade7 == 4:
		if count >= 700*M:
			$buttons/acting.set_disabled(false)
		else:
			$buttons/acting.set_disabled(true)

	if upgrade8 == 0:
		if count >= 250*K:
			$buttons/killing.set_disabled(false)
		else:
			$buttons/killing.set_disabled(true)
	if upgrade8 == 1:
		if count >= 3.75*M:
			$buttons/killing.set_disabled(false)
		else:
			$buttons/killing.set_disabled(true)
	if upgrade8 == 2:
		if count >= 20*M:
			$buttons/killing.set_disabled(false)
		else:
			$buttons/killing.set_disabled(true)
	if upgrade8 == 3:
		if count >= 70*M:
			$buttons/killing.set_disabled(false)
		else:
			$buttons/killing.set_disabled(true)
	if upgrade8 == 4:
		if count >= 1.4*B:
			$buttons/killing.set_disabled(false)
		else:
			$buttons/killing.set_disabled(true)

	if upgrade9 == 0:
		if count >= 625*K:
			$buttons/business.set_disabled(false)
		else:
			$buttons/business.set_disabled(true)
	if upgrade9 == 1:
		if count >= 1.5*M:
			$buttons/business.set_disabled(false)
		else:
			$buttons/business.set_disabled(true)
	if upgrade9 == 2:
		if count >= 70*M:
			$buttons/business.set_disabled(false)
		else:
			$buttons/business.set_disabled(true)
	if upgrade9 == 3:
		if count >= 600*M:
			$buttons/business.set_disabled(false)
		else:
			$buttons/business.set_disabled(true)
	if upgrade9 == 4:
		if count >= 3.2*B:
			$buttons/business.set_disabled(false)
		else:
			$buttons/business.set_disabled(true)

	if upgrade10 == 0:
		if count >= 1.5*M:
			$buttons/legal.set_disabled(false)
		else:
			$buttons/legal.set_disabled(true)
	if upgrade10 == 1:
		if count >= 9*M:
			$buttons/legal.set_disabled(false)
		else:
			$buttons/legal.set_disabled(true)
	if upgrade10 == 2:
		if count >= 40*M:
			$buttons/legal.set_disabled(false)
		else:
			$buttons/legal.set_disabled(true)
	if upgrade10 == 3:
		if count >= 160*M:
			$buttons/legal.set_disabled(false)
		else:
			$buttons/legal.set_disabled(true)
	if upgrade10 == 4:
		if count >= 720*M:
			$buttons/legal.set_disabled(false)
		else:
			$buttons/legal.set_disabled(true)

	if upgrade11 == 0:
		if count >= 4*M:
			$buttons/military.set_disabled(false)
		else:
			$buttons/military.set_disabled(true)
	if upgrade11 == 1:
		if count >= 16*M:
			$buttons/military.set_disabled(false)
		else:
			$buttons/military.set_disabled(true)
	if upgrade11 == 2:
		if count >= 160*M:
			$buttons/military.set_disabled(false)
		else:
			$buttons/military.set_disabled(true)
	if upgrade11 == 3:
		if count >= 1.2*B:
			$buttons/military.set_disabled(false)
		else:
			$buttons/military.set_disabled(true)
	if upgrade11 == 4:
		if count >= 6.75*B:
			$buttons/military.set_disabled(false)
		else:
			$buttons/military.set_disabled(true)

	if upgrade12 == 0:
		if count >= 12.5*M:
			$buttons/politics.set_disabled(false)
		else:
			$buttons/politics.set_disabled(true)
	if upgrade12 == 1:
		if count >= 87.5*M:
			$buttons/politics.set_disabled(false)
		else:
			$buttons/politics.set_disabled(true)
	if upgrade12 == 2:
		if count >= 475*M:
			$buttons/politics.set_disabled(false)
		else:
			$buttons/politics.set_disabled(true)
	if upgrade12 == 3:
		if count >= 9*B:
			$buttons/politics.set_disabled(false)
		else:
			$buttons/politics.set_disabled(true)
	if upgrade12 == 4:
		if count >= 25*B:
			$buttons/politics.set_disabled(false)
		else:
			$buttons/politics.set_disabled(true)

	if count >= price:
		if upgrade > 0:
			$buttons/item.set_disabled(false)
	else:
			$buttons/item.set_disabled(true)
	if count >= price2:
		if upgrade2 > 0:
			$buttons/item2.set_disabled(false)
	else:
			$buttons/item2.set_disabled(true)
	if count >= price3:
		if upgrade3 > 0:
			$buttons/item3.set_disabled(false)
	else:
			$buttons/item3.set_disabled(true)
	if count >= price4:
		if upgrade4 > 0:
			$buttons/item4.set_disabled(false)
	else:
			$buttons/item4.set_disabled(true)
	if count >= price5:
		if upgrade5 > 0:
			$buttons/item5.set_disabled(false)
	else:
			$buttons/item5.set_disabled(true)
	if count >= price6:
		if upgrade6 > 0:
			$buttons/item6.set_disabled(false)
	else:
			$buttons/item6.set_disabled(true)
	if count >= price7:
		if upgrade7 > 0:
			$buttons/item7.set_disabled(false)
	else:
			$buttons/item7.set_disabled(true)
	if count >= price8:
		if upgrade8 > 0:
			$buttons/item8.set_disabled(false)
	else:
			$buttons/item8.set_disabled(true)
	if count >= price9:
		if upgrade9 > 0:
			$buttons/item9.set_disabled(false)
	else:
			$buttons/item9.set_disabled(true)
	if count >= price10:
		if upgrade10 > 0:
			$buttons/item10.set_disabled(false)
	else:
			$buttons/item10.set_disabled(true)
	if count >= price11:
		if upgrade11 > 0:
			$buttons/item11.set_disabled(false)
	else:
			$buttons/item11.set_disabled(true)
	if count >= price12:
		if upgrade12 > 0:
			$buttons/item12.set_disabled(false)
	else:
			$buttons/item12.set_disabled(true)

	if $buttons/music.get_text() == "Hummer":
		upgrade = 1
	if $buttons/music.get_text() == "Whistler":
		upgrade = 2
	if $buttons/music.get_text() == "Singer":
		upgrade = 3
	if $buttons/music.get_text() == "Musician":
		upgrade = 4
	if $buttons/music.get_text() == "Composer":
		upgrade = 5
	if $buttons/catering.get_text() == "Egg Breaker":
		upgrade2 = 1
	if $buttons/catering.get_text() == "Caterer":
		upgrade2 = 2
	if $buttons/catering.get_text() == "Cook":
		upgrade2 = 3
	if $buttons/catering.get_text() == "Chef":
		upgrade2 = 4
	if $buttons/catering.get_text() == "Master Chef":
		upgrade2 = 5
	if $buttons/computer.get_text() == "Dummy":
		upgrade3 = 1
	if $buttons/computer.get_text() == "User":
		upgrade3 = 2
	if $buttons/computer.get_text() == "Power User":
		upgrade3 = 3
	if $buttons/computer.get_text() == "Computer Wizard":
		upgrade3 = 4
	if $buttons/computer.get_text() == "Hacker":
		upgrade3 = 5
	if $buttons/sports.get_text() == "Gymnast":
		upgrade4 = 1
	if $buttons/sports.get_text() == "Athlete":
		upgrade4 = 2
	if $buttons/sports.get_text() == "Footballer":
		upgrade4 = 3
	if $buttons/sports.get_text() == "Boxer":
		upgrade4 = 4
	if $buttons/sports.get_text() == "Champion":
		upgrade4 = 5
	if $buttons/science.get_text() == "Nerd":
		upgrade5 = 1
	if $buttons/science.get_text() == "Inventor":
		upgrade5 = 2
	if $buttons/science.get_text() == "Theorist":
		upgrade5 = 3
	if $buttons/science.get_text() == "Mad Scientist":
		upgrade5 = 4
	if $buttons/science.get_text() == "Alchemist":
		upgrade5 = 5
	if $buttons/health.get_text() == "Intern":
		upgrade6 = 1
	if $buttons/health.get_text() == "Assistant":
		upgrade6 = 2
	if $buttons/health.get_text() == "Nurse":
		upgrade6 = 3
	if $buttons/health.get_text() == "Practitioner":
		upgrade6 = 4
	if $buttons/health.get_text() == "Surgeon":
		upgrade6 = 5
	if $buttons/acting.get_text() == "Clown":
		upgrade7 = 1
	if $buttons/acting.get_text() == "Actor":
		upgrade7 = 2
	if $buttons/acting.get_text() == "Starring":
		upgrade7 = 3
	if $buttons/acting.get_text() == "Director":
		upgrade7 = 4
	if $buttons/acting.get_text() == "Producer":
		upgrade7 = 5
	if $buttons/killing.get_text() == "Amateur":
		upgrade8 = 1
	if $buttons/killing.get_text() == "Sniper":
		upgrade8 = 2
	if $buttons/killing.get_text() == "Assassin":
		upgrade8 = 3
	if $buttons/killing.get_text() == "Ninja":
		upgrade8 = 4
	if $buttons/killing.get_text() == "The Professional":
		upgrade8 = 5
	if $buttons/business.get_text() == "Worker":
		upgrade9 = 1
	if $buttons/business.get_text() == "Manager":
		upgrade9 = 2
	if $buttons/business.get_text() == "Vice President":
		upgrade9 = 3
	if $buttons/business.get_text() == "CEO":
		upgrade9 = 4
	if $buttons/business.get_text() == "Founder":
		upgrade9 = 5
	if $buttons/legal.get_text() == "Clerk":
		upgrade10 = 1
	if $buttons/legal.get_text() == "Paralegal":
		upgrade10 = 2
	if $buttons/legal.get_text() == "Attorney":
		upgrade10 = 3
	if $buttons/legal.get_text() == "Prosecutor":
		upgrade10 = 4
	if $buttons/legal.get_text() == "Arbitrator":
		upgrade10 = 5
	if $buttons/military.get_text() == "Private":
		upgrade11 = 1
	if $buttons/military.get_text() == "Sergeant":
		upgrade11 = 2
	if $buttons/military.get_text() == "Lieutenant":
		upgrade11 = 3
	if $buttons/military.get_text() == "Colonel":
		upgrade11 = 4
	if $buttons/military.get_text() == "General":
		upgrade11 = 5
	if $buttons/politics.get_text() == "Candidate":
		upgrade12 = 1
	if $buttons/politics.get_text() == "Mayor":
		upgrade12 = 2
	if $buttons/politics.get_text() == "Minister":
		upgrade12 = 3
	if $buttons/politics.get_text() == "President":
		upgrade12 = 4
	if $buttons/politics.get_text() == "King":
		upgrade12 = 5

func _on_music_pressed():
	if upgrade == 0:
		if count >= 100:
			count -= 100
			counter += 1
			$buttons/music.set_text("Hummer")
			if multiplier >= 20000:
				$musiclabel.set_text(str(stepify(0.00005*multiplier,0.1)) + "M/sec - Cost: 10K")
			elif multiplier >= 20:
				$musiclabel.set_text(str(stepify(0.05*multiplier,0.1)) + "K/sec - Cost: 10K")
			elif multiplier < 20:
				$musiclabel.set_text(str(stepify(50*multiplier,0.1)) + "/sec - Cost: 10K")
			$buttons/music.set_disabled(true)
	if upgrade == 1:
		if count >= 10000:
			count -= 10000
			counter += 50
			$buttons/music.set_text("Whistler")
			if multiplier >= 1000:
				$musiclabel.set_text(str(stepify(multiplier,0.1)) + "M/sec - Cost: 500K")
			elif multiplier < 1000:
				$musiclabel.set_text(str(stepify(multiplier,0.1)) + "K/sec - Cost: 500K")
			$buttons/music.set_disabled(true)
	if upgrade == 2:
		if count >= 500*K:
			count -= 500*K
			counter += 1000
			$buttons/music.set_text("Singer")
			if multiplier >= 400:
				$musiclabel.set_text(str(stepify(0.035*multiplier,0.1)) + "M/sec - Cost: 2.5B")
			elif multiplier < 400:
				$musiclabel.set_text(str(stepify(2.5*multiplier,0.1)) + "K/sec - Cost: 2.5B")
			$buttons/music.set_disabled(true)
	if upgrade == 3:
		if count >= 2500*M:
			count -= 2500*M
			counter += 2500
			$buttons/music.set_text("Musician")
			if multiplier >= 200:
				$musiclabel.set_text(str(stepify(0.035*multiplier,0.1)) + "M/sec - Cost: 10B")
			elif multiplier < 200:
				$musiclabel.set_text(str(stepify(5*multiplier,0.1)) + "K/sec - Cost: 10B")
			$buttons/music.set_disabled(true)
	if upgrade == 4:
		if count >= 10*B:
			count -= 10*B
			counter += 5000
			$buttons/music.set_text("Composer")
			$musiclabel.set_text("COMPLETED")
			$buttons/music.set_disabled(true)

func _on_catering_pressed():
	if upgrade2 == 0:
		if count >= 400:
			count -= 400
			counter += 2
			$buttons/catering.set_text("Egg Breaker")
			if multiplier >= 1000/15:
				$cateringlabel.set_text(str(stepify(0.0015*multiplier,0.1)) + "K/sec - Cost: 6K")
			elif multiplier < 1000/15:
				$cateringlabel.set_text(str(stepify(15*multiplier,0.1)) + "/sec - Cost: 6K")
			$buttons/catering.set_disabled(true)
	if upgrade2 == 1:
		if count >= 6000:
			count -= 6000
			counter += 15
			$buttons/catering.set_text("Caterer")
			if multiplier >= 100/3:
				$cateringlabel.set_text(str(stepify(0.03*multiplier,0.1)) + "K/sec - Cost: 22.5K")
			elif multiplier < 100/3:
				$cateringlabel.set_text(str(stepify(30*multiplier,0.1)) + "/sec - Cost: 22.5K")
			$buttons/catering.set_disabled(true)
	if upgrade2 == 2:
		if count >= 22500:
			count -= 22500
			counter += 30
			$buttons/catering.set_text("Cook")
			if multiplier >= 5000:
				$cateringlabel.set_text(str(stepify(0.0002*multiplier,0.1)) + "M/sec - Cost: 300K")
			elif multiplier >= 5:
				$cateringlabel.set_text(str(stepify(0.2*multiplier,0.1)) + "K/sec - Cost: 300K")
			elif multiplier < 5:
				$cateringlabel.set_text(str(stepify(200*multiplier,0.1)) + "/sec - Cost: 300K")
			$buttons/catering.set_disabled(true)
	if upgrade2 == 3:
		if count >= 300*K:
			count -= 300*K
			counter += 200
			$buttons/catering.set_text("Chef")
			if multiplier >= 1000/3:
				$cateringlabel.set_text(str(stepify(0.003*multiplier,0.1)) + "M/sec - Cost: 9M")
			elif multiplier < 1000/3:
				$cateringlabel.set_text(str(stepify(3*multiplier,0.1)) + "K/sec - Cost: 9M")
			$buttons/catering.set_disabled(true)
	if upgrade2 == 4:
		if count >= 9*M:
			count -= 9*M
			counter += 3000
			$buttons/catering.set_text("Master Chef")
			$cateringlabel.set_text("COMPLETED")
			$buttons/catering.set_disabled(true)

func _on_computer_pressed():
	if upgrade3 == 0:
		if count >= 900:
			count -= 900
			counter += 3
			$buttons/computer.set_text("Dummy")
			if multiplier >= 125:
				$computerlabel.set_text(str(stepify(0.008*multiplier,0.1)) + "K/sec - Cost: 4.8K")
			elif multiplier < 125:
				$computerlabel.set_text(str(stepify(8*multiplier,0.1)) + "/sec - Cost: 4.8K")
			$buttons/computer.set_disabled(true)
	if upgrade3 == 1:
		if count >= 4800:
			count -= 4800
			counter += 8
			$buttons/computer.set_text("User")
			if multiplier >= 1000/30:
				$computerlabel.set_text(str(stepify(0.03*multiplier,0.1)) + "K/sec - Cost: 36K")
			elif multiplier < 1000/30:
				$computerlabel.set_text(str(stepify(30*multiplier,0.1)) + "/sec - Cost: 36K")
			$buttons/computer.set_disabled(true)
	if upgrade3 == 2:
		if count >= 36*K:
			count -= 36*K
			counter += 30
			$buttons/computer.set_text("Power User")
			if multiplier >= 500:
				$computerlabel.set_text(str(stepify(0.002*multiplier,0.1)) + "M/sec - Cost: 5M")
			elif multiplier < 500:
				$computerlabel.set_text(str(stepify(2*multiplier,0.1)) + "K/sec - Cost: 5M")
			$buttons/computer.set_disabled(true)
	if upgrade3 == 3:
		if count >= 5*M:
			count -= 5*M
			counter += 2000
			$buttons/computer.set_text("Computer Wizard")
			if multiplier >= 10000/75:
				$computerlabel.set_text(str(stepify(0.0075*multiplier,0.1)) + "M/sec - Cost: 37.5M")
			elif multiplier < 10000/75:
				$computerlabel.set_text(str(stepify(7.5*multiplier,0.1)) + "K/sec - Cost: 37.5M")
			$buttons/computer.set_disabled(true)
	if upgrade3 == 4:
		if count >= 37.5*M:
			count -= 37.5*M
			counter += 7500
			$buttons/computer.set_text("Hacker")
			$computerlabel.set_text("COMPLETED")
			$buttons/computer.set_disabled(true)

func _on_sports_pressed():
	if upgrade4 == 0:
		if count >= 3*K:
			count -= 3*K
			counter += 5
			$buttons/sports.set_text("Gymnast")
			if multiplier >= 1000000/35:
				$sportslabel.set_text(str(stepify(0.000035*multiplier,0.1)) + "M/sec - Cost: 42K")
			elif multiplier >= 1000/35:
				$sportslabel.set_text(str(stepify(0.035*multiplier,0.1)) + "K/sec - Cost: 42K")
			elif multiplier < 1000/35:
				$sportslabel.set_text(str(stepify(35*multiplier,0.1)) + "/sec - Cost: 42K")
			$buttons/sports.set_disabled(true)
	if upgrade4 == 1:
		if count >= 42*K:
			count -= 42*K
			counter += 35
			$buttons/sports.set_text("Athlete")
			if multiplier >= 1000/300:
				$sportslabel.set_text(str(stepify(0.3*multiplier,0.1)) + "K/sec - Cost: 750K")
			elif multiplier < 1000/300:
				$sportslabel.set_text(str(stepify(300*multiplier,0.1)) + "/sec - Cost: 750K")
			$buttons/sports.set_disabled(true)
	if upgrade4 == 2:
		if count >= 750*K:
			count -= 750*K
			counter += 300
			$buttons/sports.set_text("Footballer")
			if multiplier >= 100000/75:
				$sportslabel.set_text(str(stepify(0.00075*multiplier,0.1)) + "M/sec - Cost: 3.75M")
			elif multiplier >= 1000/750:
				$sportslabel.set_text(str(stepify(0.75*multiplier,0.1)) + "K/sec - Cost: 3.75M")
			elif multiplier < 1000/750:
				$sportslabel.set_text(str(stepify(750*multiplier,0.1)) + "/sec - Cost: 3.75M")
			$buttons/sports.set_disabled(true)
	if upgrade4 == 3:
		if count >= 3.75*M:
			count -= 3.75*M
			counter += 750
			$buttons/sports.set_text("Boxer")
			if multiplier >= 250:
				$sportslabel.set_text(str(stepify(0.004*multiplier,0.1)) + "M/sec - Cost: 40M")
			elif multiplier < 250:
				$sportslabel.set_text(str(stepify(4*multiplier,0.1)) + "K/sec - Cost: 40M")
			$buttons/sports.set_disabled(true)
	if upgrade4 == 4:
		if count >= 40*M:
			count -= 40*M
			counter += 4000
			$buttons/sports.set_text("Champion")
			$sportslabel.set_text("COMPLETED")
			$buttons/sports.set_disabled(true)

func _on_science_pressed():
	if upgrade5 == 0:
		if count >= 8.4*K:
			count -= 8.4*K
			counter += 7
			$buttons/science.set_text("Nerd")
			if multiplier >= 10000:
				$sciencelabel.set_text(str(stepify(0.0001*multiplier,0.1)) + "M/sec - Cost: 250K")
			elif multiplier >= 10:
				$sciencelabel.set_text(str(stepify(0.1*multiplier,0.1)) + "K/sec - Cost: 250K")
			elif multiplier < 10:
				$sciencelabel.set_text(str(stepify(100*multiplier,0.1)) + "/sec - Cost: 250K")
			$buttons/science.set_disabled(true)
	if upgrade5 == 1:
		if count >= 250*K:
			count -= 250*K
			counter += 100
			$buttons/science.set_text("Inventor")
			if multiplier >= 10000/4:
				$sciencelabel.set_text(str(stepify(0.0004*multiplier,0.1)) + "M/sec - Cost: 2M")
			elif multiplier >= 1000/400:
				$sciencelabel.set_text(str(stepify(0.4*multiplier,0.1)) + "K/sec - Cost: 2M")
			elif multiplier < 1000/400:
				$sciencelabel.set_text(str(stepify(400*multiplier,0.1)) + "/sec - Cost: 2M")
			$buttons/science.set_disabled(true)
	if upgrade5 == 2:
		if count >= 2*M:
			count -= 2*M
			counter += 400
			$buttons/science.set_text("Theorist")
			if multiplier >= 400:
				$sciencelabel.set_text(str(stepify(0.0025*multiplier,0.1)) + "M/sec - Cost: 25M")
			elif multiplier < 400:
				$sciencelabel.set_text(str(stepify(2.5*multiplier,0.1)) + "K/sec - Cost: 25M")
			$buttons/science.set_disabled(true)
	if upgrade5 == 3:
		if count >= 25*M:
			count -= 25*M
			counter += 2500
			$buttons/science.set_text("Mad Scientist")
			if multiplier >= 1000/9:
				$sciencelabel.set_text(str(stepify(0.009*multiplier,0.1)) + "M/sec - Cost: 180M")
			elif multiplier < 1000/9:
				$sciencelabel.set_text(str(stepify(9*multiplier,0.1)) + "K/sec - Cost: 180M")
			$buttons/science.set_disabled(true)
	if upgrade5 == 4:
		if count >= 180*M:
			count -= 180*M
			counter += 9000
			$buttons/science.set_text("Alchemist")
			$sciencelabel.set_text("COMPLETED")
			$buttons/science.set_disabled(true)

func _on_health_pressed():
	if upgrade6 == 0:
		if count >= 25*K:
			count -= 25*K
			counter += 10
			$buttons/health.set_text("Intern")
			if multiplier >= 100000/6:
				$healthlabel.set_text(str(stepify(0.00006*multiplier,0.1)) + "M/sec - Cost: 300K")
			elif multiplier >= 1000/60:
				$healthlabel.set_text(str(stepify(0.06*multiplier,0.1)) + "K/sec - Cost: 300K")
			elif multiplier < 1000/60:
				$healthlabel.set_text(str(stepify(60*multiplier,0.1)) + "/sec - Cost: 300K")
			$buttons/health.set_disabled(true)
	if upgrade6 == 1:
		if count >= 300*K:
			count -= 300*K
			counter += 60
			$buttons/health.set_text("Assistant")
			if multiplier >= 10000:
				$healthlabel.set_text(str(stepify(0.0001*multiplier,0.1)) + "M/sec - Cost: 1M")
			elif multiplier >= 10:
				$healthlabel.set_text(str(stepify(0.1*multiplier,0.1)) + "K/sec - Cost: 1M")
			elif multiplier < 10:
				$healthlabel.set_text(str(stepify(100*multiplier,0.1)) + "/sec - Cost: 1M")
			$buttons/health.set_disabled(true)
	if upgrade6 == 2:
		if count >= 1*M:
			count -= 1*M
			counter += 100
			$buttons/health.set_text("Nurse")
			if multiplier >= 4000:
				$healthlabel.set_text(str(stepify(0.00025*multiplier,0.1)) + "M/sec - Cost: 5M")
			elif multiplier >= 4:
				$healthlabel.set_text(str(stepify(0.25*multiplier,0.1)) + "K/sec - Cost: 5M")
			elif multiplier < 4:
				$healthlabel.set_text(str(stepify(250*multiplier,0.1)) + "/sec - Cost: 5M")
			$buttons/health.set_disabled(true)
	if upgrade6 == 3:
		if count >= 5*M:
			count -= 5*M
			counter += 250
			$buttons/health.set_text("Practitioner")
			if multiplier >= 1000:
				$healthlabel.set_text(str(stepify(0.001*multiplier,0.1)) + "M/sec - Cost: 40M")
			elif multiplier < 1000:
				$healthlabel.set_text(str(stepify(multiplier,0.1)) + "K/sec - Cost: 40M")
			$buttons/health.set_disabled(true)
	if upgrade6 == 4:
		if count >= 40*M:
			count -= 40*M
			counter += 1000
			$buttons/health.set_text("Surgeon")
			$healthlabel.set_text("COMPLETED")
			$buttons/health.set_disabled(true)

func _on_acting_pressed():
	if upgrade7 == 0:
		if count >= 90*K:
			count -= 90*K
			counter += 15
			$buttons/acting.set_text("Clown")
			if multiplier >= 1000000/65:
				$actinglabel.set_text(str(stepify(0.000035*multiplier,0.1)) + "M/sec - Cost: 780K")
			elif multiplier >= 1000/65:
				$actinglabel.set_text(str(stepify(0.065*multiplier,0.1)) + "K/sec - Cost: 780K")
			elif multiplier < 1000/65:
				$actinglabel.set_text(str(stepify(65*multiplier,0.1)) + "/sec - Cost: 780K")
			$buttons/acting.set_disabled(true)
	if upgrade7 == 1:
		if count >= 780*K:
			count -= 780*K
			counter += 65
			$buttons/acting.set_text("Actor")
			if multiplier >= 10000/8:
				$actinglabel.set_text(str(stepify(0.0008*multiplier,0.1)) + "M/sec - Cost: 20M")
			elif multiplier >= 1000/800:
				$actinglabel.set_text(str(stepify(0.8*multiplier,0.1)) + "K/sec - Cost: 20M")
			elif multiplier < 1000/800:
				$actinglabel.set_text(str(stepify(800*multiplier,0.1)) + "/sec - Cost: 20M")
			$buttons/acting.set_disabled(true)
	if upgrade7 == 2:
		if count >= 20*M:
			count -= 20*M
			counter += 800
			$buttons/acting.set_text("Starring")
			if multiplier >= 10000/25:
				$actinglabel.set_text(str(stepify(0.0025*multiplier,0.1)) + "M/sec - Cost: 125M")
			elif multiplier < 10000/25:
				$actinglabel.set_text(str(stepify(2.5*multiplier,0.1)) + "K/sec - Cost: 125M")
			$buttons/acting.set_disabled(true)
	if upgrade7 == 3:
		if count >= 125*M:
			count -= 125*M
			counter += 2500
			$buttons/acting.set_text("Director")
			if multiplier >= 1000/7:
				$actinglabel.set_text(str(stepify(0.007*multiplier,0.1)) + "M/sec - Cost: 700M")
			elif multiplier < 1000/7:
				$actinglabel.set_text(str(stepify(7*multiplier,0.1)) + "K/sec - Cost: 700M")
			$buttons/acting.set_disabled(true)
	if upgrade7 == 4:
		if count >= 700*M:
			count -= 700*M
			counter += 7000
			$buttons/acting.set_text("Producer")
			$actinglabel.set_text("COMPLETED")
			$buttons/acting.set_disabled(true)

func _on_killing_pressed():
	if upgrade8 == 0:
		if count >= 250*K:
			count -= 250*K
			counter += 20
			$buttons/killing.set_text("Amateur")
			if multiplier >= 100000/15:
				$killinglabel.set_text(str(stepify(0.00015*multiplier,0.1)) + "M/sec - Cost: 3.75M")
			elif multiplier >= 1000/150:
				$killinglabel.set_text(str(stepify(0.15*multiplier,0.1)) + "K/sec - Cost: 3.75M")
			elif multiplier < 1000/150:
				$killinglabel.set_text(str(stepify(150*multiplier,0.1)) + "/sec - Cost: 3.75M")
			$buttons/killing.set_disabled(true)
	if upgrade8 == 1:
		if count >= 3.75*M:
			count -= 3.75*M
			counter += 150
			$buttons/killing.set_text("Sniper")
			if multiplier >= 10000/4:
				$killinglabel.set_text(str(stepify(0.0004*multiplier,0.1)) + "M/sec - Cost: 40M")
			elif multiplier >= 1000/400:
				$killinglabel.set_text(str(stepify(0.4*multiplier,0.1)) + "K/sec - Cost: 40M")
			elif multiplier < 1000/400:
				$killinglabel.set_text(str(stepify(400*multiplier,0.1)) + "/sec - Cost: 40M")
			$killinglabel.set_text("400/sec - Cost: 20M")
			$buttons/killing.set_disabled(true)
	if upgrade8 == 2:
		if count >= 20*M:
			count -= 20*M
			counter += 400
			$buttons/killing.set_text("Assassin")
			if multiplier >= 10000/7:
				$killinglabel.set_text(str(stepify(0.0007*multiplier,0.1)) + "M/sec - Cost: 70M")
			elif multiplier >= 1000/700:
				$killinglabel.set_text(str(stepify(0.7*multiplier,0.1)) + "K/sec - Cost: 70M")
			elif multiplier < 1000/700:
				$killinglabel.set_text(str(stepify(700*multiplier,0.1)) + "/sec - Cost: 70M")
			$buttons/killing.set_disabled(true)
	if upgrade8 == 3:
		if count >= 70*M:
			count -= 70*M
			counter += 700
			$buttons/killing.set_text("Ninja")
			if multiplier >= 1000/7:
				$killinglabel.set_text(str(stepify(0.007*multiplier,0.1)) + "M/sec - Cost: 1.4B")
			elif multiplier < 1000/7:
				$killinglabel.set_text(str(stepify(7*multiplier,0.1)) + "K/sec - Cost: 1.4B")
			$buttons/killing.set_disabled(true)
	if upgrade8 == 4:
		if count >= 1.4*B:
			count -= 1.4*B
			counter += 7000
			$buttons/killing.set_text("The Professional")
			$killinglabel.set_text("COMPLETED")
			$buttons/killing.set_disabled(true)

func _on_business_pressed():
	if upgrade9 == 0:
		if count >= 625*K:
			count -= 625*K
			counter += 25
			$buttons/business.set_text("Worker")
			if multiplier >= 1000/30:
				$businesslabel.set_text(str(stepify(0.03*multiplier,0.1)) + "K/sec - Cost: 1.5M")
			elif multiplier < 1000/30:
				$businesslabel.set_text(str(stepify(30*multiplier,0.1)) + "/sec - Cost: 1.5M")
			$buttons/business.set_disabled(true)
	if upgrade9 == 1:
		if count >= 1.5*M:
			count -= 1.5*M
			counter += 30
			$buttons/business.set_text("Manager")
			if multiplier >= 10000/7:
				$businesslabel.set_text(str(stepify(0.0007*multiplier,0.1)) + "M/sec - Cost: 70M")
			elif multiplier >= 1000/700:
				$businesslabel.set_text(str(stepify(0.7*multiplier,0.1)) + "K/sec - Cost: 70M")
			elif multiplier < 1000/700:
				$businesslabel.set_text(str(stepify(700*multiplier,0.1)) + "/sec - Cost: 70M")
			$buttons/business.set_disabled(true)
	if upgrade9 == 2:
		if count >= 70*M:
			count -= 70*M
			counter += 700
			$buttons/business.set_text("Vice President")
			if multiplier >= 1000/3:
				$businesslabel.set_text(str(stepify(0.003*multiplier,0.1)) + "M/sec - Cost: 600M")
			elif multiplier < 1000/3:
				$businesslabel.set_text(str(stepify(3*multiplier,0.1)) + "K/sec - Cost: 600M")
			$buttons/business.set_disabled(true)
	if upgrade9 == 3:
		if count >= 600*M:
			count -= 600*M
			counter += 3000
			$buttons/business.set_text("CEO")
			if multiplier >= 1000/8:
				$businesslabel.set_text(str(stepify(0.008*multiplier,0.1)) + "M/sec - Cost: 3.2B")
			elif multiplier < 1000/8:
				$businesslabel.set_text(str(stepify(8*multiplier,0.1)) + "K/sec - Cost: 3.2B")
			$buttons/business.set_disabled(true)
	if upgrade9 == 4:
		if count >= 3.2*B:
			count -= 3.2*B
			counter += 8000
			$buttons/business.set_text("Founder")
			$businesslabel.set_text("COMPLETED")
			$buttons/business.set_disabled(true)

func _on_legal_pressed():
	if upgrade10 == 0:
		if count >= 1.5*M:
			count -= 1.5*M
			counter += 30
			$buttons/legal.set_text("Clerk")
			if multiplier >= 1000/90:
				$legallabel.set_text(str(stepify(0.09*multiplier,0.1)) + "K/sec - Cost: 9M")
			elif multiplier < 1000/90:
				$legallabel.set_text(str(stepify(90*multiplier,0.1)) + "/sec - Cost: 9M")
			$buttons/legal.set_disabled(true)
	if upgrade10 == 1:
		if count >= 9*M:
			count -= 9*M
			counter += 90
			$buttons/legal.set_text("Paralegal")
			if multiplier >= 10000/2:
				$legallabel.set_text(str(stepify(0.0002*multiplier,0.1)) + "M/sec - Cost: 40M")
			elif multiplier >= 1000/200:
				$legallabel.set_text(str(stepify(0.2*multiplier,0.1)) + "K/sec - Cost: 40M")
			elif multiplier < 1000/200:
				$legallabel.set_text(str(stepify(200*multiplier,0.1)) + "/sec - Cost: 40M")
			$buttons/legal.set_disabled(true)
	if upgrade10 == 2:
		if count >= 40*M:
			count -= 40*M
			counter += 200
			$buttons/legal.set_text("Attorney")
			if multiplier >= 10000/4:
				$legallabel.set_text(str(stepify(0.0004*multiplier,0.1)) + "M/sec - Cost: 160M")
			elif multiplier >= 1000/400:
				$legallabel.set_text(str(stepify(0.4*multiplier,0.1)) + "K/sec - Cost: 160M")
			elif multiplier < 1000/400:
				$legallabel.set_text(str(stepify(400*multiplier,0.1)) + "/sec - Cost: 160M")
			$buttons/legal.set_disabled(true)
	if upgrade10 == 3:
		if count >= 160*M:
			count -= 160*M
			counter += 400
			$buttons/legal.set_text("Prosecutor")
			if multiplier >= 10000/9:
				$legallabel.set_text(str(stepify(0.0009*multiplier,0.1)) + "M/sec - Cost: 720M")
			elif multiplier >= 1000/900:
				$legallabel.set_text(str(stepify(0.9*multiplier,0.1)) + "K/sec - Cost: 720M")
			elif multiplier < 1000/900:
				$legallabel.set_text(str(stepify(900*multiplier,0.1)) + "/sec - Cost: 720M")
			$buttons/legal.set_disabled(true)
	if upgrade10 == 4:
		if count >= 720*M:
			count -= 720*M
			counter += 900
			$buttons/legal.set_text("Arbitrator")
			$legallabel.set_text("COMPLETED")
			$buttons/legal.set_disabled(true)

func _on_military_pressed():
	if upgrade11 == 0:
		if count >= 4*M:
			count -= 4*M
			counter += 40
			$buttons/military.set_text("Private")
			if multiplier >= 100000/8:
				$militarylabel.set_text(str(stepify(0.00008*multiplier,0.1)) + "M/sec - Cost: 16M")
			elif multiplier >= 1000/80:
				$militarylabel.set_text(str(stepify(0.08*multiplier,0.1)) + "K/sec - Cost: 16M")
			elif multiplier < 1000/80:
				$militarylabel.set_text(str(stepify(80*multiplier,0.1)) + "/sec - Cost: 16M")
			$buttons/military.set_disabled(true)
	if upgrade11 == 1:
		if count >= 16*M:
			count -= 16*M
			counter += 80
			$buttons/military.set_text("Sergeant")
			if multiplier >= 10000/4:
				$militarylabel.set_text(str(stepify(0.0004*multiplier,0.1)) + "M/sec - Cost: 160M")
			elif multiplier >= 1000/400:
				$militarylabel.set_text(str(stepify(0.4*multiplier,0.1)) + "K/sec - Cost: 160M")
			elif multiplier < 1000/400:
				$militarylabel.set_text(str(stepify(400*multiplier,0.1)) + "/sec - Cost: 160M")
			$buttons/military.set_disabled(true)
	if upgrade11 == 2:
		if count >= 160*M:
			count -= 160*M
			counter += 400
			$buttons/military.set_text("Lieutenant")
			if multiplier >= 1000000/35:
				$militarylabel.set_text(str(stepify(0.000035*multiplier,0.1)) + "M/sec - Cost: 1.2B")
			elif multiplier >= 1000/35:
				$militarylabel.set_text(str(stepify(0.035*multiplier,0.1)) + "K/sec - Cost: 1.2B")
			elif multiplier < 1000/35:
				$militarylabel.set_text(str(stepify(35*multiplier,0.1)) + "K/sec - Cost: 1.2B")
			$buttons/military.set_disabled(true)
	if upgrade11 == 3:
		if count >= 1.2*B:
			count -= 1.2*B
			counter += 1600
			$buttons/military.set_text("Colonel")
			if multiplier >= 1000/4.5:
				$militarylabel.set_text(str(stepify(0.0045*multiplier,0.1)) + "M/sec - Cost: 6.75B")
			elif multiplier < 1000/4.5:
				$militarylabel.set_text(str(stepify(4.5*multiplier,0.1)) + "K/sec - Cost: 6.75B")
			$buttons/military.set_disabled(true)
	if upgrade11 == 4:
		if count >= 6.75*B:
			count -= 6.75*B
			counter += 4500
			$buttons/military.set_text("General")
			$militarylabel.set_text("COMPLETED")
			$buttons/military.set_disabled(true)

func _on_politics_pressed():
	if upgrade12 == 0:
		if count >= 12.5*M:
			count -= 12.5*M
			counter += 50
			$buttons/politics.set_text("Candidate")
			if multiplier >= 1000000/175:
				$politicslabel.set_text(str(stepify(0.000175*multiplier,0.1)) + "M/sec - Cost: 87.5M")
			elif multiplier >= 1000/175:
				$politicslabel.set_text(str(stepify(0.175*multiplier,0.1)) + "K/sec - Cost: 87.5M")
			elif multiplier < 1000/175:
				$politicslabel.set_text(str(stepify(175*multiplier,0.1)) + "/sec - Cost: 87.5M")
			$buttons/politics.set_disabled(true)
	if upgrade12 == 1:
		if count >= 87.5*M:
			count -= 87.5*M
			counter += 175
			$buttons/politics.set_text("Mayor")
			if multiplier >= 1000000/475:
				$politicslabel.set_text(str(stepify(0.000475*multiplier,0.1)) + "M/sec - Cost: 475M")
			elif multiplier >= 1000/475:
				$politicslabel.set_text(str(stepify(0.475*multiplier,0.1)) + "K/sec - Cost: 475M")
			elif multiplier < 1000/475:
				$politicslabel.set_text(str(stepify(475*multiplier,0.1)) + "/sec - Cost: 475M")
			$buttons/politics.set_disabled(true)
	if upgrade12 == 2:
		if count >= 475*M:
			count -= 475*M
			counter += 475
			$buttons/politics.set_text("Minister")
			if multiplier >= 1000/4.5:
				$politicslabel.set_text(str(stepify(0.0045*multiplier,0.1)) + "M/sec - Cost: 9B")
			elif multiplier < 1000/4.5:
				$politicslabel.set_text(str(stepify(4.5*multiplier,0.1)) + "K/sec - Cost: 9B")
			$buttons/politics.set_disabled(true)
	if upgrade12 == 3:
		if count >= 9*B:
			count -= 9*B
			counter += 4500
			$buttons/politics.set_text("President")
			if multiplier >= 1000/8.5:
				$politicslabel.set_text(str(stepify(0.0085*multiplier,0.1)) + "M/sec - Cost: 25B")
			elif multiplier < 1000/8.5:
				$politicslabel.set_text(str(stepify(8.5*multiplier,0.1)) + "K/sec - Cost: 25B")
			$buttons/politics.set_disabled(true)
	if upgrade12 == 4:
		if count >= 25*B:
			count -= 25*B
			counter += 8500
			$buttons/politics.set_text("King")
			$politicslabel.set_text("COMPLETED")
			$buttons/politics.set_disabled(true)

func _on_item_pressed():
	if count >= price:
		count -= price
		items += 1
		price = pow(1.2,items)*100
		itemcounter = 1
		counter += itemcounter
		$owned.set_text("Owned: " + str(items))
		if price < K:
			$itemlabel.set_text(str(stepify(1*multiplier,0.1)) + "/sec - Cost: " + str(price))
		if price >= K:
			$itemlabel.set_text(str(stepify(1*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price/K,0.1)) + "K")
		if price >= M:
			$itemlabel.set_text(str(stepify(1*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price/M,0.1)) + "M")
		if price >= B:
			$itemlabel.set_text(str(stepify(1*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price/B,0.1)) + "B")
		if price >= T:
			$itemlabel.set_text(str(stepify(1*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price/T,0.1)) + "T")
		if price >= Q:
			$itemlabel.set_text(str(stepify(1*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price/Q,0.1)) + "Q")
		$buttons/item.set_disabled(true)

func _on_item2_pressed():
	if count >= price2:
		count -= price2
		items2 += 1
		price2 = pow(1.2,items2)*250
		itemcounter2 = 2
		counter += itemcounter2
		$owned2.set_text("Owned: " + str(items2))
		if price2 < K:
			$itemlabel2.set_text(str(stepify(2*multiplier,0.1)) + "/sec - Cost: " + str(price2))
		if price2 >= K:
			$itemlabel2.set_text(str(stepify(2*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price2/K,0.1)) + "K")
		if price2 >= M:
			$itemlabel2.set_text(str(stepify(2*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price2/M,0.1)) + "M")
		if price2 >= B:
			$itemlabel2.set_text(str(stepify(2*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price2/B,0.1)) + "B")
		if price2 >= T:
			$itemlabel2.set_text(str(stepify(2*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price2/T,0.1)) + "T")
		if price2 >= Q:
			$itemlabel2.set_text(str(stepify(2*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price2/Q,0.1)) + "Q")
		$buttons/item2.set_disabled(true)

func _on_item3_pressed():
	if count >= price3:
		count -= price3
		items3 += 1
		price3 = pow(1.2,items3)*K
		itemcounter3 = 4
		counter += itemcounter3
		$owned3.set_text("Owned: " + str(items3))
		if price3 < K:
			$itemlabel3.set_text(str(stepify(4*multiplier,0.1)) + "/sec - Cost: " + str(price3))
		if price3 >= K:
			$itemlabel3.set_text(str(stepify(4*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price3/K,0.1)) + "K")
		if price3 >= M:
			$itemlabel3.set_text(str(stepify(4*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price3/M,0.1)) + "M")
		if price3 >= B:
			$itemlabel3.set_text(str(stepify(4*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price3/B,0.1)) + "B")
		if price3 >= T:
			$itemlabel3.set_text(str(stepify(4*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price3/T,0.1)) + "T")
		if price3 >= Q:
			$itemlabel3.set_text(str(stepify(4*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price3/Q,0.1)) + "Q")
		$buttons/item3.set_disabled(true)

func _on_item4_pressed():
	if count >= price4:
		count -= price4
		items4 += 1
		price4 = pow(1.2,items4)*2.5*K
		itemcounter4 = 7
		counter += itemcounter4
		$owned4.set_text("Owned: " + str(items4))
		if price4 < K:
			$itemlabel4.set_text(str(stepify(7*multiplier,0.1)) + "/sec - Cost: " + str(price4))
		if price4 >= K:
			$itemlabel4.set_text(str(stepify(7*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price4/K,0.1)) + "K")
		if price4 >= M:
			$itemlabel4.set_text(str(stepify(7*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price4/M,0.1)) + "M")
		if price4 >= B:
			$itemlabel4.set_text(str(stepify(7*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price4/B,0.1)) + "B")
		if price4 >= T:
			$itemlabel4.set_text(str(stepify(7*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price4/T,0.1)) + "T")
		if price4 >= Q:
			$itemlabel4.set_text(str(stepify(7*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price4/Q,0.1)) + "Q")
		$buttons/item4.set_disabled(true)

func _on_item5_pressed():
	if count >= price5:
		count -= price5
		items5 += 1
		price5 = pow(1.2,items5)*10*K
		itemcounter5 = 10
		counter += itemcounter5
		$owned5.set_text("Owned: " + str(items5))
		if price5 < K:
			$itemlabel5.set_text(str(stepify(10*multiplier,0.1)) + "/sec - Cost: " + str(price5))
		if price5 >= K:
			$itemlabel5.set_text(str(stepify(10*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price5/K,0.1)) + "K")
		if price5 >= M:
			$itemlabel5.set_text(str(stepify(10*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price5/M,0.1)) + "M")
		if price5 >= B:
			$itemlabel5.set_text(str(stepify(10*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price5/B,0.1)) + "B")
		if price5 >= Q:
			$itemlabel5.set_text(str(stepify(10*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price5/Q,0.1)) + "Q")
		$buttons/item5.set_disabled(true)

func _on_item6_pressed():
	if count >= price6:
		count -= price6
		items6 += 1
		price6 = pow(1.2,items6)*25*K
		itemcounter6 = 20
		counter += itemcounter6
		$owned6.set_text("Owned: " + str(items6))
		if price6 < K:
			$itemlabel6.set_text(str(stepify(20*multiplier,0.1)) + "/sec - Cost: " + str(price6))
		if price6 >= K:
			$itemlabel6.set_text(str(stepify(20*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price6/K,0.1)) + "K")
		if price6 >= M:
			$itemlabel6.set_text(str(stepify(20*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price6/M,0.1)) + "M")
		if price6 >= B:
			$itemlabel6.set_text(str(stepify(20*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price6/B,0.1)) + "B")
		if price6 >= T:
			$itemlabel6.set_text(str(stepify(20*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price6/T,0.1)) + "T")
		if price6 >= Q:
			$itemlabel6.set_text(str(stepify(20*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price6/Q,0.1)) + "Q")
		$buttons/item6.set_disabled(true)

func _on_item7_pressed():
	if count >= price7:
		count -= price7
		items7 += 1
		price7 = pow(1.2,items7)*100*K
		itemcounter7 = 50
		counter += itemcounter7
		$owned7.set_text("Owned: " + str(items7))
		if price7 < K:
			$itemlabel7.set_text(str(stepify(50*multiplier,0.1)) + "/sec - Cost: " + str(price7))
		if price7 >= K:
			$itemlabel7.set_text(str(stepify(50*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price7/K,0.1)) + "K")
		if price7 >= M:
			$itemlabel7.set_text(str(stepify(50*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price7/M,0.1)) + "M")
		if price7 >= B:
			$itemlabel7.set_text(str(stepify(50*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price7/B,0.1)) + "B")
		if price7 >= T:
			$itemlabel7.set_text(str(stepify(50*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price7/T,0.1)) + "T")
		if price7 >= Q:
			$itemlabel7.set_text(str(stepify(50*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price7/Q,0.1)) + "Q")
		$buttons/item7.set_disabled(true)

func _on_item8_pressed():
	if count >= price8:
		count -= price8
		items8 += 1
		price8 = pow(1.2,items8)*M
		itemcounter8 = 250
		counter += itemcounter8
		$owned8.set_text("Owned: " + str(items8))
		if price8 < K:
			$itemlabel8.set_text(str(stepify(250*multiplier,0.1)) + "/sec - Cost: " + str(price8))
		if price8 >= K:
			$itemlabel8.set_text(str(stepify(250*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price8/K,0.1)) + "K")
		if price8 >= M:
			$itemlabel8.set_text(str(stepify(250*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price8/M,0.1)) + "M")
		if price8 >= B:
			$itemlabel8.set_text(str(stepify(250*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price8/B,0.1)) + "B")
		if price8 >= T:
			$itemlabel8.set_text(str(stepify(250*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price8/T,0.1)) + "T")
		if price8 >= Q:
			$itemlabel8.set_text(str(stepify(250*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price8/Q,0.1)) + "Q")
		$buttons/item8.set_disabled(true)

func _on_item9_pressed():
	if count >= price9:
		count -= price9
		items9 += 1
		price9 = pow(1.2,items9)*10*M
		itemcounter9 = 1000
		counter += itemcounter9
		$owned9.set_text("Owned: " + str(items9))
		if price9 < K:
			$itemlabel9.set_text(str(stepify(multiplier,0.1)) + "K/sec - Cost: " + str(price9))
		if price9 >= K:
			$itemlabel9.set_text(str(stepify(multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price9/K,0.1)) + "K")
		if price9 >= M:
			$itemlabel9.set_text(str(stepify(multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price9/M,0.1)) + "M")
		if price9 >= B:
			$itemlabel9.set_text(str(stepify(multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price9/B,0.1)) + "B")
		if price9 >= T:
			$itemlabel9.set_text(str(stepify(multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price9/T,0.1)) + "T")
		if price9 >= Q:
			$itemlabel9.set_text(str(stepify(multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price9/Q,0.1)) + "Q")
		$buttons/item9.set_disabled(true)

func _on_item10_pressed():
	if count >= price10:
		count -= price10
		items10 += 1
		price10 = pow(1.2,items10)*100*M
		itemcounter10 = 5000
		counter += itemcounter10
		$owned10.set_text("Owned: " + str(items10))
		if price10 < B:
			if multiplier < 200000:
				$itemlabel10.set_text(str(stepify(5*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price10/M,0.1)) + "M")
			else:
				$itemlabel10.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price10/M,0.1)) + "M")
		if price10 >= B:
			if multiplier < 200000:
				$itemlabel10.set_text(str(stepify(5*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price10/B,0.1)) + "B")
			else:
				$itemlabel10.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price10/B,0.1)) + "B")
		if price10 >= T:
			if multiplier < 200000:
				$itemlabel10.set_text(str(stepify(5*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price10/T,0.1)) + "T")
			else:
				$itemlabel10.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price10/T,0.1)) + "T")
		if price10 >= Q:
			if multiplier < 200000:
				$itemlabel10.set_text(str(stepify(5*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price10/Q,0.1)) + "Q")
			else:
				$itemlabel10.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price10/Q,0.1)) + "Q")
		$buttons/item10.set_disabled(true)

func _on_item11_pressed():
	if count >= price11:
		count -= price11
		items11 += 1
		price11 = pow(1.2,items11)*B
		itemcounter11 = 20000
		counter += itemcounter11
		$owned11.set_text("Owned: " + str(items11))
		if price11 < T:
			if multiplier < 50000:
				$itemlabel11.set_text(str(stepify(20*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price11/B,0.1)) + "B")
			else:
				$itemlabel11.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price11/B,0.1)) + "B")
		if price11 >= T:
			if multiplier < 50000:
				$itemlabel11.set_text(str(stepify(20*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price11/T,0.1)) + "T")
			else:
				$itemlabel11.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price11/T,0.1)) + "T")
		if price11 >= Q:
			if multiplier < 50000:
				$itemlabel11.set_text(str(stepify(20*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price11/Q,0.1)) + "Q")
			else:
				$itemlabel11.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price11/Q,0.1)) + "Q")
		$buttons/item11.set_disabled(true)

func _on_item12_pressed():
	if count >= price12:
		count -= price12
		items12 += 1
		price12 = pow(1.2,items12)*10*B
		itemcounter12 = items12*100000
		counter += itemcounter12
		$owned12.set_text("Owned: " + str(items12))
		if price12 < T:
			if multiplier < 10000:
				$itemlabel12.set_text(str(stepify(100*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price12/B,0.1)) + "B")
			else:
				$itemlabel12.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price12/B,0.1)) + "B")
		if price12 >= T:
			if multiplier < 10000:
				$itemlabel12.set_text(str(stepify(100*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price12/T,0.1)) + "T")
			else:
				$itemlabel12.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price12/T,0.1)) + "T")
		if price12 >= Q:
			if multiplier < 10000:
				$itemlabel12.set_text(str(stepify(100*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price12/Q,0.1)) + "Q")
			else:
				$itemlabel12.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price12/Q,0.1)) + "Q")
		$buttons/item12.set_disabled(true)

func _on_reset_pressed():
	if count >= requirement:
		$resetbox.set_visible(true)

func _on_resetbox_confirmed():
	count = 0
	timer = 0
	counter = 0
	multiplier *= 1.25
	reset += 1
	requirement *= 1.5
	upgrade = 0
	upgrade2 = 0
	upgrade3 = 0
	upgrade4 = 0
	upgrade5 = 0
	upgrade6 = 0
	upgrade7 = 0
	upgrade8 = 0
	upgrade9 = 0
	upgrade10 = 0
	upgrade11 = 0
	upgrade12 = 0
	items = 0
	items2 = 0
	items3 = 0
	items4 = 0
	items5 = 0
	items6 = 0
	items7 = 0
	items8 = 0
	items9 = 0
	items10 = 0
	items11 = 0
	items12 = 0
	itemcounter = 1
	itemcounter2 = 2
	itemcounter3 = 4
	itemcounter4 = 7
	itemcounter5 = 10
	itemcounter6 = 20
	itemcounter7 = 50
	itemcounter8 = 250
	itemcounter9 = 1000
	itemcounter10 = 5000
	itemcounter11 = 20000
	itemcounter12 = 100000
	price = 100
	price2 = 250
	price3 = 1000
	price4 = 2500
	price5 = 10000
	price6 = 25000
	price7 = 100000
	price8 = 1000000
	price9 = 10000000
	price10 = 100000000
	price11 = 1000000000
	price12 = 10000000000
	K = 1000
	M = 1000000
	B = 1000000000
	T = 1000000000000
	Q = 1000000000000000
	power = 1
	power_req = 3000
	power_lvl = 1
	$powerlabel.set_text("Current\nLevel: " + str(power_lvl) + "\nPower: " + str(stepify(power*multiplier,0.1)) + "\n\nNext\nLevel: " + str(power_lvl+1) + "\nNext Power: " + str(stepify((power+1)*multiplier,0.1)) + "\nCost: " + str(power_req))
	if multiplier < 1000:
		$musiclabel.set_text(str(stepify(multiplier,0.1)) + "/sec - Cost: 100")
	else:
		$musiclabel.set_text(str(stepify(0.001*multiplier,0.1)) + "K/sec - Cost: 100")
	if multiplier < 500:
		$cateringlabel.set_text(str(stepify(multiplier*2,0.1)) + "/sec - Cost: 400")
	else:
		$cateringlabel.set_text(str(stepify(0.001*multiplier*2,0.1)) + "K/sec - Cost: 400")
	if multiplier < 333:
		$computerlabel.set_text(str(stepify(multiplier*3,0.1)) + "/sec - Cost: 900")
	else:
		$computerlabel.set_text(str(stepify(0.001*multiplier*3,0.1)) + "K/sec - Cost: 900")
	if multiplier < 200:
		$computerlabel.set_text(str(stepify(multiplier*5,0.1)) + "/sec - Cost: 3K")
	else:
		$computerlabel.set_text(str(stepify(0.001*multiplier*5,0.1)) + "K/sec - Cost: 3K")
	if multiplier < 142:
		$sciencelabel.set_text(str(stepify(multiplier*7,0.1)) + "/sec - Cost: 8.4K")
	else:
		$sciencelabel.set_text(str(stepify(0.001*multiplier*7,0.1)) + "K/sec - Cost: 8.4K")
	if multiplier < 100:
		$healthlabel.set_text(str(stepify(multiplier*10,0.1)) + "/sec - Cost: 25K")
	else:
		$healthlabel.set_text(str(stepify(0.001*multiplier*10,0.1)) + "K/sec - Cost: 25K")
	if multiplier < 66:
		$actinglabel.set_text(str(stepify(multiplier*15,0.1)) + "/sec - Cost: 90K")
	else:
		$actinglabel.set_text(str(stepify(0.001*multiplier*15,0.1)) + "K/sec - Cost: 90K")
	if multiplier < 50:
		$killinglabel.set_text(str(stepify(multiplier*20,0.1)) + "/sec - Cost: 250K")
	else:
		$killinglabel.set_text(str(stepify(0.001*multiplier*20,0.1)) + "K/sec - Cost: 250K")
	if multiplier < 40:
		$businesslabel.set_text(str(stepify(multiplier*25,0.1)) + "/sec - Cost: 625K")
	else:
		$businesslabel.set_text(str(stepify(0.001*multiplier*25,0.1)) + "K/sec - Cost: 625K")
	if multiplier < 33:
		$legallabel.set_text(str(stepify(multiplier*30,0.1)) + "/sec - Cost: 1.5M")
	else:
		$legallabel.set_text(str(stepify(0.001*multiplier*30,0.1)) + "K/sec - Cost: 1.5M")
	if multiplier < 25:
		$militarylabel.set_text(str(stepify(multiplier*40,0.1)) + "/sec - Cost: 4M")
	elif multiplier >= 25:
		$militarylabel.set_text(str(stepify(0.001*multiplier*40,0.1)) + "K/sec - Cost: 4M")
	elif multiplier >= 25000:
		$militarylabel.set_text(str(stepify(0.000001*multiplier*40,0.1)) + "K/sec - Cost: 4M")
	if multiplier < 20:
		$politicslabel.set_text(str(stepify(multiplier*50,0.1)) + "/sec - Cost: 12.5M")
	elif multiplier >= 20:
		$politicslabel.set_text(str(stepify(0.001*multiplier*50,0.1)) + "K/sec - Cost: 12.5M")
	elif multiplier >= 20000:
		$politicslabel.set_text(str(stepify(0.000001*multiplier*50,0.1)) + "M/sec - Cost: 12.5M")
	if price < K:
		$itemlabel.set_text(str(stepify(1*multiplier,0.1)) + "/sec - Cost: " + str(price))
	if price >= K:
		$itemlabel.set_text(str(stepify(1*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price/K,0.1)) + "K")
	if price >= M:
		$itemlabel.set_text(str(stepify(1*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price/M,0.1)) + "M")
	if price >= B:
		$itemlabel.set_text(str(stepify(1*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price/B,0.1)) + "B")
	if price >= T:
		$itemlabel.set_text(str(stepify(1*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price/T,0.1)) + "T")
	if price >= Q:
		$itemlabel.set_text(str(stepify(1*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price/Q,0.1)) + "Q")
	if price2 < K:
		$itemlabel2.set_text(str(stepify(2*multiplier,0.1)) + "/sec - Cost: " + str(price2))
	if price2 >= K:
		$itemlabel2.set_text(str(stepify(2*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price2/K,0.1)) + "K")
	if price2 >= M:
		$itemlabel2.set_text(str(stepify(2*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price2/M,0.1)) + "M")
	if price2 >= B:
		$itemlabel2.set_text(str(stepify(2*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price2/B,0.1)) + "B")
	if price2 >= T:
		$itemlabel2.set_text(str(stepify(2*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price2/T,0.1)) + "T")
	if price2 >= Q:
		$itemlabel2.set_text(str(stepify(2*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price2/Q,0.1)) + "Q")
	if price3 < K:
		$itemlabel3.set_text(str(stepify(4*multiplier,0.1)) + "/sec - Cost: " + str(price3))
	if price3 >= K:
		$itemlabel3.set_text(str(stepify(4*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price3/K,0.1)) + "K")
	if price3 >= M:
		$itemlabel3.set_text(str(stepify(4*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price3/M,0.1)) + "M")
	if price3 >= B:
		$itemlabel3.set_text(str(stepify(4*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price3/B,0.1)) + "B")
	if price3 >= T:
		$itemlabel3.set_text(str(stepify(4*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price3/T,0.1)) + "T")
	if price3 >= Q:
		$itemlabel3.set_text(str(stepify(4*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price3/Q,0.1)) + "Q")
	if price4 < K:
		$itemlabel4.set_text(str(stepify(7*multiplier,0.1)) + "/sec - Cost: " + str(price4))
	if price4 >= K:
		$itemlabel4.set_text(str(stepify(7*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price4/K,0.1)) + "K")
	if price4 >= M:
		$itemlabel4.set_text(str(stepify(7*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price4/M,0.1)) + "M")
	if price4 >= B:
		$itemlabel4.set_text(str(stepify(7*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price4/B,0.1)) + "B")
	if price4 >= T:
		$itemlabel4.set_text(str(stepify(7*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price4/T,0.1)) + "T")
	if price4 >= Q:
		$itemlabel4.set_text(str(stepify(7*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price4/Q,0.1)) + "Q")
	if price5 < K:
		$itemlabel5.set_text(str(stepify(10*multiplier,0.1)) + "/sec - Cost: " + str(price5))
	if price5 >= K:
		$itemlabel5.set_text(str(stepify(10*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price5/K,0.1)) + "K")
	if price5 >= M:
		$itemlabel5.set_text(str(stepify(10*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price5/M,0.1)) + "M")
	if price5 >= B:
		$itemlabel5.set_text(str(stepify(10*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price5/B,0.1)) + "B")
	if price5 >= Q:
		$itemlabel5.set_text(str(stepify(10*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price5/Q,0.1)) + "Q")
	if price6 < K:
		$itemlabel6.set_text(str(stepify(20*multiplier,0.1)) + "/sec - Cost: " + str(price6))
	if price6 >= K:
		$itemlabel6.set_text(str(stepify(20*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price6/K,0.1)) + "K")
	if price6 >= M:
		$itemlabel6.set_text(str(stepify(20*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price6/M,0.1)) + "M")
	if price6 >= B:
		$itemlabel6.set_text(str(stepify(20*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price6/B,0.1)) + "B")
	if price6 >= T:
		$itemlabel6.set_text(str(stepify(20*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price6/T,0.1)) + "T")
	if price6 >= Q:
		$itemlabel6.set_text(str(stepify(20*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price6/Q,0.1)) + "Q")
	if price7 < K:
		$itemlabel7.set_text(str(stepify(50*multiplier,0.1)) + "/sec - Cost: " + str(price7))
	if price7 >= K:
		$itemlabel7.set_text(str(stepify(50*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price7/K,0.1)) + "K")
	if price7 >= M:
		$itemlabel7.set_text(str(stepify(50*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price7/M,0.1)) + "M")
	if price7 >= B:
		$itemlabel7.set_text(str(stepify(50*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price7/B,0.1)) + "B")
	if price7 >= T:
		$itemlabel7.set_text(str(stepify(50*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price7/T,0.1)) + "T")
	if price7 >= Q:
		$itemlabel7.set_text(str(stepify(50*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price7/Q,0.1)) + "Q")
	if price8 < K:
		$itemlabel8.set_text(str(stepify(250*multiplier,0.1)) + "/sec - Cost: " + str(price8))
	if price8 >= K:
		$itemlabel8.set_text(str(stepify(250*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price8/K,0.1)) + "K")
	if price8 >= M:
		$itemlabel8.set_text(str(stepify(250*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price8/M,0.1)) + "M")
	if price8 >= B:
		$itemlabel8.set_text(str(stepify(250*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price8/B,0.1)) + "B")
	if price8 >= T:
		$itemlabel8.set_text(str(stepify(250*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price8/T,0.1)) + "T")
	if price8 >= Q:
		$itemlabel8.set_text(str(stepify(250*multiplier,0.1)) + "/sec - Cost: " + str(stepify(price8/Q,0.1)) + "Q")
	if price9 < K:
		$itemlabel9.set_text(str(stepify(multiplier,0.1)) + "K/sec - Cost: " + str(price9))
	if price9 >= K:
		$itemlabel9.set_text(str(stepify(multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price9/K,0.1)) + "K")
	if price9 >= M:
		$itemlabel9.set_text(str(stepify(multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price9/M,0.1)) + "M")
	if price9 >= B:
		$itemlabel9.set_text(str(stepify(multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price9/B,0.1)) + "B")
	if price9 >= T:
		$itemlabel9.set_text(str(stepify(multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price9/T,0.1)) + "T")
	if price9 >= Q:
		$itemlabel9.set_text(str(stepify(multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price9/Q,0.1)) + "Q")
	if price10 < B:
		if multiplier < 200000:
			$itemlabel10.set_text(str(stepify(5*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price10/M,0.1)) + "M")
		else:
			$itemlabel10.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price10/M,0.1)) + "M")
	if price10 >= B:
		if multiplier < 200000:
			$itemlabel10.set_text(str(stepify(5*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price10/B,0.1)) + "B")
		else:
			$itemlabel10.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price10/B,0.1)) + "B")
	if price10 >= T:
		if multiplier < 200000:
			$itemlabel10.set_text(str(stepify(5*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price10/T,0.1)) + "T")
		else:
			$itemlabel10.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price10/T,0.1)) + "T")
	if price10 >= Q:
		if multiplier < 200000:
			$itemlabel10.set_text(str(stepify(5*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price10/Q,0.1)) + "Q")
		else:
			$itemlabel10.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price10/Q,0.1)) + "Q")
	if price11 < T:
		if multiplier < 50000:
			$itemlabel11.set_text(str(stepify(20*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price11/B,0.1)) + "B")
		else:
			$itemlabel11.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price11/B,0.1)) + "B")
	if price11 >= T:
		if multiplier < 50000:
			$itemlabel11.set_text(str(stepify(20*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price11/T,0.1)) + "T")
		else:
			$itemlabel11.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price11/T,0.1)) + "T")
	if price11 >= Q:
		if multiplier < 50000:
			$itemlabel11.set_text(str(stepify(20*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price11/Q,0.1)) + "Q")
		else:
			$itemlabel11.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price11/Q,0.1)) + "Q")
	if price12 < T:
		if multiplier < 10000:
			$itemlabel12.set_text(str(stepify(100*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price12/B,0.1)) + "B")
		else:
			$itemlabel12.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price12/B,0.1)) + "B")
	if price12 >= T:
		if multiplier < 10000:
			$itemlabel12.set_text(str(stepify(100*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price12/T,0.1)) + "T")
		else:
			$itemlabel12.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price12/T,0.1)) + "T")
	if price12 >= Q:
		if multiplier < 10000:
			$itemlabel12.set_text(str(stepify(100*multiplier,0.1)) + "K/sec - Cost: " + str(stepify(price12/Q,0.1)) + "Q")
		else:
			$itemlabel12.set_text(str(stepify(0.0001*multiplier,0.1)) + "B/sec - Cost: " + str(stepify(price12/Q,0.1)) + "Q")
	$owned.set_text("Owned: 0")
	$owned2.set_text("Owned: 0")
	$owned3.set_text("Owned: 0")
	$owned4.set_text("Owned: 0")
	$owned5.set_text("Owned: 0")
	$owned6.set_text("Owned: 0")
	$owned7.set_text("Owned: 0")
	$owned8.set_text("Owned: 0")
	$owned9.set_text("Owned: 0")
	$owned10.set_text("Owned: 0")
	$owned11.set_text("Owned: 0")
	$owned12.set_text("Owned: 0")
	if requirement < 1000000:
		$resetlabel.set_text("Multiplier: " + str(stepify(multiplier,0.1)) + "\nRequriement: " + str(requirement))
	if requirement >= 1000000:
		$resetlabel.set_text("Multiplier: " + str(stepify(multiplier,0.1)) + "\nRequriement: " + str(requirement/M) + "M")
	if requirement >= 1000000000000:
		$resetlabel.set_text("Multiplier: " + str(stepify(multiplier,0.1)) + "\nRequriement: " + str(requirement/T) + "T")
	$buttons/music.set_text("???")
	$buttons/music.set_disabled(true)
	$buttons/catering.set_text("???")
	$buttons/catering.set_disabled(true)
	$buttons/computer.set_text("???")
	$buttons/computer.set_disabled(true)
	$buttons/sports.set_text("???")
	$buttons/sports.set_disabled(true)
	$buttons/science.set_text("???")
	$buttons/science.set_disabled(true)
	$buttons/health.set_text("???")
	$buttons/health.set_disabled(true)
	$buttons/acting.set_text("???")
	$buttons/acting.set_disabled(true)
	$buttons/killing.set_text("???")
	$buttons/killing.set_disabled(true)
	$buttons/business.set_text("???")
	$buttons/business.set_disabled(true)
	$buttons/legal.set_text("???")
	$buttons/legal.set_disabled(true)
	$buttons/military.set_text("???")
	$buttons/military.set_disabled(true)
	$buttons/politics.set_text("???")
	$buttons/item.set_disabled(true)
	$buttons/item2.set_disabled(true)
	$buttons/item3.set_disabled(true)
	$buttons/item4.set_disabled(true)
	$buttons/item5.set_disabled(true)
	$buttons/item6.set_disabled(true)
	$buttons/item7.set_disabled(true)
	$buttons/item8.set_disabled(true)
	$buttons/item9.set_disabled(true)
	$buttons/item10.set_disabled(true)
	$buttons/item11.set_disabled(true)
	$buttons/item12.set_disabled(true)

func _on_x_pressed():
	close = 1
	$congrats.set_visible(false)
