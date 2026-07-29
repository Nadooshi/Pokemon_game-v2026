/// @desc Init globals
randomize()
#region Elemental

enum _ELEMENTAL {
	white,
	dark,
	flame,
	water,
	ground,
	psy,
	poison,
	electric,
	wind,
	lunar,
	solar,
	flesh, 
	ghost,
	plant,
	steel,
	rock,	
	furry,   // пушистый	
	mystic,
	ancient, // древний
	shielded,  // панцирный
	marine,  // водоплавающий
	bird,
	cosmic,
	spike,
	frozen,
	insect,
	dragon,
	robotic,
	muddy,
	woody,
	none,
	count    // чтобы узнать количество значений
}

global.elemental_text = undefined;
var i=0
global.elemental_text[i++] = "white"
global.elemental_text[i++] = "dark"
global.elemental_text[i++] = "flame"
global.elemental_text[i++] = "water"
global.elemental_text[i++] = "ground"
global.elemental_text[i++] = "psy"
global.elemental_text[i++] = "poison"
global.elemental_text[i++] = "electric"
global.elemental_text[i++] = "wind"
global.elemental_text[i++] = "lunar"
global.elemental_text[i++] = "solar"
global.elemental_text[i++] = "flesh" 
global.elemental_text[i++] = "ghost"
global.elemental_text[i++] = "plant"
global.elemental_text[i++] = "steel"
global.elemental_text[i++] = "rock"
global.elemental_text[i++] = "furry"	// пушистый	
global.elemental_text[i++] = "mystic"
global.elemental_text[i++] = "ancient"	// древний
global.elemental_text[i++] = "shielded"	// панцирный
global.elemental_text[i++] = "marine"	// водоплавающий
global.elemental_text[i++] = "bird"
global.elemental_text[i++] = "cosmic"
global.elemental_text[i++] = "spike"
global.elemental_text[i++] = "frozen"
global.elemental_text[i++] = "insect"
global.elemental_text[i++] = "dragon"
global.elemental_text[i++] = "robotic"
global.elemental_text[i++] = "muddy"
global.elemental_text[i++] = "woody"
global.elemental_text[i++] = "none"

#endregion

//////////////////////////////////

#region Material
enum _MATERIAL {
	white,
	dark,
	flame,
	water,
	ground,
	psy,
	poison,
	electric,
	wind,
	lunar,
	solar,
	flesh, 
	ghost,
	plant,
	steel,
	rock,	
	furry,   // пушистый	
	mystic,
	ancient, // древний
	shielded,  // панцирный
	marine,  // водоплавающий
	bird,
	cosmic,
	spike,
	frozen,
	insect,
	dragon,
	robotic,
	muddy,
	woody,
	none,
	count    // чтобы узнать количество значений
}

global.material_text = undefined;
var i=0
global.material_text[i++] = "white"
global.material_text[i++] = "dark"
global.material_text[i++] = "flame"
global.material_text[i++] = "water"
global.material_text[i++] = "ground"
global.material_text[i++] = "psy"
global.material_text[i++] = "poison"
global.material_text[i++] = "electric"
global.material_text[i++] = "wind"
global.material_text[i++] = "lunar"
global.material_text[i++] = "solar"
global.material_text[i++] = "flesh" 
global.material_text[i++] = "ghost"
global.material_text[i++] = "plant"
global.material_text[i++] = "steel"
global.material_text[i++] = "rock"
global.material_text[i++] = "furry"	// пушистый	
global.material_text[i++] = "mystic"
global.material_text[i++] = "ancient"	// древний
global.material_text[i++] = "shielded"	// панцирный
global.material_text[i++] = "marine"	// водоплавающий
global.material_text[i++] = "bird"
global.material_text[i++] = "cosmic"
global.material_text[i++] = "spike"
global.material_text[i++] = "frozen"
global.material_text[i++] = "insect"
global.material_text[i++] = "dragon"
global.material_text[i++] = "robotic"
global.material_text[i++] = "muddy"
global.material_text[i++] = "woody"
global.material_text[i++] = "none"

global.material_colour = undefined;
var i=0

global.material_colour[i++] = make_colour_rgb(255,255,255)		//white
global.material_colour[i++] = make_colour_rgb(45,45,45)		//dark
global.material_colour[i++] = make_colour_rgb(255,110,10)		//flame
global.material_colour[i++] = make_colour_rgb(70,70,255)		//water
global.material_colour[i++] = make_colour_rgb(127,90,38)		//ground
global.material_colour[i++] = make_colour_rgb(255,100,100)		//psy
global.material_colour[i++] = make_colour_rgb(10,160,100)		//poison
global.material_colour[i++] = make_colour_rgb(255,255,0)		//electric
global.material_colour[i++] = make_colour_rgb(255,230,190)		//wind
global.material_colour[i++] = make_colour_rgb(196,200,255)		//lunar
global.material_colour[i++] = make_colour_rgb(255,255,150)		//solar
global.material_colour[i++] = make_colour_rgb(160,0,15)		//flesh
global.material_colour[i++] = make_colour_rgb(109,8,160)		//ghost
global.material_colour[i++] = make_colour_rgb(170,255,0)		//plant
global.material_colour[i++] = make_colour_rgb(255,246,204)		//steel
global.material_colour[i++] = make_colour_rgb(50,38,15)		//rock
global.material_colour[i++] = make_colour_rgb(127,120,102)		//furry
global.material_colour[i++] = make_colour_rgb(250,0,255)		//mystic
global.material_colour[i++] = make_colour_rgb(165,165,255)		//ancient
global.material_colour[i++] = make_colour_rgb(166,170,121)		//shielded
global.material_colour[i++] = make_colour_rgb(12,12,127)		//marine
global.material_colour[i++] = make_colour_rgb(127,100,100)		//bird
global.material_colour[i++] = make_colour_rgb(211,2,103)		//cosmic
global.material_colour[i++] = make_colour_rgb(97,217,229)		//spike
global.material_colour[i++] = make_colour_rgb(186,255,240)		//frozen
global.material_colour[i++] = make_colour_rgb(162,204,95)		//insect
global.material_colour[i++] = make_colour_rgb(225,0,0)			//dragon
global.material_colour[i++] = make_colour_rgb(110,121,127)		//robotic
global.material_colour[i++] = make_colour_rgb(127,114,94)		//muddy
global.material_colour[i++] = make_colour_rgb(127,55,0)		//woody
global.material_colour[i++] = make_colour_rgb(255,255,255)		//none

#endregion

//////////////////////////////////

#region Attack setup

enum _ATTACK_TYPE {
	melee,
	range,
	aura,
	front,
	lunge,     // выпад
	mortar,    // ballistic traectory
	pool,
	cloud,
	wave,
	barrier,
	ray,
	swoop,
	pivot		// technical (no state reaction)
}

global.attack_type_text = undefined;
var i=0
global.attack_type_text[i++] = "melee"
global.attack_type_text[i++] = "range"
global.attack_type_text[i++] = "aura"
global.attack_type_text[i++] = "front"
global.attack_type_text[i++] = "lunge"
global.attack_type_text[i++] = "mortar"
global.attack_type_text[i++] = "pool"
global.attack_type_text[i++] = "cloud"
global.attack_type_text[i++] = "wave"
global.attack_type_text[i++] = "barrier"
global.attack_type_text[i++] = "ray"
global.attack_type_text[i++] = "swoop"

enum _ATTACK_AFFECT {
	friend	= 1,
	enemy	= 2,
	itself	= 4,
}

global.attack_affect_text = undefined;
global.attack_affect_text[_ATTACK_AFFECT.friend] = "friend"
global.attack_affect_text[_ATTACK_AFFECT.enemy ] = "enemy"
global.attack_affect_text[_ATTACK_AFFECT.itself] = "itself"

enum _ATTACK_TG {
	teleport    = 0,
	air			= 1,
	ground		= 2,
	underground = 4,
	all			= 7
}

global.attack_target_text = undefined;
global.attack_target_text[_ATTACK_TG.air	 	]  = "air"
global.attack_target_text[_ATTACK_TG.ground	]  = "ground"
global.attack_target_text[_ATTACK_TG.underground] = "underground"

enum _ATTACK_ROLE {
	debuff = 0,
	buff   = 1
}

enum _BULLET_PH {
	custom,
	soft,
	chain,
	piercer,
	bowl
}
global.bullet_physic_text = undefined;
var i = 0
global.bullet_physic_text[i++] = "(Custom) Save position"
global.bullet_physic_text[i++] = "Blow away by wind"
global.bullet_physic_text[i++] = "Chain reaction"
global.bullet_physic_text[i++] = "No collision"
global.bullet_physic_text[i++] = "Push players"

#endregion

//////////////////////////////////

#region States

enum _ABILITY_STATE {
	none,
	incineration,  // горение
	burn,          // ожог
	bleed,
	leech,
	poison,
	paralyze,
	powerup,       // +1 к атаке
	weak,
	speedup,       // +1 к ОД
	slowdown,
	trap,
	random_x,	   // случайное значение урона
	lulling,       // усыпление
	stun,          // ошеломление
	terror,        // ужас
	flee,          // escape.mid
	wastetime,
	disgust,
	target,
	loser,         // неуклюжесть
	knockdown,     // отдача. толчок с падением
	blast,
	revenge,
	kamikaze,
	mindcontrol,   // гипноз
	confusion,     // смущение
	telekinesis,
	teleport,
	meleeup,
	rangeup,
	heal,
	medicine,
	cure,
	clear,         // снятие эффектов
	confidence,    // уверенность
	reflect,
	block,
	dextery,	   // уклонение
	mutual,	
	wreck,
	barrier,
	count
}

global.ability_text = undefined;
i=1
global.ability_text[i++] = "incineration"  // горение*
global.ability_text[i++] = "burn"          // ожог - шрам*
global.ability_text[i++] = "bleed"			//*
global.ability_text[i++] = "leech"			//*
global.ability_text[i++] = "poison"		//*
global.ability_text[i++] = "paralyze"		//*
global.ability_text[i++] = "powerup"       // +1 к атаке *
global.ability_text[i++] = "weak"			//*
global.ability_text[i++] = "speedup"       // +1 к ОД*
global.ability_text[i++] = "slowdown"		//*
global.ability_text[i++] = "trap"			//*
global.ability_text[i++] = "random"		//*
global.ability_text[i++] = "lulling"       // усыпление*
global.ability_text[i++] = "stun"          // ошеломление*
global.ability_text[i++] = "terror"        // ужас*
global.ability_text[i++] = "flee"          // escape.mid *
global.ability_text[i++] = "wastetime"		// *
global.ability_text[i++] = "disgust"		// отвращение*
global.ability_text[i++] = "target"		//*
global.ability_text[i++] = "loser"         // неуклюжесть*
global.ability_text[i++] = "knockdown"     // отдача. толчок с падением*
global.ability_text[i++] = "blast"			// урон с отбрасыванием*
global.ability_text[i++] = "revenge"		//*
global.ability_text[i++] = "kamikaze"		//*
global.ability_text[i++] = "mindcontrol"   // гипноз
global.ability_text[i++] = "confusion"     // смущение*
global.ability_text[i++] = "telekinesis"	//*
global.ability_text[i++] = "teleport"		//*
global.ability_text[i++] = "meleeup"		//*
global.ability_text[i++] = "rangeup"		//*
global.ability_text[i++] = "heal"			//*
global.ability_text[i++] = "medicine"		//*
global.ability_text[i++] = "cure"			//*
global.ability_text[i++] = "clear"         // снятие эффектов*
global.ability_text[i++] = "confidence"    // уверенность*
global.ability_text[i++] = "reflect"		// рикошет*
global.ability_text[i++] = "block"			//*
global.ability_text[i++] = "dextery"		// уклонение*
global.ability_text[i++] = "mutual"		//*
global.ability_text[i++] = "wreck"			//*
global.ability_text[i++] = "barrier"		//*

global.state_object = undefined;
for (var i=0; i<_ABILITY_STATE.count-1; i++)
   global.state_object[i] = noone;

global.state_object[_ABILITY_STATE.incineration] = ob_state_incineration;  
global.state_object[_ABILITY_STATE.poison		] = ob_state_infestation;
global.state_object[_ABILITY_STATE.bleed		] = ob_state_bleeding;
global.state_object[_ABILITY_STATE.leech		] = ob_state_leech;
global.state_object[_ABILITY_STATE.paralyze	] = ob_state_paralyze;
global.state_object[_ABILITY_STATE.mutual		] = ob_state_mutual;
global.state_object[_ABILITY_STATE.barrier		] = ob_state_barrier;
global.state_object[_ABILITY_STATE.block		] = ob_state_blok;
global.state_object[_ABILITY_STATE.powerup		] = ob_state_powerup;
global.state_object[_ABILITY_STATE.weak		] = ob_state_weak;
global.state_object[_ABILITY_STATE.speedup		] = ob_state_speedup;
global.state_object[_ABILITY_STATE.slowdown	] = ob_state_slowdown;
global.state_object[_ABILITY_STATE.target		] = ob_state_target;
global.state_object[_ABILITY_STATE.loser		] = ob_state_loser;
global.state_object[_ABILITY_STATE.knockdown	] = ob_state_knockdown;
global.state_object[_ABILITY_STATE.blast		] = ob_state_blast;
global.state_object[_ABILITY_STATE.trap		] = ob_state_trap;
global.state_object[_ABILITY_STATE.wreck		] = ob_state_wreck;
global.state_object[_ABILITY_STATE.confusion	] = ob_state_confusion;
global.state_object[_ABILITY_STATE.dextery		] = ob_state_dextery;
global.state_object[_ABILITY_STATE.stun		] = ob_state_stun;
global.state_object[_ABILITY_STATE.terror		] = ob_state_terror;
global.state_object[_ABILITY_STATE.meleeup		] = ob_state_meleeup;
global.state_object[_ABILITY_STATE.rangeup		] = ob_state_rangeup;
global.state_object[_ABILITY_STATE.reflect		] = ob_state_reflect;
global.state_object[_ABILITY_STATE.disgust		] = ob_state_disgust;
global.state_object[_ABILITY_STATE.burn		] = ob_state_burn;
global.state_object[_ABILITY_STATE.heal		] = ob_state_heal;
global.state_object[_ABILITY_STATE.clear		] = ob_state_clear;
global.state_object[_ABILITY_STATE.confidence	] = ob_state_confidance;
global.state_object[_ABILITY_STATE.medicine	] = ob_state_medicine;
global.state_object[_ABILITY_STATE.cure		] = ob_state_cure;
global.state_object[_ABILITY_STATE.kamikaze	] = ob_state_kamikaze;
global.state_object[_ABILITY_STATE.lulling		] = ob_state_lulling;
global.state_object[_ABILITY_STATE.revenge		] = ob_state_revenge;
global.state_object[_ABILITY_STATE.flee		] = ob_state_flee;
global.state_object[_ABILITY_STATE.wastetime	] = ob_state_wastetime;
global.state_object[_ABILITY_STATE.teleport	] = ob_state_teleport;
global.state_object[_ABILITY_STATE.telekinesis	] = ob_state_telekinesis;
global.state_object[_ABILITY_STATE.mindcontrol	] = ob_state_mindcontrol;


#endregion

#region Level coefficients

enum _FORCE {
	paltry,
	frail,
	helpless,
	preferred,
	reliable,
	strong,
	selective,
	elite,
	legendary,
	incredible
}

global.force_text = undefined;
global.force_text[_FORCE.paltry	] = "Feeble"
global.force_text[_FORCE.frail		] = "Poor"
global.force_text[_FORCE.helpless	] = "Fragile"
global.force_text[_FORCE.preferred	] = "Wrothy"
global.force_text[_FORCE.reliable	] = "Stocky"
global.force_text[_FORCE.strong	] = "Strong"
global.force_text[_FORCE.selective	] = "Campion"
global.force_text[_FORCE.elite		] = "Elite"
global.force_text[_FORCE.legendary	] = "Legendary"
global.force_text[_FORCE.incredible] = "Incredible"

global.coef_force = undefined;
global.coef_force[_FORCE.paltry	] = 0.91
global.coef_force[_FORCE.frail		] = 0.95 
global.coef_force[_FORCE.helpless	] = 0.98 
global.coef_force[_FORCE.preferred	] = 1	
global.coef_force[_FORCE.reliable	] = 1.03 
global.coef_force[_FORCE.strong	] = 1.07 
global.coef_force[_FORCE.selective	] = 1.12 
global.coef_force[_FORCE.elite		] = 1.18 
global.coef_force[_FORCE.legendary	] = 1.25
global.coef_force[_FORCE.incredible] = 1.33

global.coef_level = undefined;
global.coef_level[_FORCE.paltry	] = 0.045
global.coef_level[_FORCE.frail		] = 0.043
global.coef_level[_FORCE.helpless	] = 0.0418
global.coef_level[_FORCE.preferred	] = 0.041
global.coef_level[_FORCE.reliable	] = 0.04
global.coef_level[_FORCE.strong	] = 0.039
global.coef_level[_FORCE.selective	] = 0.038	
global.coef_level[_FORCE.elite		] = 0.0358
global.coef_level[_FORCE.legendary	] = 0.0343
global.coef_level[_FORCE.incredible] = 0.032

global.coef_lvlup = undefined;
global.coef_lvlup[_FORCE.paltry	] = 0.80
global.coef_lvlup[_FORCE.frail		] = 0.85 
global.coef_lvlup[_FORCE.helpless	] = 0.98 
global.coef_lvlup[_FORCE.preferred	] = 1.01
global.coef_lvlup[_FORCE.reliable	] = 1.05 
global.coef_lvlup[_FORCE.strong	] = 1.12 
global.coef_lvlup[_FORCE.selective	] = 1.23 
global.coef_lvlup[_FORCE.elite		] = 1.46 
global.coef_lvlup[_FORCE.legendary	] = 1.68
global.coef_lvlup[_FORCE.incredible] = 1.86

#endregion
//////////////////////////////////
enum _SIZE {
	tiny,
	normal,
	big,
	giant,
	immobile
}
global.size_text = undefined;
global.size_text[_SIZE.tiny	] = "tiny"
global.size_text[_SIZE.normal	] = "normal"
global.size_text[_SIZE.big		] = "big"
global.size_text[_SIZE.giant	] = "giant"
global.size_text[_SIZE.immobile] = "immobile"
//////////////////////////////////
enum _POSITION {
	underground,
	ground,
	fly
}
//////////////////////////////////
enum _HABITAT{
	amphibian,
	ground,
	water
}
enum _SURF_TYPE{
	surf_solid, // for ground
	surf_liquid, // for simple water
	surf_deepLiquid, // for ocean
	surf_abbyss // for hole
}
//////////////////////////////////
#region WEATHER
enum _WEATHER{
	none,
	clear,
	foggy,
	cloudy,
	rainy,
	stormy
}
//weather = irandom_range(_WEATHER.none, _WEATHER.stormy)
enum _FALLOUT_TYPE { //вид осадков: дождь снег ...
	none,
	rain,
	snow, // запрограммировано, но негде использовать
	ember
}
global.weather = undefined;
global.fallout = undefined;
global.is_pmTime = undefined;
global.weather = irandom_range(1,5)
global.fallout = irandom(1)
global.is_pmTime = irandom(1)

global.part_system_wind = undefined;
global.part_system_wind = part_system_create()
#endregion
//////////////////////////////////
global.trainer_inv_size = undefined;
global.previous_room = undefined;

global.popup_appeared = undefined;

//////////////////////////////////

global.trainer_preset = ds_map_create();
global.trainer_preset[? "avatar"]	= irandom(sprite_get_number(sp_trainer_avatar))   // image_index from sp_trainer_avatar

global.current_trainer = undefined;

global.trainer_fnames = array_create(0);
global.trainer_count = undefined;



global.pokemon_path = undefined; global.pokemon_path ="pokedex.ini";
global.pokemon_list = ds_map_create();
global.pokemon_list_count = undefined;
global.evolution_tree = undefined;

sc_load_trainer_fnames()

var _arr = 0
global.element_table = undefined;
global.element_table = array_create(_ELEMENTAL.count-1)
for (var i=0; i<array_length_1d(global.element_table); i++)
	global.element_table[i] = array_create(3, _ELEMENTAL.none)
_arr = 0
global.aura_table = undefined;
global.aura_table = array_create(_ELEMENTAL.count-1)
for (var i=0; i<array_length_1d(global.aura_table); i++)
	global.aura_table[i] = array_create(3, _ELEMENTAL.none)

ini_open(global.pokemon_path)
	ds_map_read(global.pokemon_list, ini_read_string("pokemons", "pokemon_list", ""))
	global.pokemon_list_count = ds_map_size(global.pokemon_list)
	// load element table =========================================================
	for (var i=0; i<array_length_1d(global.element_table); i++) {
		_arr = array_from_string( ini_read_string("element_table", string(i), "0"))
		global.element_table[i] = _arr
	}
	for (var i=0; i<array_length_1d(global.aura_table); i++) {
		_arr = array_from_string( ini_read_string("aura_table", string(i), "0"))
		global.aura_table[i] = _arr
	}
	//=============================================================================
	
	var _n = ds_map_find_first(global.pokemon_list)
	var _s = "", e
	while not is_undefined(_n) {
		_s = ini_read_string("evolution_tree", _n, "")
		if _s = "" 
			show_message(_n + " has no evolution info!")
		else {
			try {
				global.evolution_tree[? _n] = json_parse(_s)
			} catch(e) {
				show_message("Evolution info is corrupted for "+_n)
				//evolution_tree[? _n] = {children: []}
			} 
		}
		_n = ds_map_find_next(global.pokemon_list, _n);
	}
ini_close()

global.current_pokemon = undefined;

//////////////////////////////////
// saved slots

global.action_slot = array_create(0,0);
global.trainer_slot = array_create(0,0);

global.player1_trainer = ds_list_create();
global.player2_trainer = ds_list_create();
//globalvar neutral_trainer;
global.player1_trainer = noone; //sc_new_trainer()
global.player2_trainer = noone; //sc_new_trainer()
//neutral_trainer = sc_new_trainer()
//neutral_trainer[? "name"] = "Mad pokemon"


global.log_battle = undefined;
global.showing_particle_text = undefined;
global.maxchannel = undefined;
global.maxchannel = 7

audio_channel_num(global.maxchannel)
var _n = audio_get_listener_count()
var _info
for (var i=0; i<_n; i++) {
	_info = audio_get_listener_info(i)
	audio_set_master_gain(_info[? "index"], 0.2)
	ds_map_destroy(_info)
}

application_surface_enable(true)
gpu_set_texrepeat(true)

//gesture_drag_time(0.075)
//gesture_drag_distance()

enum custom {
	_health = 150, //custom 1st healt proferred force
	_dmg = 100,
}

#macro retreat_dist 200
#macro t_process_courage 10 // frames
#macro courage_max_regen 2 // 12 in 60 framerate
#macro max_distance_attack 180
#macro disposable_action_cooldown 60
#macro PixPerDist 18 // distance // 60 * 0.1 * 3

#macro frames_rate 60
#macro verbose_debug_mode false
